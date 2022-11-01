<?php

namespace App\Services\Auth;

use App\Models\User;
use Illuminate\Support\Facades\Hash;

class RegistrationAuth {
    /**
     * * Login user Service
     * @return void 
     */
    public function execute(array $data)
    {
        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);

        if(isset($user->id)) {
            return response()->json(['message' => 'Successfully login'], 200);
        } else {
            return abort(403, 'Error occur when registering an account');
        }
    }
}