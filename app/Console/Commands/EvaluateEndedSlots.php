<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Jobs\EvaluateSlotJob;
use App\Models\AdSlot;
use Carbon\Carbon;

class EvaluateEndedSlots extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'rtb:evaluate-ended-slots';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Find ad slots that have ended and queue evaluation jobs';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $now = Carbon::now();
        $slots = AdSlot::where('end_time', '<=', $now)
            ->whereIn('status', ['open','closed'])
            ->get();

        foreach ($slots as $slot) {
            EvaluateSlotJob::dispatch($slot->id);
        }

        $this->info('Queued evaluation for: ' . $slots->count() . ' slot(s).');
    }
}
