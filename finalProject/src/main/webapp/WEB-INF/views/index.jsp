<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
	$.ajax({
			url : "http://localhost:8080/finalProject/products/1",
			type : "GET",
			success : function(data) {
				$("#show").html(data);
			}
		});
	});
</script>
</head>
<body>

	<nav style="background-color: #e3f2fd;"
		class="navbar navbar-expand-lg navbar-light fixed-top">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarTogglerDemo01"
			aria-controls="navbarTogglerDemo01" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<a class="navbar-brand" href="#" style="color: orange;">旅遊去</a>
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value='/'/>">Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a id="test" class="nav-link" href="">商品頁面</a>
				</li>
				<c:if test="${!empty MemberInfo}">
					<li class="nav-item"><a class="nav-link" href="">會員資料</a></li>
				</c:if>
				<c:choose>
					<c:when test="${empty LoginOK}">
						<li class="nav-item"><a class="nav-link" href="login">會員登入</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="AddProduct">新增商品</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="logout">會員登出</a>
						</li>

					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
	<div id="show" style="margin-top: 100px">123</div>

</body>
</html>