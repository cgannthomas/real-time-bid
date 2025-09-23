<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use App\Models\AdSlot;
use App\Jobs\ProcessBidJob;
use Illuminate\Support\Facades\Queue;
use Laravel\Sanctum\Sanctum;

class BidTest extends TestCase
{
    public function test_place_bid_queues_job()
    {
        Queue::fake();


        $user = User::factory()->create();
        $slot = AdSlot::factory()->create(['status'=>'open','minimum_bid_price'=>10]);
        Sanctum::actingAs($user);


        $response = $this->postJson('/api/ad-slots/'.$slot->id.'/bid', ['amount'=>15]);


        $response->assertStatus(202)->assertJson(['message'=>'Bid received and queued']);


        Queue::assertPushed(ProcessBidJob::class, function ($job) use ($user, $slot) {
            return $job->userId === $user->id && $job->slotId === $slot->id && $job->amount == 15;
        });
    }


    public function test_bid_below_minimum_is_rejected()
    {
        $user = User::factory()->create();
        $slot = AdSlot::factory()->create(['status'=>'open','minimum_bid_price'=>10]);
        Sanctum::actingAs($user);


        $response = $this->postJson('/api/ad-slots/'.$slot->id.'/bid', ['amount'=>5]);
        $response->assertStatus(400)->assertJson(['message'=>'Bid below minimum price']);
    }
    public function test_bid_on_closed_slot_is_rejected()
    {
        $user = User::factory()->create();
        $slot = AdSlot::factory()->create(['status'=>'closed','minimum_bid_price'=>10]);
        Sanctum::actingAs($user);


        $response = $this->postJson('/api/ad-slots/'.$slot->id.'/bid', ['amount'=>15]);
        $response->assertStatus(400)->assertJson(['message'=>'Slot is not open for bidding']);
    }
}
