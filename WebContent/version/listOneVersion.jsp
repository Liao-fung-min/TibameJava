<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product_version.model.*"%>



<% Version_VO version_VO = (Version_VO) request.getAttribute("version_VO");%>



<html>
<head>
<title>�W���� - listOneVersion.jsp</title>

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
		 <h3>�浧�W���� - ListOneVersion.jsp</h3>
		 <h4>
		 <a href="<%=request.getContextPath()%>/version_page.jsp">
		 <img src="pro/images/back1.gif" width="100" height="32" border="0">�^����</a>
		 </h4>
	</td></tr>
</table>

<table>

	<tr>
		<th>�W��s��</th>
<!-- 		<th>�ӫ~�s��</th> -->
		<th>�ӫ~�W��</th>
		<th>�ӫ~����</th>
		<th>�ӫ~�ƶq</th>
	</tr>
	
	<tr>
		<td>${version_VO.product_version_id}</td>
<%-- 		<td>${version_VO.product_id}</td> --%>
		<td>${version_VO.version_name}</td>
		<td>${version_VO.price}</td>
		<td>${version_VO.inventory}</td>	
	</tr>
	
</table>

</body>
</html>