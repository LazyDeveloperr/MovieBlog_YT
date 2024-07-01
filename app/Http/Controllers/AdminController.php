<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{

    // {{-- first free Movie Blog Project - Credit @LazyDeveloeprr --}}

    // {{-- This code is completely free and belongs to **[LazyDeveloper's fans]** property. It is strictly prohibited to sell this code by making small modifications. That is why please do not try to sell the code, legal action will be taken if caught. --}}

    public function login(Request $request)
    {
        if($request->method() == "POST"){
            $data = $request->only(['email', 'password']);

            if(Auth::guard('admin')->attempt($data)){
                return redirect()->route('admin.dashboard');
            }else{
                return redirect()->back()->with("alert", "Please enter valid credentials");
            }
        }

        return view('admin.login');
    }

    public function index()
    {
        return view('admin/dashboard');
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('admin.login')->with('alert', '👮‍♂️ Logged OUT 🥱');

    }
    
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Admin $admin)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Admin $admin)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Admin $admin)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Admin $admin)
    {
//{{-- first free Movie Blog Project - Credit @LazyDeveloeprr --}}

// {{-- This code is completely free and belongs to **[LazyDeveloper's fans]** property. It is strictly prohibited to sell this code by making small modifications. That is why please do not try to sell the code, legal action will be taken if caught. --}}
    }
}
