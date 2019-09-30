<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>討論區</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='/'/>">旅遊趣</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
				aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="<c:url value='/'/>" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="<c:url value='/products/1'/>" class="nav-link">Products</a></li>
					<c:if test="${empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/login'/>" class="nav-link">Login</a></li>
						<li class="nav-item"><a href="<c:url value='/register/add'/>" class="nav-link">Register</a></li>
					</c:if>
					<c:if test="${!empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/UserDashboard'/>" class="nav-link">會員中心</a></li>
						<li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link">Logout</a></li>
					</c:if>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-toggle="modal" aria-haspopup="true"
						aria-expanded="false" data-target="#shoppingCartMenu">購物車</a> 
<!-- 						<div id="shoppingCartMenu" class="dropdown-menu" aria-labelledby="navbarDropdown"></div> -->
						</li>
				</ul>
			</div>
		</div>
	</nav>

	<div style="width: 1205px; margin: 5% auto;">
		<div style="width: 600px; display: inline-block;" class="container mt-5 border">
			<div class="row">
				<div class="col-md-3 border">
					<img style="margin: 6% 0" width="100%"
						src="https://d1rkab7tlqy5f1.cloudfront.net/LR/Organisatie/Afdelingen/Aerodynamics__Wind_Energy__Flight_Performance_and_Propulsion/Aerodynamics/People/Fulvio_Scarano.jpg">
					<div class="row">
						<div style="text-align: center;" class="col-md-12">good button</div>
					</div>
				</div>
				<div style="font-size: 30px;" class="col-md-9">
					<div class="row border">
						<div style="font-size: 30px;" class="col-md-9">title</div>
						<div style="font-size: 30px;" class="col-md-1">reply</div>
					</div>
					<p>content</p>
				</div>
			</div>
		</div>
		<div style="width: 600px; display: inline-block;" class="container mt-5 border">
			<div class="row">
				<div class="col-md-3 border">
					<img style="margin: 6% 0" width="100%"
						src="https://d1rkab7tlqy5f1.cloudfront.net/LR/Organisatie/Afdelingen/Aerodynamics__Wind_Energy__Flight_Performance_and_Propulsion/Aerodynamics/People/Fulvio_Scarano.jpg">
					<div class="row">
						<div style="text-align: center;" class="col-md-12">good button</div>
					</div>
				</div>
				<div style="font-size: 30px;" class="col-md-9">
					<div class="row border">
						<div style="font-size: 30px;" class="col-md-9">title</div>
						<div style="font-size: 30px;" class="col-md-1">reply</div>
					</div>
					<p>content</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>