<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{

    /**
     * Display a listing of the resource.
     */

    public function allDrafts()
    {
        $allDrafts = Post::where('status' , 0)->paginate(50);
        return view('admin.post.drafts', compact('allDrafts'));
    }
    public function allPosts()
    {
        $allposts = Post::where('status', 1)->paginate(100);
        return view('admin.post.allPost', compact('allposts'));
    }
    public function makePublic($postId)
    {   $post = Post::findOrFail($postId);
        $post->update(['status' => 1]);
        return redirect()->back()->with('alert', 'Post Published Successfully 🎉');
    }
    public function makeDraft($postId)
    {   $post = Post::findOrFail($postId);
        $post->update(['status' => 0]);
        return redirect()->back()->with('alert', 'Post Added to Drafts Successfully 🎁');
    }
    public function tempDelete($postId)
    {   $post = Post::findOrFail($postId);
        $post->update(['status' => 2]);
        return redirect()->back()->with('alert', '🚮 Post moved to recycle bin 🚮');
    }
    public function permanentDelete($postId)
    {   $post = Post::findOrFail($postId);
        $post->delete();
        return redirect()->back()->with('alert', '🗑 Post deleted permanently 🗑');
    }

    // recycle post page

    public function openRecyclePostPage (Request $request)
    {
        $allposts = Post::where('status', 2)->paginate(20);
        return view('admin.recycle.post', compact('allposts'));
    } 
    /**
     * Show the form for creating a new resource.
     */

    public function createPost()
    {
        $data = Category::all();
        return view('admin.post.createPost', compact('data'));
    }

    public function createNewPost(Request $req)
    {
        $data = $req->validate([
            "title"=>"nullable",
            "date"=>"nullable",
            "video_type"=>"nullable",
            'category_id' => 'nullable|exists:categories,id',
            'movie_info' => 'nullable', // Upload movie's info
            'screenshots' => 'nullable', // Upload movie's screenshots
            'download_description' => 'required',
            "thumbnail"=>"nullable|image|mimes:jpeg,png,gif,svg",
            "meta_title"=>"nullable",
            "meta_description"=>"nullable",
            "meta_keywords"=>"nullable",
        ]);

        // for thumbnail 
        if($req->hasFile('thumbnail')){
            $imageName = time() . '.' . $req->thumbnail->getClientOriginalExtension();
            $req->thumbnail->move(public_path('/thumbnails'), $imageName);
            $data['thumbnail']=$imageName;
        }
        // if($data['screenshots']){
        //     $description = $data['screenshots'];

        //     $dom = new \DomDocument();
        //     libxml_use_internal_errors(true); // Suppress any potential HTML parsing errors
        //     $dom->loadHtml($description, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
    
        //     $images = $dom->getElementsByTagName('img');
    
        //     foreach ($images as $key => $img) {
        //         $imageData = base64_decode(explode(',', explode(';', $img->getAttribute('src'))[1])[1]);
        //         $image_name = "/upload/" . time() . $key . '.png';
        //         file_put_contents(public_path() . $image_name, $imageData);
    
        //         $img->removeAttribute('src');
        //         $img->setAttribute('src', $image_name);
        //     }
    
        //     $description = $dom->saveHTML();
        //     $data['screenshots'] = $description;
        // }
        // Handle image uploads in the description field
        $screenshots = $data['screenshots'];
        $dom = new \DomDocument();
        libxml_use_internal_errors(true); // Suppress any potential HTML parsing errors
        $dom->loadHtml($screenshots, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);

        $images = $dom->getElementsByTagName('img');

        foreach ($images as $index => $image) {
            $imageSrc  = $image->getAttribute('src');
            list($type, $imageSrc ) = explode(';', $imageSrc );
            list(, $imageSrc ) = explode(',', $imageSrc );
            $imageData = base64_decode($imageSrc );

            $image_name = "/upload/" . time() . Str::random(10) . '.png';
            Storage::disk('public')->put($image_name, $imageData);

            $image->removeAttribute('src');
            $image->setAttribute('src', asset('storage' . $image_name));
        }

        $screenshots = $dom->saveHTML();
        $data['screenshots'] = $screenshots;
        Post::create($data);
        return redirect()->route('post.all')->with("success","Post created successfully");

    }

    /**
     * Store a newly created resource in storage.
     */
    public function editPost($id)
    {   
        
        $data = Post::where('id', $id)->first();
        $cats = Category::all();
        return view('admin.post.editPost', compact('data', 'cats'));
    }

    /**
     * Display the specified resource.
     */
    public function updatePost(Request $request, $id)
    {
        $data = $request->validate([
            "title" => "nullable",
            "date" => "nullable",
            "video_type" => "nullable",
            'category_id' => 'nullable|exists:categories,id',
            'movie_info' => 'nullable',
            'screenshots' => 'nullable', // Ensure screenshots field is nullable
            'download_description' => 'required',
            "thumbnail" => "nullable|image|mimes:jpeg,png,gif,svg",
            "meta_title" => "nullable",
            "meta_description" => "nullable",
            "meta_keywords" => "nullable",
        ]);
    
        $post = Post::findOrFail($id);
    
        // Handle thumbnail update
        if ($request->hasFile('thumbnail')) {
            $existingImage = $post->thumbnail;
            $imagePath = public_path('/thumbnails' . '/' . $existingImage);
    
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
    
            $imageName = time() . '.' . $request->thumbnail->getClientOriginalExtension();
            $request->thumbnail->move(public_path('/thumbnails'), $imageName);
            $data['thumbnail'] = $imageName;
        }
    
        // Handle screenshots update
        if (isset($data['screenshots'])) {
            // Check if screenshots field has a value
            if ($data['screenshots']) {
                $screenshots = $data['screenshots'];

                $dom = new \DomDocument();
                libxml_use_internal_errors(true); // Suppress any potential HTML parsing errors
                $dom->loadHtml($screenshots, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
        
                $images = $dom->getElementsByTagName('img');
    
                foreach ($images as $index => $image) {
                    if(strpos($image->getAttribute('src'),'data:image/') ===0){
                        $imageSrc = $image->getAttribute('src');
                        list($type, $imageSrc) = explode(';', $imageSrc);
                        list(, $imageSrc) = explode(',', $imageSrc);
                        $imageData = base64_decode($imageSrc);
        
                        $image_name = 'upload/' . time() . Str::random(10) . '.png';
                        Storage::disk('public')->put($image_name, $imageData);
        
                        $image->removeAttribute('src');
                        $image->setAttribute('src', asset('storage/' . $image_name));
                    }
                    
                }
    
                $screenshots = $dom->saveHTML();
                $data['screenshots'] = $screenshots;
            } else {
                // If screenshots field is empty, set it to null or any default value
                $data['screenshots'] = null; // Or set to any default value as per your application logic
            }
        } else {
            // If screenshots field is not set in the form, set it to null or any default value
            $data['screenshots'] = null; // Or set to any default value as per your application logic
        }
    
        // Update the post with the validated data
        $post->update($data);
    
        return redirect()->back()->with('alert', 'Post Updated Successfully');
    }
    

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
        //
    }
}

// {{-- first free Movie Blog Project - Credit @LazyDeveloeprr --}}

// {{-- This code is completely free and belongs to **[LazyDeveloper's fans]** property. It is strictly prohibited to sell this code by making small modifications. That is why please do not try to sell the code, legal action will be taken if caught. --}}