<?php

namespace App\Providers;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {   

        view()->share('countPost',Post::all()->count());
        view()->share('countDraftPost',Post::where('status', 0)->count());
        view()->share('countPublicPost',Post::where('status', 1)->count());
        view()->share('countDeletedPost',Post::where('status', 2)->count());

        view()->share('countCategory',Category::all()->count());


    }
}

// {{-- first free Movie Blog Project - Credit @LazyDeveloeprr --}}

// {{-- This code is completely free and belongs to **[LazyDeveloper's fans]** property. It is strictly prohibited to sell this code by making small modifications. That is why please do not try to sell the code, legal action will be taken if caught. --}}