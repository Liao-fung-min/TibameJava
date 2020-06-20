<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>寵物網路商城</title>
    <!-- Required meta tags -->

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
<!--     <link rel="stylesheet" href="/Login/layout.css"> -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
</head>

<style>
body {
    text-align: center;
    font-family: 'Noto Serif TC',
        serif;
    ;
}


a,
a:link,
a:visited {
    text-decoration: none;
    color: inherit;
}

/* KEYWORD */

div#keyword {
    color: orange;
}

/* CAROUSEL */

.carousel-indicators li {
    width: 8px;
    height: 8px;
    border-radius: 50%;
}

/* 類別圖片 */

div.item {
    position: relative;
    float: left;
    overflow: hidden;
    margin: 10px 1%;
    min-width: 220px;
    max-width: 310px;
    width: 100%;
    background: #ffffff;
    text-align: center;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
}

div.item * {
    box-sizing: border-box;
}

div.item img {
    max-width: 100%;
    vertical-align: top;
    height: 210px;
}

div.item i {
    position: absolute;
    top: 36%;
    left: 38%;
    border-radius: 50%;
    font-size: 34px;
    color: #000000;
    width: 60px;
    height: 60px;
    line-height: 60px;
    background: #ffffff;
}

div.item a {
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    position: absolute;
}

div.item.food {
    background-color: #ffffff;
}

div.item.food i {
    color: red;
}

div.item.cloth {
    background-color: #ffffff;
}

div.item.cloth i {
    color: #16a085;
}

div.item.home {
    background-color: #ffffff;
}

div.item.home i {
    color: rgb(84, 179, 223);
}

div.item.box {
    background-color: #ffffff;
}

div.item.box i {
    color: rgb(241, 206, 89);
}

div.item:hover img {
    opacity: 0.3;
    filter: grayscale(100%);
}

div.item * {
    transition: all 0.35s ease-in-out;

}

div.item i {
    transform: scale(0);
    display: block;
    transition: transform 0.3s 0.12s;
}

div.item:hover i {
    transform: scale(1);
    transition: transform 300ms cubic-bezier(0.175, 0.885, 0.32, 1.275) 100ms;
}

/* 圖片穿插 */

div#activity_first_photo img {
    width: 100%;
}

/* 新品上架 */

div#new_product img {
    box-shadow: 3px 3px 12px gray;
    padding: 3px;

}


div#new_product p {
    padding-top: 10px;

}

/* ACTIVITY */

div.activity h3 {
    text-align: left
}

div.activity img {

    width: 100%;
}

/* HOT PRODUCT */

div.card {
    width: 100%
}

div.card img {
    width: 100%;
}

/* 購買按鈕 */
div.card-body input {
    color: #ffffff;
    background-color: #5b99d3;
    border: none;
}

div.card-body input:hover {
    background-color: rgb(10, 34, 56);
}


/* DAILY */

div h3 {
    padding: 10px;
}

div h3.daily {
    background-color: rgb(248, 177, 45);
}

/* PRICE DELETE */

del {
    color: red;
}
</style>

<body>
 <!-- serachbox -->
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Product" name="form1">
    <div class="container">
        <div class="row">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="請輸入商品名字" name="name">
                <div class="input-group-append">
                    <button class="btn btn-secondary" type="submit" >
                    <input type="hidden" name="action" value="listProduct_ByName">
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
    </FORM>
    <jsp:useBean id="product_Svc" scope="page" class="com.product.model.Product_Service" />
    <!-- 關鍵字 -->
    <div class="container">
        <div class="row" id="keyword">

            <div class="col-sm-12 col-md-2">

                <a class="nav-link" href="#">經典狗狗美食</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link" href="#">好用寵物用品</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link" href="#">經典狗屋</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link" href="#">寵物飼料機</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link" href="#">攝像鏡頭</a>

            </div>
            <div class="col-sm-12 col-md-2">

                <a class="nav-link" href="#">貓倍麗</a>

            </div>

        </div>
        <!-- 輪播圖片 -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            </ol>
            <div class="carousel-inner" id="carousel-photo">
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
        <hr />
        <!-- 商品類別 -->
        <div class="container" id="class_product">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-sm-12 col-md-3 d-flex flex-column align-items-center">
                        <p>食品</p>
                        <!-- 導入食物頁面 -->
                        <a href="http://127.0.0.1:5501/Class_food/Class_Food.html">
                            <div class="item food">
                                <img src="image/Classimage/food.png" />
                                <i class="fa fa-hamburger"></i>
                            </div>
                            <br />
                        </a>


                    </div>
                    <div class="col-sm-12 col-md-3 d-flex flex-column align-items-center">
                        <p>服飾</p>
                        <!-- 導入服飾頁面 -->
                        <a href="">
                            <div class="item cloth">
                                <img src="image/Classimage/shirt.png" />
                                <i class="fa fa-tshirt"></i>
                            </div>
                        </a>
                        <br />

                    </div>
                    <div class="col-sm-12 col-md-3 d-flex flex-column align-items-center">
                        <p>住家</p>
                        <!-- 導入住家頁面 -->
                        <a href="">
                            <div class="item home">
                                <img src="image/Classimage/Home.png" />
                                <i class="fa fa-home"></i>
                            </div>
                        </a>
                        <br />

                    </div>
                    <div class="col-sm-12 col-md-3 d-flex flex-column align-items-center">
                        <p>用品</p>
                        <!-- 導入用品頁面 -->
                        <a href="">
                            <div class="item box">
                                <img src="image/Classimage/product.png" />
                                <i class="fa fa-box"></i>
                            </div>
                        </a>
                        <br />
                    </div>
                </div>
            </div>
            <br>

            <!-- 新品上架 -->
            <div>
                <h3 style="text-align:left">新品上架</h3>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12 col-md-3" id="new_product">
                            <div>
                                <a href="http://127.0.0.1:5501/Product/Product.html">
                                    <img src="image/New_Product/寵物食品.jpg" />
                                    <br />
                                    <p>迪里奧食品</p>
                                </a>
                            </div>

                        </div>
                        <div class="col-sm-12 col-md-3" id="new_product">
                            <div>
                                <a href="http://127.0.0.1:5501/Product/Product.html">
                                    <img src="image/New_Product/滾輪.png" />
                                    <br />
                                    <p>迪里奧滾輪</p>
                                </a>
                            </div>

                        </div>
                        <div class="col-sm-12 col-md-3" id="new_product">
                            <div>
                                <a href="http://127.0.0.1:5501/Product/Product.html">
                                    <img src="image/New_Product/飲水機.png" />
                                    <br />
                                    <p>寵物智慧飲水機</p>
                                </a>

                            </div>

                        </div>
                        <div class="col-sm-12 col-md-3" id="new_product">
                            <div>
                                <a href="http://127.0.0.1:5501/Product/Product.html">
                                    <img src="image/New_Product/寵物食品.jpg" />
                                    <br />
                                    <p>柏肯特食品</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 防疫活動 -->
            <div class="activity">
                <h3>防疫活動</h3>
                <img src="image/Activity/activity.png" />
            </div>
            <hr />

            <!-- 熱門商品 -->
            <div>
                <h3 style="text-align:left">熱門商品</h3>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12 col-md-3">
                            <div class="card">
                                <img class="card-img-top" src="image/Hot_product/Hot_product1.png" alt="Card image">
                                <div class="card-body">
                                    <h4 class="card-title">寵物飼料機</h4>
                                    <p class="card-text"><del>$4500</del> $100</p>
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="card">
                                <img class="card-img-top" src="image/Hot_product/Hot_product2.png" alt="Card image">
                                <div class="card-body">
                                    <h4 class="card-title">寵物飼料機</h4>

                                    <p class="card-text"><del>$4500</del> $100</p>
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
                                </div>
                            </div>

                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="card">
                                <img class="card-img-top" src="image/Hot_product/Hot_product3.png" alt="Card image">
                                <div class="card-body">
                                    <h4 class="card-title">寵物飼料機</h4>

                                    <p class="card-text"><del>$4500</del> $100</p>
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-3">
                            <div class="card">
                                <img class="card-img-top" src="image/Hot_product/Hot_product4.png" alt="Card image">
                                <div class="card-body">
                                    <h4 class="card-title">商品名稱</h4>

                                    <p class="card-text"><del>$4500</del> $100</p>
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
            <hr />
            <!-- 每日精選 -->
            <div style="border:1px solid black">
                <h3 class="daily">每日精選</h3>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12 col-md-3">
                            <div class="card" style="width:100%">
                                <img class="card-img-top" src="image/Daily_product/Daily_product.png" alt="Card image"
                                    style="width:100%">
                                <div class="card-body">
                                    <h4 class="card-title">商品名稱</h4>

                                    <p class="card-text"><del>$4500</del> $100</p>

                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>

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
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
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
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
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
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
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
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
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
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
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
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
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
                                    <a class="btn btn-primary text-white" type="button"
                                        href='http://127.0.0.1:5501/Product/Product.html' value="購買">
                                        購買
                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <br />
            </div>
        </div>

        <br />
        <br />
        <br />
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>