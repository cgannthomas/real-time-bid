<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AdSlotController;
use App\Http\Controllers\Api\BidController;
use App\Http\Controllers\AuthController;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::post('/sanctum/token', [AuthController::class, 'login']); // simple token login

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/ad-slots', [AdSlotController::class,'index']);
    Route::get('/ad-slots/{id}', [AdSlotController::class,'show']);
    Route::get('/ad-slots/{id}/bids', [AdSlotController::class,'bids']);
    Route::get('/ad-slots/{id}/winner', [AdSlotController::class,'winning']);

    Route::post('/ad-slots/{id}/bid', [BidController::class,'place']);
    Route::get('/me/bids', [BidController::class,'history']);
});

// Admin routes (optional) -> secure these with gate/role middleware
// Route::middleware(['auth:sanctum','can:admin'])->group(function () {
//     Route::post('/admin/ad-slots', [\App\Http\Controllers\Api\AdminAdSlotController::class,'store']);
// });
