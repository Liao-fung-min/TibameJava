<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>

<%
	Product_VO product_VO = (Product_VO) request.getAttribute("product_VO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>商品新增 - addProduct.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>產品新增 - addProduct.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/product_page.jsp"><img src="images/cat.png" width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Product" name="form1" enctype="multipart/form-data" >
		<table>
			<tr>
				<td>會員編號:</td>
				<td><input type="TEXT" name="member_id" size="45"
					value="<%=(product_VO == null) ? "MB00010" : product_VO.getMember_id()%>" placeholder="請輸會員編號"/></td>
			</tr>
			<tr>
				<td>商品名稱:</td>
				<td><input type="TEXT" name="name" size="45"
					value="<%=(product_VO == null) ? "" : product_VO.getName()%>" placeholder="請輸入商品名稱"/></td>
			</tr>
			<tr>
				<td>商品類別:</td>
				<td><select name="product_class">
                    <option value="食品">食品</option>
                    <option value="服飾">服飾</option>
                    <option value="住家">住家</option>
                    <option value="用品">用品</option>
                    <option value="玩具">玩具</option>
                    </select></td>
			</tr>
			<tr>
				<td>商品介紹:</td>
				<td><input type="file" name="description" onchange="loadImageFile(event)"/></td>
				<div style="width:200px; height:200px; display:inline-block;">
                            <img id="description" style="width:100%;"/>
                    </div>
			</tr>
			
				<tr>
					<td>產品圖片1:</td>
					<td><input type="file" name="image1" onchange="loadImageFile(event)"/></td>
					<div style="width:200px; height:200px; display:inline-block;">
                            <img id="image1" style="width:100%;"/>
                    </div>
				</tr>
				<tr>
					<td>產品圖片2:</td>
					<td><input type="file" name="image2" onchange="loadImageFile(event)"/></td>
					<div style="width:200px; height:200px; display:inline-block;">
                            <img id="image2" style="width:100%;"/>
                    </div>
				</tr>
				<tr>
					<td>產品圖片3:</td>
					<td><input type="file" name="image3" onchange="loadImageFile(event)"/></td>
					<div style="width:200px; height:200px; display:inline-block;">
                            <img id="image3" style="width:100%;"/>
                    </div>
				</tr>
				<tr>
					<td>產品圖片4:</td>
					<td><input type="file" name="image4" onchange="loadImageFile(event)"/></td>
					<div style="width:200px; height:200px; display:inline-block;">
                            <img id="image4" style="width:100%;"/>
                    </div>
				</tr>
			<tr>
				<td>商品狀態:</td>
				<td>
				<input type="RADIO" name="product_state" size="45" value=1 name="上架" checked="true"/><label>上架</label>
				<input type="RADIO" name="product_state" size="45" value=2 name="下架"/><label>下架</label>
				</td>
			</tr>
	 <jsp:useBean id="product_Svc" scope="page" class="com.product.model.Product_Service" />


		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
	
		
	<script>
    function loadImageFile(event){
        switch(event.target.name){
	        case 'description':
	            var description = document.getElementById('description'); 
	            description.src = URL.createObjectURL(event.target.files[0]);
	            break;
            case 'image1':
                var image1 = document.getElementById('image1'); 
                image1.src = URL.createObjectURL(event.target.files[0]);
                break;
            case 'image2':
                var image2 = document.getElementById('image2'); 
                image2.src = URL.createObjectURL(event.target.files[0]);
                break;
            case 'image3':
                var image3 = document.getElementById('image3'); 
                image3.src = URL.createObjectURL(event.target.files[0]);
                break;
            case 'image4':
                var image4 = document.getElementById('image4'); 
                image3.src = URL.createObjectURL(event.target.files[0]);
                break;
        }
    }; 
</script>
</body>

</html>