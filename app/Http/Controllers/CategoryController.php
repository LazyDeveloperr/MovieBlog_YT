<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function allCats(Request $req){
        $data = Category::all();

        return view('admin.category.allCat', compact('data'));
    }
    public function createCat(Request $request)
    {
        return view('admin.category.createCat');
    }

    /**
     * Show the form for creating a new resource.
     */

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            "cat_name" => "required"
        ]);

        Category::create($data);

        return redirect()->back()->with('alert', "category created successfully");
    }

    /**
     * Display the specified resource.
     */

    public function editCat(Category $category, $id)
    {
        $data = Category::where('id', $id)->first();

        return view('admin.category.editCat', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function updateCat(Request $request)
    {
        $data = $request->validate([
            "cat_name" => "required"
        ]);

        $id = $request->id;
        Category::where('id', $id)->update($data);

        return redirect()->route('cat.all')->with('alert', 'Your Category has been upated successfully');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete(Request $req, $id)
    {
        Category::where('id', $id)->delete();
        
        return redirect()->route('cat.all')->with('alert' , 'category has been deleted successfully');
    }
}


// {{-- first free Movie Blog Project - Credit @LazyDeveloeprr --}}

// {{-- This code is completely free and belongs to **[LazyDeveloper's fans]** property. It is strictly prohibited to sell this code by making small modifications. That is why please do not try to sell the code, legal action will be taken if caught. --}}