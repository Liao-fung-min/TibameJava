<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購物車</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" />
<!--     <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet"> -->
    <link href="<%=request.getContextPath()%>/front-end/product/css/ShoppingCart.css" rel="stylesheet">

</head>

<body>
    <!-- 購物車、結帳、全部訂單 -->
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-4">
                <h2>
                    <p style="color: red;">1.購物車</p>
                </h2>
            </div>
            <div class="col-sm-12 col-md-4">
                <h2>
                    <p>2.結帳</p>
                </h2>
            </div>
            <div class="col-sm-12 col-md-4">
                <h2>
                    <p>3.訂單總覽</p>
                </h2>
            </div>
        </div>
    </div>
    <br>

    <!-- 商品欄位 -->
    <div class="container">
        <div class="row" id="Row_Name">
            <table class="table">
                <thead style="background-color: orange;">
                    <tr>

                        <th scope="col">
                            <h3 style="margin:auto;">商品圖片</h3>
                        </th>
                        <th scope="col">
                            <h3 style="margin:auto;">商品名稱</h3>
                        </th>
                        <th scope="col">
                            <h3 style="margin:auto;">單價</h3>
                        </th>
                        <th scope="col">
                            <h3 style="margin:auto;">數量</h3>
                        </th>
                        <th scope="col">
                            <h3 style="margin:auto;">小計</h3>
                        </th>
                        <th scope="col">
                            <h3 style="margin:auto;">刪除</h3>
                        </th>
                    </tr>
                </thead>
                <tbody id="CartBody">


                </tbody>
            </table>
        </div>
    </div>
    <br>

    <!-- 運費活動 -->
    <div class="container" id="Activity">
        <div class="row" id="Activity" style="border: 3px solid black;">
            <div class="col-2">
                <i class="fa fa-truck" id="truck" style=" padding-top: 20px; padding-left: 20px; font-size: 50px;"></i>
            </div>
            <div class="col-3 text-left" style="margin-top: 5px;">
                <h4>運費活動:</h4>
                <p>
                    全家、萊爾富取貨付款 $20 <br>
                    7-11取貨付款 $10
                </p>
            </div>
            <div class="col-2" style="margin: 30px 0 0 80px;">
                <a href="<%=request.getContextPath()%>/front-end/product/ProductHomepage.jsp" class="btn btn-secondary" id="home"> 商城首頁 </a>

            </div>
            <div class="col-2" style="margin: 30px 0 0 0;">
                <a href="<%=request.getContextPath()%>/front-end/product/ShoppingCartAccount.jsp" class="btn btn-primary"
                    id="buy">去結帳</a>

            </div>




        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/front-end/product/js/ShoppingCart.js"></script>
</body>
</html>