<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index(Request $request)
    {   
        
        $query = $request->input('query');
        
        if(empty($query)){
            $postData = Post::where('status', 1)->paginate(20);
        }else{
            $postData = Post::where('status', 1)
                ->where( function($queryBuilder) use ($query){
                    $queryBuilder->where('title', 'like', '%'. $query . '%')
                                ->orWhere('description', 'like', '%'.$query.'%');
                })->paginate(20);
        }

        // $category = Category::all();
        return view('homescreen', compact('postData'));
    }
    public function filterByCategory($categoryName)
    {
        $query = $categoryName;
        $data = Category::where('cat_name', $categoryName)->first();

        // If category does not exist, return back
        if (!$data) {
            return redirect()->route('home')->with('alert', '⚠ Category not found ⚠');
        }else{
            $postData = $data->posts()->where('status', 1)->orderBy('created_at', 'desc')->paginate(20);
            return view('homescreen', compact('postData', 'query'));
        }

    }
    
    public function masterPage($slug)
    {
        $data = Post::where('slug', $slug)->first();

        return view('masterPage', compact('data'));
    }
}

// {{-- first free Movie Blog Project - Credit @LazyDeveloeprr --}}

// {{-- This code is completely free and belongs to **[LazyDeveloper's fans]** property. It is strictly prohibited to sell this code by making small modifications. That is why please do not try to sell the code, legal action will be taken if caught. --}}