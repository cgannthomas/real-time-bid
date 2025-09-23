<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bid extends Model
{
    protected $fillable = [
        'user_id',
        'ad_slot_id',
        'amount'
    ];

    public function slot()
    {
        return $this->belongsTo(AdSlot::class, 'ad_slot_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
