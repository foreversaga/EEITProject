<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品頁面Servlet</title>
<style>
div {
	width: 400px;
	margin: 100px auto;
	text-align: center;
}
table{
border-collapse: collapse;
}
td{
width:100px;
border: 1px solid black;
}
</style>
</head>
<body>

<div>

<c:forEach varStatus="stVar"  var="productBean"  items="${productList}" >
<table>
<tr><td>商品名稱</td><td>庫存數量</td><td>商品價格</td><td>使用日期</td><td>商品評價</td></tr>
<tr><td>${productBean.pName}</td><td>${productBean.pinStock}</td><td>${productBean.pPrice}</td>
<td>${productBean.pDateRange}</td><td>${productBean.pAvgRating}</td></tr>
</table>
<br>
</c:forEach>

</div>
	<div>
		<a href="../index.jsp">回首頁</a>
	</div>
</body>
</html>