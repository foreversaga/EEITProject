<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車清單</title>
<style>
div {
	width: 600px;
	margin: 50px auto;
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
<a href="product.do">回商品頁面</a>
<a href="index.jsp">回首頁</a>
</div>
<div>

<table>
<tr><th>商品圖片</th><th>商品名稱</th><th>購買數量</th><th>商品單價</th></tr>
<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
<tr>
<td><img style="width:100px;height:100px;" src="${pageContext.servletContext.contextPath}/ShowPic?pId=${cart.value.pId}"></td>
<td>${cart.value.pName}</td>
<td>${cart.value.iQty}</td>
<td>${cart.value.pPrice}</td>
</tr>
</c:forEach>
</table>

</div>


</body>
</html>