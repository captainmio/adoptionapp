<?php

namespace App\Services\Auth;

use App\Models\User;
use Illuminate\Support\Facades\Hash;

class LoginAuth {
    /**
     * * Login user Service
     * @return void 
     */
    public function execute($data)
    {
        $user = User::where('email', '=', $data['email'])->first();

        if($user && Hash::check($data['password'], $user->password)) {
            $token = $user->createToken('Personal Access Token')->plainTextToken;
            return response()->json(['message' => 'You are now logged in', 'user' => $user, 'token' => $token], 200);
        } else {
            return abort(403, 'Invalid credentials');
        }
    }
}