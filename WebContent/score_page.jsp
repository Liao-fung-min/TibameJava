<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>評分</title>

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

<h3>評分查詢:</h3>
	
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
  <li><a href='<%=request.getContextPath()%>/score/listAllScore.jsp'>觀看</a> 全部評分  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Score" >
        <b>輸入評分編號 (如SCI00001):</b>
        <input type="text" name="product_score_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="score_Svc" scope="page" class="com.product_score.model.Score_Service" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Score" >
       <b>選擇評分編號:</b>
       <select size="1" name="product_score_id">
         <c:forEach var="scoreVO" items="${score_Svc.all}" > 
          <option value="${scoreVO.product_score_id}">${scoreVO.product_score_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
  
  
</ul>


<h3>規格管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/score/addScore.jsp'>新增</a>一個新規格</li>
</ul>

</body>
</html>