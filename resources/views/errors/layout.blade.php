{{-- Illuminate/Foundation/Exceptions/views --}}
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>@yield('title')</title>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <!-- Styles -->
  <style>
    html,
    body {
      background-color: #fff;
      color: #636b6f;
      font-family: Arial, Helvetica, sans-serif;
      font-weight: 100;
      height: 100vh;
      margin: 0;
      width: 100%;
      height: 100%;
      overflow: scroll;
    }

    .full-height {
      height: 100vh;
    }

    .flex-center {
      align-items: center;
      display: flex;
      justify-content: center;
    }

    .position-ref {
      position: relative;
    }

    .content {
      text-align: center;
    }

    .title {
      font-size: 36px;
      padding: 20px;
    }
  </style>
</head>

<body>
  <div class="flex-center position-ref full-height">
    <div class="content">
      <div class="title">
        @yield('message')
      </div>
    </div>
  </div>
</body>

</html>