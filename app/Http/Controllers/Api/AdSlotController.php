<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Services\AdSlotsService;

class AdSlotController extends Controller
{
    public function __construct(
        AdSlotsService $slotService
    ) {
        $this->slotService = $slotService;
    }

    public function index(Request $request)
    {
        return $this->slotService->index($request);
    }
    public function show($id)
    {
        return $this->slotService->show($id);
    }

    public function bids($id)
    {
        return $this->slotService->bids($id);
    }
    public function winning($id)
    {
        return $this->slotService->winning($id);
    }
}
