<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Services\AdminAdSlotsService;
use App\Http\Requests\Admin\StoreSlotsRequest;

class AdminAdSlotController extends Controller
{
    public function __construct(
        AdminAdSlotsService $slotService
    ) {
        $this->slotService = $slotService;
    }

    public function store(StoreSlotsRequest $request)
    {
        return $this->slotService->store($request);
    }
}
