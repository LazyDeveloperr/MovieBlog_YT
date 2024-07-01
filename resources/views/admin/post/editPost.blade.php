@extends('admin.layout.base')
@section('title')
    Edit - {{$data->title}}
@endsection
@section('contents')
    
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Post</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Edit Post</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="">
            {{-- <p style="font-size: 40px; font-weight: bold;"> {{ $data->title }}</p> --}}
        </div>

        <div class="row">
          <div class="col-lg-12 col-11">
            <div class=" card w-100 ">
              <div class="card-header">
                <div class="car-title">
                  <i class="ion ion-clipboard mr-1"></i>
                  Fill form and submit
                </div>
              </div>
              <div class="p-lg-5 gap-4 m-lg-5 m-0  justify-content-center align-items-center flex">
                <form action="{{route('post.update', ['id'=>$data->id])}}" method="POST" enctype="multipart/form-data">
                  @csrf

                  <div class="row justify-content-center  align-items-center ">
                    <div class="col-lg-5 col-12 p-4 text-center bg-primary ">
                      <h2>
                        Edit Post
                      </h2>
                    </div>
                    {{-- title --}}
                    <div class="col-lg-11 col-12 p-3 mt-5 ">
                      <label for="title">Post Title</label>
                      <input type="text" id="title" name="title" class="form-control " value="{{$data->title}}">
                      @error('title')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>
                    
                    {{-- Category --}}
                    <div class="col-lg-3 col-12 p-3  ">
                      <label for="category">Category</label>
                      <select name="category" id="category">
                        @foreach ($cats as $item)
                          <option value="{{$item->id}}" {{$data->category_id == $item->id  ? 'selected' : ''}}>{{$item->cat_name}}</option>
                        @endforeach
                      </select>
                      @error('category')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>

                    {{-- video type --}}
                    <div class="col-lg-5 col-12 p-3  ">
                      <label for="video_type">Video Type(HD,Pre Dvd etc..)</label>
                      <input type="text" id="video_type" name="video_type" class="form-control " value="{{$data->video_type}}">
                      @error('video_type')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>

                    {{-- movie_info --}}
                    <div class="col-lg-11 col-12 p-3">
                      <label for="movie_info">Movie Information</label>
                      <textarea type="text" rows="18" id="editor" name="movie_info" class="form-control " value="{{old('movie_info')}}">{!! $data->movie_info !!}</textarea>
                      @error('movie_info')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>
                    
                    {{-- screenshots --}}
                    <div class="col-lg-11 col-12 p-3  ">
                      <label for="screenshots" style="font-size: 30px">Screenshots</label>
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
                      <textarea type="text" rows="20" id="image_editor" name="screenshots" class="form-control " value="{{old('screenshots')}}"> @if ($data->screenshots)
                        @foreach ($imageSources as $src)
                         <figure class="image">
                             <img style="aspect-ratio:800/333;"  src="{{$src}}">
                         </figure>
                         @endforeach
                        @endif
                      </textarea>
                      @error('screenshots')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>
                    {{-- download description --}}
                    <div class="col-lg-11 col-12 p-3">
                      <label for="download_description">Download Description</label>
                      <textarea type="text" rows="18" id="btn_editor" name="download_description" class="form-control " value="{{old('download_description')}}">{!! $data->download_description !!}</textarea>
                      @error('download_description')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>
                    {{-- thumbnail --}}
                    <div class="col-lg-11 col-12 p-3  ">
                      <label for="thumbnail">Thumbnail</label>
                      <input type="file"  id="image-input" name="thumbnail" class="form-control " value="{{$data->thumbnail}}">
                      @error('thumbnail')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>
                    <div class="flex">
                      <div class="flex flex-col">
                        <img  src="{{url('/thumbnails' .'/'. $data->thumbnail)}}" width="20%" height="auto" alt="img">
                        <div class="text-sm font-semibold">Current-Thumbnail</div>
                      </div>
                      <div class="flex flex-col">
                        <img id="image-preview" src="#" width="50%" height="auto" alt="img">
                        <div class="text-sm font-semibold">New-Thumbnail</div>
                      </div>
  
                    </div>
                    <div class="row w-100 mt-1 d-flex">
                        <div class="w-100 text-danger ">
                           😎 Seo Section
                        </div>
                        
                         {{-- meta_title --}}
                      <div class="col-lg-11 col-12 p-3  ">
                        <label for="meta_title">Meta Title</label>
                        <input type="text"  id="meta_title" name="meta_title" class="form-control " value="{{$data->meta_title}}">
                        @error('meta_title')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                      </div>

                         {{-- meta_description --}}
                      <div class="col-lg-11 col-12 p-3  ">
                        <label for="meta_description">Meta Description</label>
                        <textarea type="text"  id="meta_description" name="meta_description" class="form-control " value="{{old('meta_description')}}">{{$data->meta_description}}</textarea>
                        @error('meta_description')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                      </div>

                         {{-- meta_keywords --}}
                      <div class="col-lg-11 col-12 p-3  ">
                        <label for="meta_keywords">Meta Keywords</label>
                        <input type="text"  id="meta_keywords" name="meta_keywords" class="form-control " value="{{$data->meta_keywords}}">
                        @error('meta_keywords')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                      </div>

                    </div>
                  </div>
    
                  <div class="mt-2 col-lg-12 col-12 text-center justify-content-center align-items-center flex p-5">
                    <input type="submit" class="btn btn-success w-100 flex">
                  </div>
    
                </form>
              </div>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

  <script>
    var msg = Session::get('alert');
    var exist = Session::has('alert');

    if(exist){
      alert(msg);
    }
  </script>
<script>
  document.getElementById('image-input').addEventListener('change', function (e) {
      var preview = document.getElementById('image-preview');
      var fileInput = e.target;

      if (fileInput.files && fileInput.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              preview.src = e.target.result;
          };

          reader.readAsDataURL(fileInput.files[0]);
      }
  });
</script>
@endsection