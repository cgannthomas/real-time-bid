<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use App\Models\AdSlot;
use App\Models\Winner;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Support\Facades\DB;

class EvaluateSlotJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $slotId;

    /**
     * Create a new job instance.
     */
    public function __construct($slotId)
    {
        $this->slotId = $slotId;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
         // Use DB transaction + row lock to prevent race conditions
        DB::transaction(function () {
            // lock the ad_slot row
            $slot = DB::table('ad_slots')->where('id', $this->slotId)->lockForUpdate()->first();
            if (!$slot) return;

            if ($slot->status === 'awarded') return; // already processed

            // set closed if not already
            if ($slot->status !== 'closed' && $slot->status !== 'awarded') {
                DB::table('ad_slots')->where('id', $this->slotId)->update(['status' => 'closed']);
            }

            // fetch highest bid: amount DESC, created_at ASC for earliest in tie
            $highest = DB::table('bids')
                ->where('ad_slot_id', $this->slotId)
                ->orderByDesc('amount')
                ->orderBy('created_at')
                ->first();

            if (!$highest) {
                // no bids, just mark closed (already done)
                return;
            }

            // insert winner
            $winnerId = DB::table('winners')->insertGetId([
                'ad_slot_id' => $this->slotId,
                'bid_id' => $highest->id,
                'user_id' => $highest->user_id,
                'amount' => $highest->amount,
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            // update ad_slot to awarded and set winner_bid_id
            DB::table('ad_slots')->where('id', $this->slotId)->update([
                'status' => 'awarded',
                'winner_bid_id' => $highest->id,
                'updated_at' => now(),
            ]);
        });
    }
}
