<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_score.model.*"%>

<%
	Score_VO score_VO = (Score_VO) request.getAttribute("score_VO");
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
				<h3>評分新增 - addProduct.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="<%=request.getContextPath()%>/score_page.jsp"><img src="/pro/images/cat.png" width="100" height="100" border="0">回首頁</a>
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

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Score" name="form1"  >
		<table>
			<tr>
				<td>商品編號:</td>
				<td><input type="TEXT" name="product_id" size="45"
					value="<%=(score_VO == null) ? "PI00010" : score_VO.getProduct_id()%>" /></td>
			</tr>
			<tr>
				<td>會員編號:</td>
				<td><input type="TEXT" name="member_id" size="45"
					value="<%=(score_VO == null) ? "MB00001" : score_VO.getMember_id()%>" /></td>
			</tr>
			<tr>
				<td>評分:</td>
				<td><input type="TEXT" name="score" size="45"
					value="<%=(score_VO == null) ? "" : score_VO.getScore()%>" /></td>
			</tr>
			

			 <jsp:useBean id="score_Svc" scope="page" class="com.product_score.model.Score_Service" />


		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>


</html>