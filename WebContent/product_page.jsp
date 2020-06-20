<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>購物商城</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Emp: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/pro/listAllProduct.jsp'>觀看</a> 全部商品.  <br><br></li>
  
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Product" >
        <b>輸入商品編號 (如PI00001):</b>
        <input type="text" name="product_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Product" name="form1">
        <b><font color=blue>萬用複合查詢:</font></b> <br>
        <b>商品名稱:</b>
        <input type="text" name="name" value="測試"><br>
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="listProduct_ByName">
   </FORM>
   

  <jsp:useBean id="product_Svc" scope="page" class="com.product.model.Product_Service" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Product" >
       <b>選擇商品名稱:</b>
       <select size="1" name="product_id">
         <c:forEach var="proVO" items="${product_Svc.all}" > 
          <option value="${proVO.product_id}">${proVO.name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
  
  
</ul>


<h3>員工管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/pro/addProduct.jsp'>新增</a>一個新商品</li>
</ul>

</body>
</html>