<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\AdSlot;

class AdSlotSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        for ($i=1;$i<=5;$i++) {
            AdSlot::create([
                'name' => "Slot #{$i}",
                'start_time' => now()->addMinutes($i * 2),
                'end_time' => now()->addMinutes($i * 2 + 3),
                'minimum_bid_price' => 10.00,
                'status' => 'upcoming',
            ]);
        }
    }
}
