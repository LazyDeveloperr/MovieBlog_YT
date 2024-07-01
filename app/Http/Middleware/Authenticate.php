<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request): ?string
    {
        if($request->expectsJson()){
            return null;
        }else{
            if($request->is('admin') || $request->is('admin/*')){
                return route("admin.login");
            }else{
                return route('home');
            }
        };
    }
}


// {{-- first free Movie Blog Project - Credit @LazyDeveloeprr --}}

// {{-- This code is completely free and belongs to **[LazyDeveloper's fans]** property. It is strictly prohibited to sell this code by making small modifications. That is why please do not try to sell the code, legal action will be taken if caught. --}}