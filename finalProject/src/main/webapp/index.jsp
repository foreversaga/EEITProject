<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<style>
div {
	width: 300px;
	text-align: center;
	margin: 100px auto;
}
</style>
</head>
<body>
	<div>
		<a href="register/register.jsp">註冊</a> <a href="product/ProductPage.html">商品頁面</a>
		<c:if test="${!empty MemberInfo}">
		<a href="login/MemberInfo.jsp">會員資料</a>
		</c:if>
		<c:choose>
			<c:when test="${empty LoginOK}">
				<a href="login/login.jsp">登入</a>
			</c:when>
			<c:otherwise>
				<a href="login/logout.jsp">登出</a>
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>