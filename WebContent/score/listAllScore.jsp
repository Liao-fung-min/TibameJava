<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product_score.model.*"%>

<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    Score_Service scoreSvc = new Score_Service();
    List<Score_VO> list = scoreSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<jsp:useBean id="score_Svc" scope="page" class="com.product_score.model.Score_Service" />
<jsp:useBean id="product_Svc" scope="page" class="com.product.model.Product_Service" />
<html>
<head>
<title>�Ҧ�������� - listAllScore.jsp</title>

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
		 <h3>�Ҧ�������� - listAllScore.jsp</h3>
		 <h4>
		 <a href="<%=request.getContextPath()%>/score_page.jsp">
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
	<th>�����s��</th>
		<th>�ӫ~�s��</th>
		<th>����</th>
		<th>�ӫ~�T��</th>

		
	</tr>
	<%@ include file="/pro/pages/page1.file" %> 
	<c:forEach var="score_VO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
		    <td>${score_VO.product_score_id}</td>
			<td>${score_VO.product_id}</td>
			<td>${score_VO.score}</td>
			
			<td>
			    <c:forEach var="product_VO" items="${product_Svc.all}">
                    <c:if test="${score_VO.product_id==product_VO.product_id}">
	                                                         �i${product_VO.name} - ${product_VO.product_class} �j
                    </c:if>
                 </c:forEach>
			</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="/pro/pages/page2.file" %>

</body>
</html>