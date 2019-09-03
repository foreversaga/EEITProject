
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<link rel=stylesheet type="text/css"
	href="<c:url value='/css/navbar.css'/>">
<style>
body {
	font-size: 28px;
}

.active {
	background-color: #4CAF50;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	// function login() {
	// 	$.ajax({url : "<c:url value='/login'/>",type : "POST",
	// 		success : function(data) {$("#show").html(data);}});};
	$(document).ready(function() {
		$("#click").click(function() {
			$("#show").toggle("fast");
		});
	});
</script>
</head>
<body>
	<img style="width: 100%" src="<c:url value='/img/index-banner.jpg'/>">
	<ul>
		<li class="logo">旅遊去</li>
		<li class="item"><a class="active" href="<c:url value='/'/>">Home</a></li>
		<li class="item"><a href="products/1">商品頁面</a></li>
		<li class="item"><a href="login">會員登入</a></li>
		<li class="item"><a href="AddProduct">新增商品</a></li>
		<li class="item"><a href="logout">會員登出</a></li>
	</ul>
</body>
</html>