<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="<c:url value='/css/RWDcss/js/jquery.min.js'/>"></script>
<script type="text/javascript">
function DeleteItem(clicked_id) {
	var url = "<c:url value='/DeleteCartProduct?pId=" + clicked_id + "'/>";
	$.ajax({
		url : url,
		type : "get",
		success : function(data) {
			$("div.modal-body").html(data);
		}
	});
};

function CheckOutButton(){
	if(${empty shoppingCart.content}){
		alert("購物車內無商品");
		return;
	}else{
		location.href = "<c:url value='/CheckOut'/>";
	}
};

$(document).ready(function() {
	$("input#addtocart").click(function(e) {
		e.preventDefault();
		var form = $(this.form);
		var url = form.attr('action');
		$.ajax({
			type : "POST",
			url : url,
			data : form.serialize(),
			success : function(data) {
				$("div.modal-body").html(data);
				alert("商品已加入購物車");
			}
		});
	});
});
	// 	$(document).ready(function() {
	// 		$("input:button").click(function(e) {
	// 			e.preventDefault();
	// 			var form = $(this.form);
	// 			var url = form.attr('action');
	// 			$.ajax({
	// 				type : "POST",
	// 				url : url,
	// 				data : form.serialize(),
	// 				success : function(data) {
	// 					$("div#shoppingCartMenu").html(data);
	// 				}
	// 			});
	// 		});
	// 	});
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

<style type="text/css">
* {
	font-family: Microsoft JhengHei;
}

.PageButtonDiv {
	margin: 10px;
}

.PageButton {
	color: #20bf6b !important;
	text-transform: uppercase;
	background: #ffffff;
	padding: 10px;
	border: 4px solid #20bf6b !important;
	border-radius: 6px;
	display: inline-block;
	transition: all 0.3s ease 0s;
	text-decoration: none;
}

.PageButton:hover {
	color: #494949 !important;
	border-radius: 50px;
	border-color: #494949 !important;
	transition: all 0.3s ease 0s;
}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a style="font-size: 30px;" class="navbar-brand" href="<c:url value='/'/>">旅遊趣</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a style="font-size: 20px;" href="<c:url value='/'/>" class="nav-link">Home</a></li>
					<li class="nav-item"><a style="font-size: 20px;" href="<c:url value='/products/1'/>" class="nav-link">Products</a></li>
					<li class="nav-item"><a style="font-size: 20px;" href="<c:url value='/ForumIndex/1'/>" class="nav-link">討論區</a></li>
					<c:if test="${empty LoginOK}">
						<li class="nav-item"><a style="font-size: 20px;" href="<c:url value='/login'/>" class="nav-link">Login</a></li>
						<li class="nav-item"><a style="font-size: 20px;" href="<c:url value='/register/add'/>" class="nav-link">Register</a></li>
					</c:if>
					<c:if test="${!empty LoginOK}">
						<li class="nav-item"><a style="font-size: 20px;" href="<c:url value='/UserDashboard'/>" class="nav-link">會員中心</a></li>
						<li class="nav-item"><a style="font-size: 20px;" href="<c:url value='/logout'/>" class="nav-link">Logout</a></li>
					</c:if>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item dropdown"><a style="font-size: 20px;" class="nav-link dropdown-toggle" href="#ChangePage" id="navbarDropdown"
						role="button" data-toggle="modal" aria-haspopup="true" aria-expanded="false" data-target="#shoppingCartMenu">購物車</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
	<!-- Modal -->
	<div class="modal fade" id="shoppingCartMenu" tabindex="-1" role="dialog" aria-labelledby="shoppingCartMenuTitle" aria-hidden="true"
		data-backdrop="false">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="shoppingCartMenuTitle">
						<c:choose>
							<c:when test="${!empty LoginOK}">
						${LoginOK.mName}的購物車
						</c:when>
							<c:otherwise>
						你的購物車
						</c:otherwise>
						</c:choose>
					</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:if test="${empty shoppingCart.content }">
						<p style="font-weight: 8; font-size: 20px; text-align: center; margin-top: 5%">購物車內已無商品</p>
					</c:if>
					<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
						<img style="width: 80px; float: left; vertical-align: center; margin-right: 1%;" src="<c:url value='/showPic/${cart.value.pId}'/>">
						<p style="line-height: 10px">${cart.value.pName}</p>
						<span style="line-height: 5px">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</span>
						<span><input class="btn btn-outline-danger" id="${cart.value.pId}" type="button" onclick="DeleteItem(this.id)" value="刪除" /> </span>
						<c:choose>
							<c:when test="${vs.last}">
							</c:when>
							<c:otherwise>
								<hr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" data-dismiss="modal">繼續購物</button>
					<button type="button" onclick="CheckOutButton()" class="btn btn-success">結帳</button>
				</div>
			</div>
		</div>
	</div>
	<div class="hero-wrap js-fullheight" style="background-image: url(<c:url value='/css/RWDcss/images/bg_5.jpg'/>);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">想去哪裡玩呢？</h1>
				</div>
			</div>
		</div>
	</div>


	<section id="ChangePage" class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 sidebar">
					<div class="sidebar-wrap bg-light ftco-animate">
						<h3 class="heading mb-4">尋找商品</h3>
						<form action="<c:url value='/QueryProduct/1'/>" method="get">
							<div class="fields">
								<div class="form-group">
									<input name="QueryString" type="text" class="form-control" placeholder="搜尋關鍵字">
								</div>
								<div class="form-group">
									<input type="submit" value="搜尋" class="btn btn-primary py-3 px-5">
								</div>
							</div>
						</form>
					</div>
				</div>

				<div class="col-lg-9">
					<div class="row">
						<div style="width: 100%; margin: 0 5% 5% 2%; border-bottom: 1px solid gray;">
							<table>
								<tr style="font-size: 20px;">
									<td style="width: 20%">排序方式:</td>
									<td style="width: 22%"><a href="<c:url value='/PriceDesc/1'/>">價格高→低</a></td>
									<td style="width: 22%"><a href="<c:url value='/PriceAsc/1'/>">價格低→高</a></td>
									<td style="width: 22%"><a href="<c:url value='/ReviewDesc/1'/>">評價高→低</a></td>
									<td style="width: 22%"><a href="<c:url value='/ReviewAsc/1'/>">評價低→高</a></td>
								</tr>
							</table>
						</div>
						<div style="width: 100%; margin: 0 5% 0% 2%;">
							<c:choose>
								<c:when test="${!empty QueryString&&!empty productList }">
									<p style="font-size: 30px;">
										商品內容包含<span style="color: green;">${QueryString}</span>的商品：
									</p>
								</c:when>
								<c:when test="${!empty QueryString&&empty productList }">
									<p style="font-size: 30px;">
										查無商品內容包含<span style="color: green; font-size: 30px;">${QueryString}</span>的商品。
									</p>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</div>
						<c:forEach varStatus="stVar" var="productBean" items="${productList}">
							<c:if test="${stVar.index%3==0}">
								<br>
							</c:if>
							<div class="col-md-4 ftco-animate">
								<div class="destination">
									<a href="<c:url value='/ProductSingle/${productBean.pId}'/>" class="img img-2 d-flex justify-content-center align-items-center"
										style="background-image: url(<c:url value='/showPic/${productBean.pId}'/>);"> </a>
									<div class="text p-3">
										<div class="d-flex" style="height: 120px;">
											<div class="one">
												<h3 style="height: 100px;">
													<a href="<c:url value='/ProductSingle/${productBean.pId}'/>">${productBean.pName}</a>
												</h3>
												<p class="rate">
													<c:choose>
														<c:when test="${productBean.pAvgRating>=1&&productBean.pAvgRating<2 }">
															<i class="icon-star"></i>
															<i class="icon-star-o"></i>
															<i class="icon-star-o"></i>
															<i class="icon-star-o"></i>
															<i class="icon-star-o"></i>
														</c:when>
														<c:when test="${productBean.pAvgRating>=2&&productBean.pAvgRating<3 }">
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star-o"></i>
															<i class="icon-star-o"></i>
															<i class="icon-star-o"></i>
														</c:when>
														<c:when test="${productBean.pAvgRating>=3&&productBean.pAvgRating<4 }">
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star-o"></i>
															<i class="icon-star-o"></i>
														</c:when>
														<c:when test="${productBean.pAvgRating>=4&&productBean.pAvgRating<5 }">
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star-o"></i>
														</c:when>
														<c:otherwise>
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star"></i>
															<i class="icon-star"></i>
														</c:otherwise>
													</c:choose>
													<span>${productBean.pAvgRating}</span>
												</p>
											</div>
											<div class="two">
												<span class="price per-price">$${productBean.pPrice}<br></span>
											</div>
										</div>
										<hr>
										<p class="bottom-area d-flex">
											<a class="btn btn-outline-info" href="<c:url value='/ProductSingle/${productBean.pId}'/>">詳細資訊</a>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<div class="PageButtonDiv">
						<c:if test="${pageNo>1}">
							<a class="PageButton" href="<c:url value='/${MappingPath}/1'/>"> 第一頁</a>
						</c:if>
						<c:if test="${pageNo>1}">
							<a class="PageButton" href="<c:url value='/${MappingPath}/${pageNo-1}'/>"> 上一頁</a>
						</c:if>
						<c:if test="${pageNo!=totalPages&&!empty productList}">
							<a class="PageButton" href="<c:url value='/${MappingPath}/${pageNo+1}'/>"> 下一頁</a>
						</c:if>
					</div>
					<!-- .col-md-8 -->
				</div>
			</div>
		</div>
	</section>
	<!-- .section -->

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<ul style="color: white">
							<li style="margin-top: 3px;">©2019 Travel Fun Technology</li>
							<li style="margin-top: 3px;">Limited. All Rights Reserved.</li>
							<li style="margin-top: 3px;">粉專：https://www.TravelFun.com/EEIT108/</li>
						</ul>
						<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
							<br>
							<li style="margin-top: 3px; color: white">支付方式</li>
							<br>
							<img class=" mt-2" src="<c:url value='/img/visa.png'/>" height="40px" href="">
							<img class=" mt-2" src="<c:url value='/img/master.png'/>" height="40px" href="">
							<img class=" mt-2" src="<c:url value='/img/jcb.png'/>" height="40px" href="">
							<img class=" mt-2" src="<c:url value='/img/american.png'/>" height="40px" href="">
							<img class=" mt-2" src="<c:url value='/img/paypal.png'/>" height="40px" href="">
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">認識旅遊趣</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">關於我們</a></li>
							<li><a href="#" class="py-2 d-block">客服</a></li>
							<li><a href="#" class="py-2 d-block">合作夥伴</a></li>
							<li><a href="#" class="py-2 d-block">加入我們</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">攜手旅遊趣</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">商業用戶</a></li>
							<li><a href="#" class="py-2 d-block">聯合行銷</a></li>
							<li><a href="#" class="py-2 d-block">名人合作</a></li>
							<li><a href="#" class="py-2 d-block">同業交易</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span class="text">106台北市大安區復興南路一段390號 2,3號</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span class="text">02-23766198</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span class="text">TravleFun@outlook.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
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