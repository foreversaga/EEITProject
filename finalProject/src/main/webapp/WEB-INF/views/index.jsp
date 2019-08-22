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
	width: 500px;
	text-align: center;
	margin: 100px auto;
}
</style>
</head>
<body>
	<div>
		<a href="register">註冊</a>
		<a href="products">商品頁面(mvc)</a>
		<c:if test="${!empty MemberInfo}">
		<a href="MemberInfo">會員資料</a>
		</c:if>
		<c:choose>
			<c:when test="${empty LoginOK}">
				<a href="login">登入</a>
			</c:when>
			<c:otherwise>
			<a href="maintain">維護商品</a>
				<a href="logout">登出</a>
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>