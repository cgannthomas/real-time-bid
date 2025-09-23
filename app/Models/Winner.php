<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Winner extends Model
{
    protected $fillable = [
        'ad_slot_id',
        'bid_id',
        'user_id',
        'amount'
    ];

    public function slot()
    {
        return $this->belongsTo(AdSlot::class, 'ad_slot_id');
    }

    public function bid()
    {
        return $this->belongsTo(Bid::class, 'bid_id');
    }
}
