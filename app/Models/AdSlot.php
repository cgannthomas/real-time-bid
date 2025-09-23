<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class AdSlot extends Model
{
    use HasFactory;
    protected $fillable = [
        'name','start_time','end_time',
        'minimum_bid_price','status','winner_bid_id'
    ];

    protected $casts = [
        'start_time' => 'datetime',
        'end_time' => 'datetime',
        'minimum_bid_price' => 'decimal:2',
        'status' => 'string'
    ];

    public function bids(): HasMany
    {
        return $this->hasMany(Bid::class);
    }

    public function winner()
    {
        return $this->hasOne(Winner::class);
    }
}
