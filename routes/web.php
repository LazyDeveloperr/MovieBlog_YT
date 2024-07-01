<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('homescreen');
// }); 

Route::controller(HomeController::class)->group( function() {
    Route::get('/', 'index')->name('home');
    Route::get('view-post/{slug}', 'masterPage')->name('master.page');
    Route::get('/category/{categoryName}', 'filterByCategory')->name('home.filterByCategory');
});

Route::prefix("admin")->group( function () {
    Route::controller(AdminController::class)->group(function() {
        // LOGIN ROUTE
        Route::match(['get', 'post'], '/login' , 'login')->name('admin.login');
        Route::middleware('auth:admin')->group( function () {
            Route::get('/' , 'index')->name('admin.dashboard');
            Route::get('/logout', 'logout')->name('admin.logout');

            // category section 
            Route::controller(CategoryController::class)->group( function() {
                Route::get('/all-category' , 'allCats')->name('cat.all');
                Route::get('/create-category-page' , 'createCat')->name('cat.create');
                Route::get('/edit-category-page/{id}' , 'editCat')->name('cat.edit');
                Route::post('/update-category/{id}' , 'updateCat')->name('cat.update');
                Route::post('/store-category' , 'store')->name('cat.store');
                Route::get('/delete-category/{id}' , 'delete')->name('cat.delete');
            });
            Route::controller(PostController::class)->group( function() {
                Route::get('/all-drafts' , 'allDrafts')->name('draft.all');
                Route::get('/all-post' , 'allPosts')->name('post.all');
                Route::get('/create-post-page' , 'createPost')->name('post.create');
                Route::post('/create-post-page/create' , 'createNewPost')->name('post.new');
                Route::get('/edit-post-page/{id}', 'editPost')->name('post.edit');
                Route::post('/update-post/{id}', 'updatePost')->name('post.update');                
                Route::get('/make-public/{postId}', 'makePublic')->name('post.public');                
                Route::get('/make-draft/{postId}', 'makeDraft')->name('post.draft');                
                Route::get('/delete-post/{postId}', 'tempDelete')->name('post.delete'); 
                
                // recycle field
                Route::get('/recycle-post-page', 'openRecyclePostPage')->name('post.recycle');
                Route::get('/permanent-delete-post/{postId}', 'permanentDelete')->name('post.delete.permanent');                
            } );
        });

    });
});