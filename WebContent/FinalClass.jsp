<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>食物</title>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>食物</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/Class/class.css">

</head>
<style>
body {
    text-align: center;
    font-family: 'Noto Serif TC',
        serif;
    ;
}

/* KEYWORD */

div#keyword a {
    color: orange;
}

/* CAROUSEL */

.carousel-indicators li {
    width: 8px;
    height: 8px;
    border-radius: 50%;
}


/* FACTORY */

div#factory img {
    width: 100%;
}

/* SpecialFood */

div#SpecialFood img {
    width: 100%;
}

/* 塞選 */

div h3.select {
    background-color: orange;
    padding: 10px;
}





/* DELETE */

del {
    color: red;
}
</style>
<body>
    <!-- SEARCHBOX -->
    <div class="container">
        <div class="row">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="請輸入商品名字">
                <div class="input-group-append">
                    <button class="btn btn-secondary" type="button">
                        <svg class="bi bi-search" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
                            <path fill-rule="evenodd"
                                d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- Keyword -->
    <div class="container">
        <div class="row" id="keyword">

            <div class="col-sm-12 col-md-2">

                <a class="nav-link " href="#">經典狗狗美食</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link" href="#">好用寵物用品</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link" href="#">經典狗屋</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link " href="#">寵物飼料機</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link " href="#">攝像鏡頭</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link " href="#">貓倍麗</a>

            </div>

        </div>

        <!-- 輪播 -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="image/Carousel/Carousel.png" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="image/Carousel/Carousel2.png" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="image/Carousel/Carousel3.png" alt="Third slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="image/Carousel/Carousel4.png" alt="Fourth slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="image/Carousel/Carousel5.png" alt="Fifth slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <!-- 各大精選廠牌 -->

    <div class="container" id="factory">
        <h3 style="text-align:left">各大精選廠牌</h3>
        <div class="row">
            <div class="col-sm-12 col-md-3">
                <img src="image/DemoPhoto/270_180.png" alt="">
            </div>
            <div class="col-sm-12 col-md-3">
                <img src="image/DemoPhoto/270_180.png" alt="">
            </div>
            <div class="col-sm-12 col-md-3">
                <img src="image/DemoPhoto/270_180.png" alt="">
            </div>
            <div class="col-sm-12 col-md-3">
                <img src="image/DemoPhoto/270_180.png" alt="">
            </div>
        </div>
        <div class="row" style="margin-top:10px;">
            <div class="col-sm-12 col-md-3">
                <img src="image/DemoPhoto/270_180.png" alt="">
            </div>
            <div class="col-sm-12 col-md-3">
                <img src="image/DemoPhoto/270_180.png" alt="">
            </div>
            <div class="col-sm-12 col-md-3">
                <img src="image/DemoPhoto/270_180.png" alt="">
            </div>
            <div class="col-sm-12 col-md-3">
                <img src="image/DemoPhoto/270_180.png" alt="">
            </div>
        </div>
    </div>
    <!-- 精選食物 -->
    <div class="container" id="SpecialFood">
        <h3 style="text-align:left">精選食物</h3>
        <div class="row">
            <div class="col-sm-12 col-md-3">
                <div class="card" style="width:100%">
                    <img class="card-img-top" src="image/New_Product/寵物食品.jpg" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title">寵物飼料機</h4>

                        <p class="card-text"><del>$4500</del> $100</p>
                        <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-3">
                <div class="card" style="width:100%">
                    <img class="card-img-top" src="image/New_Product/滾輪.png" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title">寵物飼料機</h4>

                        <p class="card-text"><del>$4500</del> $100</p>
                        <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-3">
                <div class="card" style="width:100%">
                    <img class="card-img-top" src="image/New_Product/飲水機.png" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title">寵物飼料機</h4>

                        <p class="card-text"><del>$4500</del> $100</p>
                        <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-3">
                <div class="card" style="width:100%">
                    <img class="card-img-top" src="image/New_Product/飲水機.png" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <h4 class="card-title">寵物飼料機</h4>

                        <p class="card-text"><del>$4500</del> $100</p>
                        <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <!-- 塞選 -->

    <div class="container">
        <div style="border:1px solid black">
            <div>
                <h3 class="select" style="text-align: left;">塞選
                    <input class="btn btn-primary" type="submit" value="最新日期">
                    <input class="btn btn-primary" type="submit" value="價錢最高">
                    <input class="btn btn-primary" type="submit" value="價錢最低">
                    <input class="btn btn-primary" type="submit" value="最高評分">
                </h3>

            </div>

            <div class="row">
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">商品名稱</h4>

                            <p class="card-text"><del>$4500</del> $100</p>
                            <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                        </div>
                    </div>

                </div>
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">商品名稱</h4>

                            <p class="card-text"><del>$4500</del> $100</p>
                            <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                        </div>
                    </div>

                </div>
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">商品名稱</h4>
                            <p class="card-text"><del>$4500</del> $100</p>
                            <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">商品名稱</h4>

                            <p class="card-text"><del>$4500</del> $100</p>
                            <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                        </div>
                    </div>

                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">商品名稱</h4>

                            <p class="card-text"><del>$4500</del> $100</p>
                            <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                        </div>
                    </div>

                </div>
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">商品名稱</h4>

                            <p class="card-text"><del>$4500</del> $100</p>
                            <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                        </div>
                    </div>

                </div>
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">商品名稱</h4>

                            <p class="card-text"><del>$4500</del> $100</p>
                            <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title">商品名稱</h4>

                            <p class="card-text"><del>$4500</del> $100</p>
                            <a href="#" class="btn btn-primary stretched-link"> 購 買 </a>
                        </div>
                    </div>

                </div>

            </div>
            <br>
            <!-- 換頁 -->
            <div>
                <nav aria-label="......">
                    <ul class="pagination" style="margin: 0 auto;">
                        <li class="page-item disabled">
                            <span class="page-link">上一頁</span>
                        </li>
                        <li class="page-item active">
                            <span class="page-link">
                                1
                                <span class="sr-only">(current)</span>
                            </span>
                        </li>
                        <li class="page-item ">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">下一頁</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <br />
        </div>

    </div>
    <br />
    <br />
    <br />

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js">
    </script>
</body>
</html>