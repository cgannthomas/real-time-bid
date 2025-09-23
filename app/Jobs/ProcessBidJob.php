<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use App\Models\Bid;
use App\Models\AdSlot;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class ProcessBidJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $userId;
    public $slotId;
    public $amount;

    public function __construct($userId, $slotId, $amount)
    {
        $this->userId = $userId;
        $this->slotId = $slotId;
        $this->amount = $amount;
    }

    public function handle()
    {
        $slot = AdSlot::find($this->slotId);
        if (!$slot) return;
        // only accept if still open and meets minimum price
        if ($slot->status !== 'open' || $this->amount < $slot->minimum_bid_price) {
            return;
        }

        // Persist bid
        Bid::create([
            'user_id' => $this->userId,
            'ad_slot_id' => $this->slotId,
            'amount' => $this->amount,
        ]);
    }
}
