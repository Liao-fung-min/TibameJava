<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product_order_detail.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    Order_detail_Service order_detailSvc = new Order_detail_Service();
    List<Order_detail_VO> list = order_detailSvc.getAll();
    System.out.println("list : " +list);
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="order_detail_Svc" scope="page" class="com.product_order_detail.model.Order_detail_Service" />

<html>
<head>
<title>�Ҧ��q����Ӹ�� - listAllDetail.jsp</title>

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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ��q����Ӹ�� - listAllProduct.jsp</h3>
		 <h4>
		 <a href="<%=request.getContextPath()%>/detail_page.jsp">
		 <img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		 </h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�q����ӽs��</th>
		<th>�q��s��</th>
		<th>�ӫ~�W��s��</th>
		<th>�ƶq</th>
		
		
	</tr>
	<%@ include file="/pro/pages/page1.file" %> 
	<c:forEach var="order_detail_VO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${order_detail_VO.product_order_detail_id}</td>
			<td>${order_detail_VO.product_order_id}</td>
			<td>${order_detail_VO.product_version_id}</td>
			<td>${order_detail_VO.quantity}</td>
			
			
			
		</tr>
	</c:forEach>
</table>
<%@ include file="/pro/pages/page2.file" %>

</body>
</html>