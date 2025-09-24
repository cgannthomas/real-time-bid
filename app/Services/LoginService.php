<?php

namespace App\Services;

use Auth;
use Log;
class LoginService
{
    public function login($request)
    {
        if (!Auth::attempt($request->only('email','password'))) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        $user = Auth::user();
        Log::info($user->id);
        $token = $user->createToken('api-token')->plainTextToken;

        return response()->json(['token' => $token, 'user' => $user]);
    }
}
