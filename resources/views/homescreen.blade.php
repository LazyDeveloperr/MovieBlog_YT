@extends('layout.base')
@section('title')
    Homepage
@endsection
@section('contents')
    
    {{-- Cards --}}
    <div class="justify-center items-center border-t border-gray-400 sm:py-[1%] sm:px-[0.1%] px-[2%] sm:w-9/12">
        {{-- Content Title --}}
        <div class="">
            <h1 class="font-bold text-[30px] text-teal-600">Newly Arrived</h1>
        </div>

        {{-- Cards --}}
        <div class="flex grid lg:grid-cols-5 md:grid-cols-4 xl:grid-cols-5 grid-cols-2 gap-2 ">
            
            @foreach ($postData as $post)
            <div class="card border border-gray-200 shadow-lg rounded-3xl overflow-hidden">
                <div class="group card-body h-[250px] relative overflow-hidden">
                    <img class="h-full w-full group-hover:scale-125 transition ease-and-out duration-300" src="{{url('/thumbnails'.'/'. $post->thumbnail)}}" alt="card imges">
                    <div class="absolute right-0 top-12 px-2 text-[20px] rounded-tl-3xl rounded-bl-3xl font-semibold bg-gradient-to-r from-teal-600 to-gray-900 text-slate-50 ">
                        {{$post->video_type}}
                    </div>
                    <div class="absolute top-0 bottom-0 left-0 right-0 justify-center items-center hidden group-hover:flex">
                        <div class="w-[40%] h-[40%] flex">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-full text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                    </div>
                </div>
                <div class="card-footer p-2 ">
                    <a href="{{route('master.page', $post->slug)}}" class="line-clamp-5 font-semibold hover:underline underline-offset-1 hover:text-teal-600 ">
                        {{$post->title}}
                    </a>
                </div>
            </div>
            @endforeach


            
          
            

        </div>
        <div class="bg-green-500 !min-w-full">
            {{ $postData->links() }}
        </div>
    </div>



    <script>
        var titleElements = document.getElementsByClassName("mytitle");
      
        for (var i = 0; i < titleElements.length; i++) {
            var title = titleElements[i].textContent;
      
            if (title.length > 130) {
                titleElements[i].textContent = title.slice(0, 130)+"....";
            }
        }
      </script>

@endsection