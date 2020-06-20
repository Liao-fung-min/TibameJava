<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%Product_VO product_VO = (Product_VO) request.getAttribute("product_VO");%>


<!DOCTYPE html>
<jsp:useBean id="listProduct_ByName" scope="request" type="java.util.List<Product_VO>" />
<jsp:useBean id="product_Svc" scope="page" class="com.product.model.Product_Service" />
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>兔子</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
    <link rel="stylesheet" href="/Login/layout.css">
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
<c:forEach var="product_VO" items="${listProduct_ByName}">
<div style="border:1px solid black">
        <h3 class="daily">每日精選</h3>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12 col-md-3">
                    <div class="card" style="width:100%">
                        <img class="card-img-top" src="<%=request.getContextPath()%>/Product_Image?product_id=${product_VO.product_id}&image=0" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"><td>${product_VO.name}</td></h4>

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
                        <img class="card-img-top" src="/image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"><td>${product_VO.name}</td></h4>

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
                        <img class="card-img-top" src="/image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"><td>${product_VO.name}</td></h4>
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
                        <img class="card-img-top" src="/image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"><td>${product_VO.name}</td></h4>

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
                        <img class="card-img-top" src="/image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"><td>${product_VO.name}</td></h4>

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
                        <img class="card-img-top" src="/image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"><td>${product_VO.name}</td></h4>

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
                        <img class="card-img-top" src="/image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"><td>${product_VO.name}</td></h4>

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
                        <img class="card-img-top" src="/image/Daily_product/Daily_product.png" alt="Card image"
                            style="width:100%">
                        <div class="card-body">
                            <h4 class="card-title"><td>${product_VO.name}</td></h4>

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
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </c:forEach>
</body>
</html>