<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<%-- <link rel=stylesheet type="text/css" href="<c:url value='/css/navbar.css'/>"> --%>
<style>
body {
	font-size: 28px;
}

.active {
	background-color: #4CAF50;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
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
	<%-- 	<img style="width: 100%" src="<c:url value='/img/index-banner.jpg'/>"> --%>
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<c:url value='/img/index-banner.jpg'/>" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/img/index-banner-2.jpg'/>" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/img/index-banner-3.jpg'/>" class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand">旅遊去</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="<c:url value='/'/>">Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='products/1'/>">商品頁面</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='login'/>">會員登入</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='AddProduct'/>">新增商品</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='logout'/>">會員登出</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='orderDetails'/>">訂單明細</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='register/add'/>">會員註冊</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
</body>
</html>