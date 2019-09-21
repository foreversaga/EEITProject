<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="orderInfo" class="cart.model.orderBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<title>我的訂單</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="<c:url value='/css/RWDcss/js/jquery.min.js'/>"></script>
<script type="text/javascript">
	
</script>
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/open-iconic-bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/animate.css'/>">

<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/owl.theme.default.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/magnific-popup.css'/>">

<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/aos.css'/>">

<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/ionicons.min.css'/>">

<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/bootstrap-datepicker.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/jquery.timepicker.css'/>">


<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/flaticon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/icomoon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/style.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/TableCss/vendor/perfect-scrollbar/perfect-scrollbar.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/TableCss/css/util.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/TableCss/css/main.css'/>">
<style type="text/css">
div.dropdown-menu {
	width: 300px;
	height: 423px;
	background-color: #f0f0f0;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	overflow-y: auto;
}
</style>

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
					<li class="nav-item"><a href="<c:url value='/AddProduct'/>" class="nav-link">新增商品</a></li>
					<c:if test="${!empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/UserDashboard'/>" class="nav-link">會員中心</a></li>
						<li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link">Logout</a></li>
						<li class="nav-item"><a href="<c:url value='/OrderDetails'/>" class="nav-link">訂單查詢</a></li>
						<li class="nav-item"><a href="<c:url value='/review'/>" class="nav-link">評價查詢</a></li>
					</c:if>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">購物車</a>
						<div id="shoppingCartMenu" class="dropdown-menu" aria-labelledby="navbarDropdown">
							<c:if test="${empty shoppingCart.content }">
								<p style="text-align: center; margin-top: 10%">購物車內已無商品</p>
							</c:if>
							<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
								<hr>
								<img style="width: 80px; float: left; vertical-align: center; margin-right: 1%;"
									src="<c:url value='/showPic/${cart.value.pId}'/>">
								<p style="line-height: 10px">${cart.value.pName}</p>
								<span style="line-height: 5px">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</span>
								<span><input class="btn btn-outline-danger" id="${cart.value.pId}" type="button"
										onclick="DeleteItem(this.id)" value="刪除" /> </span>
								<c:if test="${vs.last}">
									<hr>
								</c:if>
							</c:forEach>
							<c:if test="${!empty shoppingCart.content }">
								<a href="<c:url value='/CheckOut'/>">結帳</a>
							</c:if>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap js-fullheight"
		style="background-image: url(<c:url value='/css/RWDcss/images/bg_5.jpg'/>);">
		<div style="margin: 0 20%;">
			<form:form method="POST" action="${pageContext.request.contextPath }/ConfirmOrder"
				modelAttribute="orderInfo">
				<div style="margin: 20% 2%; display: inline-block; width: 45%;" class="card">
					<div class="card-header">購買人資訊</div>
					<div class="card-body">
						<table>
							<tr>
								<td><h5 class="card-title">購買人姓名:</h5></td>
								<td><h5>${orderInfo.mName}</h5></td>
							</tr>
							<tr>
								<td><h5>收件人姓名:</h5></td>
								<td><form:input class="card-title" type="text" path="oReceiveName" /></td>
							</tr>
							<tr>
								<td><h5>收件人地址:</h5></td>
								<td><form:input class="card-title" type="text" path="oAddress" /></td>
							</tr>
							<tr>
								<td><h5>收件人電話:</h5></td>
								<td><form:input class="card-title" type="text" path="oReceivePhone" /></td>
							</tr>
							<tr>
								<td><h5>備註:</h5></td>
								<td><form:input class="card-title" type="text" path="oNote" /></td>
							</tr>
							<tr>
								<td><input type="submit" class="btn btn-outline-primary" value="送出"></td>
							</tr>
						</table>

					</div>
				</div>
				<div style="margin: 20% 2%; display: inline-block; width: 45%" class="card">
					<div class="card-header">購物明細</div>
					<div>
						<table style="background-color: #99FF99; width: 100%;">
							<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content}">
								<tr>
									<td>${cart.value.pName}</td>
									<td>數量:${cart.value.iQty}</td>
									<td>單價:${cart.value.pPrice}</td>
									<td>小計:${cart.value.iQty * cart.value.pPrice}</td>
								</tr>
							</c:forEach>
							<tr>
								<td>金額總計:</td>
								<td><jsp:getProperty property="oTotalAmount" name="orderInfo" /></td>
							</tr>
						</table>
						<!--end of 購物明細 -->
					</div>
				</div>
				<form:input type="hidden" value="${orderInfo.mAccount}" path="mAccount" />
				<form:input type="hidden" value="${orderInfo.oTimestamp}" path="oTimestamp" />
				<form:input type="hidden" value="${orderInfo.oTotalAmount}" path="oTotalAmount" />
			</form:form>
		</div>
	</div>

	<script src="<c:url value='/css/RWDcss/js/jquery-migrate-3.0.1.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/popper.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/jquery.easing.1.3.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/jquery.stellar.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/aos.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/jquery.animateNumber.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/bootstrap-datepicker.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/scrollax.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/main.js'/>"></script>
	<script src="http://malsup.github.io/jquery.form.js"></script>

</body>
</html>
