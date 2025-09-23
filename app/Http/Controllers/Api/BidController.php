<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\BidService;
use App\Http\Requests\PlaceBidRequest;

class BidController extends Controller
{
    public function __construct(
        BidService $bidService
    ) {
        $this->bidService = $bidService;
    }

    public function place(PlaceBidRequest $request, $adSlotId)
    {
        return $this->bidService->place($request, $adSlotId);
    }

    public function history()
    {
        return $this->bidService->history();
    }
}
