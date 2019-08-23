<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<a href="checkout/checkCart.jsp">購物車</a>
<a href="index.jsp">回首頁</a>
</div>
<div>

<c:forEach varStatus="stVar"  var="productBean"  items="${productList}" >
<table>
<tr><td>商品圖片</td><td>商品名稱</td><td>商品價格</td><td>使用日期</td><td>商品評價</td><td rowspan="2" style="width:150px">
<form:form method="POST" action="${pageContext.request.contextPath}/Buy" >
<c:if test="${productBean.pInstock==0 }">
<p>已售完</p>
</c:if>
<c:if test="${productBean.pInstock!=0 }">
<select name="oQty">
<c:forEach var="stock" begin="1" end="${productBean.pInstock}">
<option value="${stock}">${stock}</option>
</c:forEach>
</select>
</c:if>
<input type="hidden" name="pId" value="${productBean.pId }">
<input type="hidden" name="pName" value="${productBean.pName }">
<input type="hidden" name="pPrice" value="${productBean.pPrice }">
<input type="hidden" name="pDateRange" value="${productBean.pDateRange }">
<c:if test="${productBean.pInstock!=0 }">
<input type="submit" value="加到購物車">
</c:if>
</form:form>
</td></tr>
<tr><td><img style="width:100px;height:100px;" src="<c:url value='/showPic/${productBean.pId}'/>"></td><td>${productBean.pName}</td><td>${productBean.pPrice}</td>
<td>${productBean.pDateRange}</td><td>${productBean.pAvgRating}</td></tr>
</table>
<br>
</c:forEach>

<div>
<table>
<tr>
<td width="76">
<c:if test="${pageNo>1}">
<a href="${pageNo-1}">第一頁</a>
</c:if>
</td>
<td width="76">
<c:if test="${pageNo>1}">
<a href="${pageNo-1}">上一頁</a>
</c:if>
</td>
<td width="76">
<c:if test="${pageNo!=totalPages }">
<a href="${pageNo+1}">下一頁</a></c:if>
</td>
</tr>


</table>



</div>
</div>

</body>
</html>