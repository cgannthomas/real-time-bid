<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\AdSlot;
use Carbon\Carbon;

class UpdateSlotStatus extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'rtb:update-slot-status';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Set ad slot status based on start/end times';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $now = Carbon::now();

        // Upcoming -> Open
        AdSlot::where('status', 'upcoming')
            ->where('start_time', '<=', $now)
            ->update(['status' => 'open']);

        // Open -> Closed (when end_time passed)
        AdSlot::where('status', 'open')
            ->where('end_time', '<=', $now)
            ->update(['status' => 'closed']);

        // No return necessary
    }
}
