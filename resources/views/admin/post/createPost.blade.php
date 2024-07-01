@extends('admin.layout.base')
@section('title')
    Create Post
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
              <li class="breadcrumb-item active">Post</li>
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
                <form action="{{ route('post.new')}}" method="POST" enctype="multipart/form-data">
                  @csrf
                  <div class="row justify-content-center  align-items-center ">
                    <div class="col-lg-5 col-12 p-4 text-center bg-warning ">
                      <h2>
                        Add New Post
                      </h2> 
                    </div>
                    {{-- title --}}
                    <div class="col-lg-11 col-12 p-3 mt-5 ">
                      <label for="title">Post Title</label>
                      <input type="text" id="title" name="title" class="form-control " value="{{old('title')}}">
                      @error('title')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>

                    {{-- date --}}
                    <div class="col-lg-4 col-10 p-3  ">
                      <label for="date">Date</label>
                      <input type="date" id="date" name="date" class="form-control " value="{{old('date')}}">
                      @error('date')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>

                    {{-- Category --}}
                    <div class="col-lg-5 col-12 p-3  ">
                      <label for="category_id">Category</label>
                        <select name="category_id" id="category_id">
                          @foreach ($data as $item)
                          <option value="{{$item->id}}">{{$item->cat_name}}</option>
                          @endforeach  
                        </select>
                      @error('category_id')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>

                    {{-- video type --}}
                    <div class="col-lg-5 col-12 p-3  ">
                      <label for="video_type">Video Type(HD,Pre Dvd etc..)</label>
                      <input type="text" id="video_type" name="video_type" class="form-control " value="{{old('video_type')}}">
                      @error('video_type')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>

                    {{-- movie_info --}}
                    <div class="col-lg-11 col-12 p-3">
                      <label for="movie_info">Movie Information</label>
                      <textarea type="text" rows="18" id="editor" name="movie_info" class="form-control " value="{{old('movie_info')}}"></textarea>
                      @error('movie_info')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>
                    
                    {{-- screenshots --}}
                    <div class="col-lg-11 col-12 p-3  ">
                      <label for="screenshots" style="font-size: 30px">Screenshots</label>
                      <textarea type="text" rows="20" id="image_editor" name="screenshots" class="form-control " value="{{old('screenshots')}}"></textarea>
                      @error('screenshots')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>
                    {{-- download description --}}
                    <div class="col-lg-11 col-12 p-3">
                      <label for="download_description">Download Description</label>
                      <textarea type="text" rows="18" id="btn_editor" name="download_description" class="form-control " value="{{old('download_section')}}"></textarea>
                      @error('download_description')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>
                    {{-- thumbnail --}}
                    <div class="col-lg-11 col-12 p-3  ">
                      <label for="thumbnail">Thumbnail</label>
                      <input type="file"  id="thumbnail" name="thumbnail" class="form-control " value="{{old('thumbnail')}}">
                      @error('thumbnail')
                          <p class="text-danger">{{ $message }}</p>
                      @enderror
                    </div>

                    <div class="row w-100 mt-1 d-flex">
                        <div class="w-100 text-danger ">
                           😎 Seo Section
                        </div>
                        
                         {{-- meta_title --}}
                      <div class="col-lg-11 col-12 p-3  ">
                        <label for="meta_title">Meta Title</label>
                        <input type="text"  id="meta_title" name="meta_title" class="form-control " value="{{old('meta_title')}}">
                        @error('meta_title')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                      </div>

                         {{-- meta_description --}}
                      <div class="col-lg-11 col-12 p-3  ">
                        <label for="meta_description">Meta Description</label>
                        <textarea type="text"  id="meta_description" name="meta_description" class="form-control " value="{{old('meta_description')}}"></textarea>
                        @error('meta_description')
                            <p class="text-danger">{{ $message }}</p>
                        @enderror
                      </div>

                         {{-- meta_keywords --}}
                      <div class="col-lg-11 col-12 p-3  ">
                        <label for="meta_keywords">Meta Keywords</label>
                        <input type="text"  id="meta_keywords" name="meta_keywords" class="form-control " value="{{old('meta_keywords')}}">
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

@endsection