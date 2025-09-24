<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        // Create 10 random users
        User::factory()->count(10)->create();

        // Create a specific admin user
        User::create([
            'name' => 'Admin',
            'email' => 'admin@example.com',
            'password' => bcrypt('password'),
            'is_admin' => '1'
        ]);

        // Create a specific user
        User::create([
            'name' => 'User',
            'email' => 'user1@example.com',
            'password' => bcrypt('password'),
            'is_admin' => '0'
        ]);


    }
}
