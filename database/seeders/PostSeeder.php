<?php

namespace Database\Seeders;

use App\Models\Post;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            "title" => "This is my title",
            "date" => "0000",
            "description" => "zzzz",
            "category_id" => "1",
            "video_type" => "zzzz",
            "thumbnail" => "zzzz",
            "meta_title" => "zzzz",
            "meta_description" => "zzzz",
            "meta_keywords" => "zzzz",
        ];
        Post::create($data);
    }
}
