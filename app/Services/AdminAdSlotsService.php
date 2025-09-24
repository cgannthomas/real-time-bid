<?php

namespace App\Services;

use Auth;
use App\Models\AdSlot;
use Carbon\Carbon;

class AdminAdSlotsService
{
    public function store($request)
    {
        if($request->slot_id) {
            $slotStatus = AdSlot::find($request->slot_id)->status;

            if($slotStatus == 'awarded')
                return response()->json(['message' => "You cannot make changes because this has already been awarded."],403);
        }
        $startTime = Carbon::parse($request->start_time);
        $endTime   = Carbon::parse($request->end_time);
        $now       = now();

        // Determine status
        if ($now->lt($startTime)) {
            $status = 'upcoming';   // current time is before start_time
        } elseif ($now->between($startTime, $endTime)) {
            $status = 'open';       // current time is between start_time and end_time
        } else {
            $status = 'closed';     // current time is after end_time
        }
        // Update or create record
        $slot = AdSlot::updateOrCreate(
            ['id' => $request->slot_id ?? 0],
            [
                'name' => $request->name,
                'start_time' => $startTime,
                'end_time'   => $endTime,
                'status'     => $status,
            ]
        );
        $message = $request->slot_id ? 'updated' : 'created';
        return response()->json(['message' => "Slot {$message} successfully"]);
    }
}
