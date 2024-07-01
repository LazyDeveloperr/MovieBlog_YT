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
