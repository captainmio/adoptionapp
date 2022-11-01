<?php

namespace App\Http\Controllers;

use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegistrationRequest;
use App\Services\Auth\LoginAuth;
use App\Services\Auth\RegistrationAuth;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function login(LoginRequest $request, LoginAuth $LoginAuth) {
        return $LoginAuth->execute($request->validated());
    }

    public function register(RegistrationRequest $request, RegistrationAuth $RegistrationAuth) {
        return $RegistrationAuth->execute($request->validated());
    }
}
