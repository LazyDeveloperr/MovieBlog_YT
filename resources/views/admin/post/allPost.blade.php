@extends('admin.layout.base')

@section('title')
    Posts
@endsection

@section('contents')
    
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Posts</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Posts</li>
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
                  All Posts
                </div>
              </div>
              <div class="p-lg-5 gap-4 m-lg-5 m-0  justify-content-center align-items-center flex">
                <div class="row justify-content-center  align-items-center ">
                    <div class="col-lg-5 col-12 p-4 text-center bg-warning ">
                      <h2>
                        All Posts
                      </h2>
                    </div>
                  </div>
                <table class="table table-bordered table-stripped table-dark">
                    <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th class="text-center">Post Title</th>
                            <th class="text-center">Category</th>
                            <th class="text-center">status</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($allposts as $item)
                        <tr>
                            <th class="text-center">{{ $item->id }}</th>
                            <td class="text-center">{{$item->title}}</td>
                            <td class="text-center">{{$item->category_id}}</td>
                            <td class="text-center">{{$item->status}}</td>
                            <td class="text-center">
                                <a href="{{route('post.edit', $item->id)}}" class="fa fa-edit mx-1"></a>
                                <a href="{{route('post.delete', $item->id)}}" class="fa fa-trash mx-1"></a>
                                <a href="{{route('post.draft', $item->id)}}" class="btn btn-info btn-sm mx-2">Draft</a>
                            </td>
                        </tr>                            
                        @endforeach
                      </tbody>
                    </table>
                    {{$allposts->links()}}
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
 <!-- Bootstrap JavaScript Libraries -->
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
 integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
 integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
</script>
@endsection