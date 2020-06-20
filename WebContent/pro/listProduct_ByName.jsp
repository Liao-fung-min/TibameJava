<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>

<!DOCTYPE html>
<jsp:useBean id="listProduct_ByName" scope="request" type="java.util.List<Product_VO>" />
<jsp:useBean id="product_Svc" scope="page" class="com.product.model.Product_Service" />
<html>
<head>
<meta charset="BIG5">
<title>萬用查詢 listProduct_ByName</title>
</head>
<body>
<table id="table-1">
	<tr><td>
		 <h3>萬用查詢 -  listProduct_ByName.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/product_page.jsp">回首頁</a></h4>
	</td></tr>
</table>


<table>
	<tr>
		<th>商品名稱</th>
	
		
	</tr>
	<c:forEach var="product_VO" items="${listProduct_ByName}">
		<tr align='center' valign='middle'>
			<td>${product_VO.name}</td>
		    <td>${product_VO.image1}</td>
			
		</tr>
	</c:forEach>
</table>


</body>
</html>