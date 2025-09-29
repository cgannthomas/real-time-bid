<?php

namespace App\Services;

use App\Http\Requests\PlaceBidRequest;
use App\Jobs\ProcessBidJob;
use App\Models\AdSlot;
use App\Models\Bid;
use Illuminate\Support\Facades\Auth;
use Log;
class BidService
{
    public function place($request, $adSlotId)
    {
        $user = Auth::user();
        $slot = AdSlot::findOrFail($adSlotId);

        // Quick checks before queueing
        if ($slot->status !== 'open') {
            return response()->json(['message' => 'Slot is not open for bidding'], 400);
        }

        if ($request->amount < $slot->minimum_bid_price) {
            return response()->json(['message' => 'Bid below minimum price'], 400);
        }

        if(Bid::where('user_id', $user->id)->where('ad_slot_id', $slot->id)->exists()) {
            return response()->json(['message' => "Looks like you've already placed a bid!"], 400);
        }
        // Queue the bid processing for concurrency & throughput
        ProcessBidJob::dispatch($user->id, $slot->id, $request->amount);

        return response()->json(['message' => 'Bid received and queued'], 202);
    }

    public function history()
    {
        $bids = Auth::user()->bids()->with('slot')->orderBy('created_at','desc')->get();
        return response()->json($bids);
    }
}
