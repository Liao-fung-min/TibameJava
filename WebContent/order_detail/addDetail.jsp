<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_order_detail.model.*"%>

<%
	Order_detail_VO order_detail_VO = (Order_detail_VO) request.getAttribute("order_detail_VO");
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
				<h3>訂單明細新增 - addDetail.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/detail_page.jsp"><img src="images/cat.png" width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>訂單明細新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detail" name="form1"  >
		<table>
			<tr>
				<td>訂單編號:</td>
				<td><input type="TEXT" name="product_order_id" size="45"
					value="<%=(order_detail_VO == null) ? "POI00010" : order_detail_VO.getProduct_order_detail_id()%>" /></td>
			</tr>
			<tr>
				<td>商品規格編號:</td>
				<td><input type="TEXT" name="product_version_id" size="45"
					value="<%=(order_detail_VO == null) ? "PVI00001" : order_detail_VO.getProduct_version_id()%>" /></td>
			</tr>
			<tr>
				<td>數量:</td>
				<td><input type="TEXT" name="quantity" size="45"
					value="<%=(order_detail_VO == null) ? "" : order_detail_VO.getQuantity()%>" /></td>
			</tr>
			

			 <jsp:useBean id="order_detail_Svc" scope="page" class="com.product_order_detail.model.Order_detail_Service" />


		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>


</html>