<?php

namespace App\Services;

use Auth;
use App\Models\AdSlot;

class AdSlotsService
{
    public function index($request)
    {
        $query = AdSlot::query();

        if ($request->filled('status')) {
            $query->where('status', \strtolower($request->status));
        }
        return response()->json($query->orderBy('start_time','asc')->paginate(20));
    }
    public function show($id)
    {
        $slot = AdSlot::with('bids')->findOrFail($id);
        return response()->json($slot);
    }

    public function bids($id)
    {
        $slot = AdSlot::findOrFail($id);
        return response()->json($slot->bids()->with('user')->orderBy('amount','desc')->get());
    }
    public function winning($id)
    {
        $slot = AdSlot::with('winner.bid.user')->findOrFail($id);
        
        if ($slot->status !== 'awarded') {
            return response()->json(['message' => 'Slot not awarded yet'], 404);
        }
        return response()->json($slot->winner);
    }
}
