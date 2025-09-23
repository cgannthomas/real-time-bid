<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
{
    public function authorize()
    {
        return true; // Allow everyone to hit this endpoint
    }

    public function rules()
    {
        return [
            'email' => 'required|email',
            'password'=> 'required'
        ];
    }

    public function messages()
    {
        return [];
    }

    public function attributes()
    {
        return [];
    }
}
