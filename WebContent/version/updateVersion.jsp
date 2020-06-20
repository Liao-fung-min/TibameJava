<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product_version.model.*"%>

<%
	Version_VO version_VO = (Version_VO) request.getAttribute("version_VO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料修改 - update_emp_input.jsp</title>

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
	<tr><td>
		 <h3>規格資料修改 - update_verison_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/version_page.jsp"><img src="pro/images/cat.png" width="100" height="32" border="0"/>回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Version" name="form1" >
		<table>
			
			<tr>
				<td>規格名稱:</td>
				<td><input type="TEXT" name="version_name" size="45"
					value="<%=(version_VO == null) ? "請輸入規格名稱" : version_VO.getVersion_name()%>" /></td>
			</tr>
			<tr>
				<td>價錢:</td>
				<td><input type="TEXT" name="price" size="45"
					value="<%=(version_VO == null) ? "請輸入價錢" : version_VO.getPrice()%>" /></td>
			</tr>
			<tr>
				<td>數量:</td>
				<td><input type="TEXT" name="inventory" size="45"
					value="<%=(version_VO == null) ? "請輸入數量" : version_VO.getInventory()%>" /></td>
			</tr>
			
				
			

	 <jsp:useBean id="version_Svc" scope="page" class="com.product_version.model.Version_Service" />
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="product_version_id" value="<%=version_VO.getProduct_version_id()%>">
<input type="submit" value="送出修改"></FORM>
</body>

