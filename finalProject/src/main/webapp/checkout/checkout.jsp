<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="orderList" class="cart.model.orderBean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結帳頁面</title>
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
<table>
<tr><th>商品名稱</th><th>商品數量</th><th>商品單價</th><th>金額小計</th></tr>
<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content}">
<tr>
<td>${cart.value.pName}</td><td>${cart.value.iQty}</td><td>${cart.value.pPrice}</td>
<td>${cart.value.iQty * cart.value.pPrice}</td>
</tr>
</c:forEach>
</table>
<hr>

<p>金額總計:<jsp:getProperty property="oTotalAmount" name="orderList"/></p>

</div>
<div>
<form method="POST" action="">
<input type="submit" value="送出">
</form>

</div>

</body>
</html>