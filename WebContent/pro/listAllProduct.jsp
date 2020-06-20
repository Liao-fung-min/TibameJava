<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    Product_Service productSvc = new Product_Service();
    List<Product_VO> list = productSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="product_Svc" scope="page" class="com.product.model.Product_Service" />

<html>
<head>
<title>�Ҧ��ӫ~��� - listAllProduct.jsp</title>

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
		 <h3>�Ҧ��ӫ~��� - listAllProduct.jsp</h3>
		 <h4>
		 <a href="<%=request.getContextPath()%>/product_page.jsp">
<!-- 			 <img src="images/back1.gif" width="100" height="32" border="0">�^���� -->
		 </a>
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
		<th>�ӫ~�s��</th>
		<th>�|���s��</th>
		<th>�ӫ~�W��</th>
		<th>�ӫ~���O</th>
		<th>�ӫ~����</th>
		<th>�ӫ~�Ϥ�1</th>
		<th>�ӫ~�Ϥ�2</th>
		<th>�ӫ~�Ϥ�3</th>
		<th>�ӫ~�Ϥ�4</th>
		<th>�ӫ~���A</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="product_VO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${product_VO.product_id}</td>
			<td>${product_VO.member_id}</td>
			<td>${product_VO.name}</td>
			<td>${product_VO.product_class}</td>
			<td><img src="<%=request.getContextPath()%>/Product_Image?product_id=${product_VO.product_id}&image=0" width="100px" hight="100px"/></td>

			<%for(int i=1;i<=4;i++){%>
		<td>
			<span><%=i%></span>
			<img style="width:100px;height:100px;" src="<%=request.getContextPath()%>
			/Product_Image?product_id=${product_VO.product_id}&image=<%=i%>"/>
		</td>
		<%}%>
			<td>${product_VO.product_state}</td>
			
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Product" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="product_id" value="${product_VO.product_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Product" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="product_id" value="${product_VO.product_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

</body>
</html>