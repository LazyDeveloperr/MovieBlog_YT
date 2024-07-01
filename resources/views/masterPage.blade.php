@extends('layout.base')
@section('title')
    {{$data->title}}
@endsection
@section('contents')
    <div class="sm:flex !w-full justify-center sm:px-[10%] lg:px-[12%] px-[5%]">
      <div class="sm:text-[30px] sm:w-9/12 lg:text-[30px] p-3 text-lg  font-bold ">
        <div class="border-b p-2 shadow-sm bg-clip-text text-transparent bg-gradient-to-r from-[red] to-violet-500">
            {{ $data->title }}
        </div>
        <div class="mt-3">
          <div class="justify-center items-center flex sm:m-5 w-full">
            <article class="overflow-hidden items-center justify-center flex rounded-lg transition">
              <div class="w-[70%] lg:w-[60%] shadow shadow-lg shadow-gray-700  sm:max-h-full justify-center flex overflow-hidden object-cover">
                <img
                alt="logo"  
                src="{{url('/thumbnails'.'/'.$data->thumbnail)}}"
                class="rounded-t-[10px] sm:w-full w-[100%] flex sm:object-cover"
                />
              </div>
            </article>
          </div>

          <p>
            {!! $data->movie_info !!}
          </p>
            <p class=" content-wrapper flex flex-wrap w-full">
              {{-- screenshots template --}}
                <span class="w-full object-cover ">
                  @if ($data->screenshots)
                      @php
                        $dom = new \DomDocument();
                        libxml_use_internal_errors(true); // Suppress any potential HTML parsing errors
                        $dom->loadHtml($data->screenshots, LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD);
                    
                        // Get all images in the HTML
                        $images = $dom->getElementsByTagName('img');
                        $imageSources = [];
                    
                        // Extract src attributes from each img tag
                        foreach ($images as $item) {
                            $src = $item->getAttribute('src');
                            $imageSources[] = $src;
                        }
                      @endphp
                  @endif
                  @if ($data->screenshots)
                    @foreach ($imageSources as $src)
                      <figure class="image">
                          <img class="min-w-full mb-2" src="{{$src}}">
                      </figure>
                    @endforeach
                  @else
                      <!-- Handle the case where screenshots are null -->
                      <p class="sm:text-2xl lg:text-2xl text-lg font-extrabold text-slate-100/80">❌ .No screenshots available. ❌</p>
                  @endif
              </span>
                    
          </p>

          <div class="w-full justify-center items-center flex flex-col">
            <p class="">
              {!!$data->download_description!!}
            </p>
          </div>
        </div>
      </div>

      <div class="sm:w-3/12 flex sm:py-[2%] py-[2%] flex flex-wrap border border-2 shadow-lg">
          <div class="card flex w-full">
            {{-- <div class="card-header font-bold text-[29px] text-center justify-center items-center text-black ">Join me on </div> --}}
            <div class="card-body font-semibold p-3 w-full ">
                <div class="items-center bg-blue-400 w-full flex mb-2 p-2">
                  <a href="{{env('TELEGRAM_URL')}}">
                    <h1 class="sm:text-xl lg:text-xl xl:text-xl text-md text-start items-center font-bold dark:text-white w-full ms-3 "> <i class="fa-brands fa-telegram text-xl"></i> Telegram <span class="sm:hidden font-semibold"> : Join our channels!</span> </h1>
                  </a>
                </div>
                <div class="items-center bg-[#ce2d4f] w-full flex mb-2 p-2">
                  <a href="{{env('INSTAGRAM_URL')}}">
                    <h1 class="sm:text-xl lg:text-xl xl:text-xl text-md text-start items-center font-bold dark:text-white w-full ms-3 "> <i class="fa-brands fa-instagram text-xl"></i> Instagram <span class="sm:hidden font-semibold"> : Follow us on instagram!</span> </h1>
                  </a>
                </div>
                <div class="items-center bg-[#30343f] w-full flex mb-2 p-2">
                  <a href="{{env('GITHUB_URL')}}">
                    <h1 class="sm:text-xl lg:text-xl xl:text-xl text-md text-start items-center font-bold dark:text-white w-full ms-3 "> <i class="fa-brands fa-github text-xl"></i> Github <span class="sm:hidden font-semibold"> : Follow us github!</span> </h1>
                  </a>
                </div>
                
                <div class="items-center bg-[red] w-full flex mb-2 p-2">
                  <a href="{{env('YOUTUBE_URL')}}">
                    <h1 class="sm:text-xl lg:text-xl xl:text-xl text-md text-start items-center font-bold dark:text-white w-full ms-3 "> <i class="fa-brands fa-youtube text-xl"></i> YouTube <span class="sm:hidden font-semibold"> : Subscribe our Channel!</span> </h1>
                  </a>
                </div>
  
                <div class="divider w-full flex border-t-2 border-[white] my-2"></div>
                      @php
                        $latestPost = DB::table('posts')->where('status', 1)->limit(25)->get();
                    @endphp   
                <div class="items-center w-full flex mb-2 p-2 flex flex-col">
                  <h1 class="sm:text-xl lg:text-xl xl:text-xl text-md text-start items-center font-bold dark:text-black w-full -ms-1 "> <i class="fa-solid fa-photo-film text-2xl"></i> Recent Movies  </h1>
                  <ul>
                        @foreach ($latestPost as $ltp)
                              <li class="text-sm/relaxed dark:text-black text-black line-clamp-3 hover:text-[teal] hover:underline border-b border-gray-800">
                                  <a href="{{ route('master.page', $ltp->slug) }}" class="min-w-full "> 
                                      <span>
                                         ⚡
                                      </span>
                                      {{ $ltp->title }} 
                                  </a>
                              </li>
                          @endforeach
  
                  </ul>
                </div>
                
                
  
  
                
            </div>
        </div>
  
  
  
      </div>
    </div>
@endsection