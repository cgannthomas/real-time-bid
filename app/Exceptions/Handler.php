<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Illuminate\Auth\AuthenticationException;

class Handler extends ExceptionHandler
{
    // ...

    protected function unauthenticated($request, AuthenticationException $exception)
    {
        // Return JSON if request expects JSON or is an API route
        if ($request->expectsJson() || $request->is('api/*')) {
            return response()->json(['message' => 'Unauthenticated.'], 401);
        }

        // fallback (optional)
        return redirect()->guest(route('login')); // won't trigger in API
    }
}
