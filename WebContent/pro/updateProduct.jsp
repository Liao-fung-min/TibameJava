<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>

<%
	Product_VO product_VO = (Product_VO) request.getAttribute("product_VO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��ƭק� - update_emp_input.jsp</title>

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
		 <h3>���~��ƭק� - update_product_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/product_page.jsp"><img src="pro/images/cat.png" width="100" height="32" border="0"/>�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Product" name="form1" enctype="multipart/form-data">
		<table>
			
			<tr>
				<td>�ӫ~�W��:</td>
				<td><input type="TEXT" name="name" size="45"
					value="<%=(product_VO == null) ? "�п�J���~�W��" : product_VO.getName()%>" /></td>
			</tr>
			<tr>
				<td>�ӫ~���O:</td>
				<td><select name="product_class">
                    <option value="���~">���~</option>
                    <option value="�A��">�A��</option>
                    <option value="��a">��a</option>
                    <option value="�Ϋ~">�Ϋ~</option>
                    <option value="����">����</option>
                    </select></td>
			</tr>
			<tr>
				<td>�ӫ~����:</td>
				<td><input type="file" name="description" size="45" /></td>
			</tr>
				<tr>
					<td>���~�Ϥ�1:</td>
					<td><input type="file" name="image1" size="45" /></td>
				</tr>
				<tr>
					<td>���~�Ϥ�2:</td>
					<td><input type="file" name="image2" size="45"/></td>
				</tr>
				<tr>
					<td>���~�Ϥ�3:</td>
					<td><input type="file" name="image3" size="45"/></td>
				</tr>
				<tr>
					<td>���~�Ϥ�4:</td>
					<td><input type="file" name="image4" size="45"/></td>
				</tr>
			<tr>
				<td>�ӫ~���A:</td>
				<td>
				<input type="RADIO" name="product_state" size="45" value=1 name="�W�[" checked="true"/><label>�W�[</label>
				<input type="RADIO" name="product_state" size="45" value=2 name="�U�["/><label>�U�[</label>
				</td>
			</tr>

	 <jsp:useBean id="product_Svc" scope="page" class="com.product.model.Product_Service" />
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="product_id" value="<%=product_VO.getProduct_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>


        
</script>
</html>