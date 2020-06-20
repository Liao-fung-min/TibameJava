<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>



<%Product_VO product_VO = (Product_VO) request.getAttribute("product_VO");%>



<html>
<head>
<title>產品資料 - listOneProduct.jsp</title>

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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>單筆商品資料 - ListOneProduct.jsp</h3>
		 <h4>
		 <a href="<%=request.getContextPath()%>/product_page.jsp">
		 <img src="pro/images/back1.gif" width="100" height="32" border="0">回首頁</a>
		 </h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>商品類別</th>
		<th>商品介紹</th>
		<th>商品圖片1</th>
		<th>商品圖片2</th>
		<th>商品圖片3</th>
		<th>商品圖片4</th>
		<th>商品狀態</th>
		
	</tr>
	<tr>
		<td>${product_VO.product_id}</td>
		<td>${product_VO.name}</td>
		<td>${product_VO.product_class}</td>
<%-- 		<td><img src="<%=request.getContextPath()%>/Product_Image?product_id=${product_VO.product_id}" width="100px" hight="100px"/></td> --%>
        <td>${product_VO.description}</td>
		<td>${product_VO.image1}</td>
		<td>${product_VO.image2}</td>
		<td>${product_VO.image3}</td>
		<td>${product_VO.image4}</td>
		<td>${product_VO.product_state}</td>
		
		
	</tr>
</table>

</body>
</html>