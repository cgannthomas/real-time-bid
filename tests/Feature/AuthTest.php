<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;

class AuthTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_the_application_returns_a_successful_response(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }

    public function test_user_can_login_with_valid_credentials()
    {
        $user = User::factory()->create([
        'password' => bcrypt('password')
        ]);


        $response = $this->postJson('/api/sanctum/token', [
        'email' => $user->email,
        'password' => 'password'
        ]);


        $response->assertStatus(200)->assertJsonStructure(['token', 'user']);
    }


    public function test_user_cannot_login_with_invalid_credentials()
    {
        $response = $this->postJson('/api/sanctum/token', [
        'email' => 'wrong@example.com',
        'password' => 'wrongpass'
        ]);


        $response->assertStatus(401)->assertJson(['message' => 'Invalid credentials']);
    }
}
