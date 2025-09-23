<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use App\Models\AdSlot;
use Laravel\Sanctum\Sanctum;

class AdSlotTest extends TestCase
{
    /**
     * A basic test example.
     */
    // public function test_the_application_returns_a_successful_response(): void
    // {
    //     $response = $this->get('/');

    //     $response->assertStatus(200);
    // }

    public function test_list_ad_slots()
    {
        AdSlot::factory()->count(3)->create();
        $user = User::factory()->create();
        Sanctum::actingAs($user);


        $response = $this->getJson('/api/ad-slots');
        $response->assertStatus(200)->assertJsonStructure(['data','links','meta']);
    }


    public function test_view_single_slot()
    {
        $slot = AdSlot::factory()->create();
        $user = User::factory()->create();
        Sanctum::actingAs($user);


        $response = $this->getJson('/api/ad-slots/'.$slot->id);
        $response->assertStatus(200)->assertJson(['id' => $slot->id]);
    }
}
