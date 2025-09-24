<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Services\LoginService;
use App\Http\Requests\LoginRequest;

class AuthController extends Controller
{
    public function __construct(
        LoginService $logService
    ) {
        $this->logService = $logService;
    }
    public function login(LoginRequest $request)
    {
        return $this->logService->login($request);
    }

    public function logout(Request $request)
    {
        // Revoke only the current access token
        $request->user()->currentAccessToken()->delete();
        // $request->user()->tokens()->delete(); //logout from all devices
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }
}
