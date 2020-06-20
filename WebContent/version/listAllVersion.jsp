<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product_version.model.*"%>


<%
    Version_Service versionSvc = new Version_Service();
    List<Version_VO> list = versionSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="version_Svc" scope="page" class="com.product_version.model.Version_Service" />

<html>
<head>
<title>�Ҧ��W���� - listAllVersion.jsp</title>

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
		 <h3>�Ҧ��W���� - listAllVersion.jsp</h3>
		 <h4>
		 <a href="<%=request.getContextPath()%>/version_page.jsp">
		 <img src="/pro/images/back1.gif" width="100" height="32" border="0">�^����</a>
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
	    <th>�W��s��</th>
		<th>�ӫ~�s��</th>
	    <th>�W��W��</th>
	    <th>����</th>
	    <th>�ƶq</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="/pro/pages/page1.file" %> 
	<c:forEach var="version_VO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${version_VO.product_version_id}</td>
			<td>${version_VO.product_id}</td>
			<td>${version_VO.version_name}</td>
			<td>${version_VO.price}</td>
			<td>${version_VO.inventory}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Version" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="product_version_id" value="${version_VO.product_version_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Version" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="product_version_id" value="${version_VO.product_version_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="/pro/pages/page2.file" %>

</body>
</html>