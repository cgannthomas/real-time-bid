<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreSlotsRequest extends FormRequest
{
    public function authorize()
    {
        // Only allow admins
        return $this->user()?->is_admin === 1;

    }

    public function rules()
    {
        return [
            'name' => [
                'required',
                'string',
                'max:255',
                Rule::unique('ad_slots')->ignore($this->slot_id)
            ],
            'start_time' => ['required', 'date'],
            'end_time'   => ['required', 'date', 'after:start_time'],
            'minimum_bid_price' => [
                    'required',
                    'numeric',
                    'gt:1',      // greater than 1
                    'lt:100',    // less than 100
                ]
        ];
    }

    public function messages()
    {
        return [
            'name.unique' => 'The slot name already exists. Kindly use a different name.'
        ];
    }

    public function attributes()
    {
        return [];
    }
}
