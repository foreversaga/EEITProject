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
<a href="checkBill.do">結帳</a>
<a href="index.jsp">回首頁</a>
</div>
<div>

<c:forEach varStatus="stVar"  var="productBean"  items="${productList}" >
<table>
<tr><td>商品名稱</td><td>庫存數量</td><td>商品價格</td><td>使用日期</td><td>商品評價</td><td rowspan="2" style="width:150px">
<form>
<c:if test="${productBean.pinStock==0 }">
<p>已售完</p>
</c:if>
<c:if test="${productBean.pinStock!=0 }">
<select name="oAmount">
<c:forEach var="stock" begin="1" end="${productBean.pinStock}">
<option value="${stock}">${stock}</option>
</c:forEach>
</select>
</c:if>
<input type="hidden" name="pID" value="${productBean.pID }">
<input type="hidden" name="pName" value="${productBean.pName }">
<input type="hidden" name="pPrice" value="${productBean.pPrice }">
<input type="hidden" name="pDateRange" value="${productBean.pDateRange }">
<input type="submit" value="加到購物車">
</form>
</td></tr>
<tr><td>${productBean.pName}</td><td>${productBean.pinStock}</td><td>${productBean.pPrice}</td>
<td>${productBean.pDateRange}</td><td>${productBean.pAvgRating}</td></tr>
</table>
<br>
</c:forEach>
</div>

</body>
</html>