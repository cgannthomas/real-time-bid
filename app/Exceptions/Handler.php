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
        if ($request->expectsJson() || $request->is('api/*')) {
            return response()->json(['message' => 'Unauthenticated Plesee.'], 401);
        }
        return redirect()->guest(route('login'));
    }

    public function render($request, Throwable $e)
    {
        // Authorization failure (Gate/Policy)
        if ($e instanceof AuthorizationException || $e instanceof AccessDeniedHttpException) {
            return response()->json([
                'message' => 'Admin access only. You are not authorized to perform this action.'
            ], 403);
        }

        // Optional: model not found for API
        if ($e instanceof \Illuminate\Database\Eloquent\ModelNotFoundException
            && $request->is('api/*')) {
            return response()->json(['message' => 'Resource not found.'], 404);
        }

        return parent::render($request, $e);

    }
}
