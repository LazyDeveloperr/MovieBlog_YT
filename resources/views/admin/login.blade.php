<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <title>Login | LazyDeveloperr</title>
</head>
<body>
    <div class="container-fluid d-flex" style="height: 100vh">
        <div class="container-fluid justify-content-center align-items-center d-flex h-100" >
            <div class="row justify-content-center align-items-center w-100">
                <div class="col-12 col-lg-5 col-md-10 ">
                    <div class="card  justify-content-center">
                        <div class="card-header text-center">
                            <h3 style="letter-spacing: 2px">Admin Login</h3>
                        </div>
                        <div class="card-body">
                            <form action="" method="post">
                                @csrf
                               <div class="">
                                    <label for="">Email</label>
                                    <input type="email" name="email" value="{{old('email')}}" class="form-control"/>
                                    @error('email')
                                        <p class="text-error text-danger">{{ $message }}</p>
                                    @enderror
                               </div>
                               <div class="mt-3">
                                    <label for="">Password</label>
                                    <input type="password" name="password" value="{{old('password')}}" class="form-control"/>
                                    @error('password')
                                        <p class="text-error text-danger"> {{ $message }}</p>
                                    @enderror
                               </div>
                               <div class="justify-content-center align-items-center w-100 d-flex">
                                <button type="submit" class="btn btn-outline btn-success mt-3 px-3 text-white" >Login</button>
                               </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script>
        var msg = '{{Session::get('alert')}}';
        var exist = '{{Session::has('alert')}}';
        if(exist){
            alert(msg);
        }
    </script>
</body>
</html>