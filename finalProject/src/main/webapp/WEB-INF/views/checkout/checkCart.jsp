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
	width: 400px;
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
th{
border: 1px solid black;
}
</style>
</head>
<body>
<div>
<a href="${pageContext.request.contextPath }/products/1">回商品頁面</a>
<a href="${pageContext.request.contextPath }/">回首頁</a>
</div>
<div>

<table>
<c:choose><c:when test="${empty shoppingCart.content }">
購物車內已無商品。
</c:when>
<c:otherwise>
<tr><th>商品圖片</th><th>商品名稱</th><th>購買數量</th><th>商品單價</th><th></th></tr>

</c:otherwise>
</c:choose>
<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
<tr>
<td><img style="width:100px;height:100px;" src="<c:url value='/showPic/${cart.value.pId}'/>"></td>
<td>${cart.value.pName}</td>
<td>${cart.value.iQty}</td>
<td>${cart.value.pPrice}</td>
<td><form action="<c:url value='/DeleteCartProduct'/>" method="post">
<input type="hidden" name="pId" value="${cart.value.pId}" />
<input type="submit" value="刪除"/></form></td>
</tr>
</c:forEach>
</table>
</div>
<div>
<a href="${pageContext.request.contextPath }/CheckOut">結帳</a>
</div>

</body>
</html>