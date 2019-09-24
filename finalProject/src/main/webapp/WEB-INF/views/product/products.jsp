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
				$("div#shoppingCartMenu").html(data);
			}
		});
	};
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

div.dropdown-menu {
	/* 	width: 300px; */
	/* 	height: 423px; */
	background-color: #f0f0f0;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	overflow-y: auto;
}

div#shoppingCartMenu {
	width: 280px;
}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
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
						id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">購物車</a>
						<div id="shoppingCartMenu" class="dropdown-menu" aria-labelledby="navbarDropdown">
							<c:if test="${empty shoppingCart.content }">
								<p style="text-align: center; margin-top: 10%">購物車內已無商品</p>
							</c:if>
							<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
								<hr>
								<table>
									<tr>
										<td rowspan="2"><img style="width: 80px; height: 80px;"
											src="<c:url value='/showPic/${cart.value.pId}'/>"></td>
										<td style="padding: 0 10px;">${cart.value.pName}</td>
									</tr>
									<tr>
										<td style="padding: 0 5px;">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</td>
										<td><input style="margin-left: 10px;" id="${cart.value.pId}" type="button"
												onclick="DeleteItem(this.id)" value="刪除" /></td>
									</tr>
								</table>
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
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">想去哪裡玩呢？</h1>
				</div>
			</div>
		</div>
	</div>


	<section class="ftco-section ftco-degree-bg">
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
									<div class="select-wrap one-third">
										<div class="icon">
											<span class="ion-ios-arrow-down"></span>
										</div>
										<select name="" id="" class="form-control">
											<option value="">Select Location</option>
											<option value="">San Francisco USA</option>
											<option value="">Berlin Germany</option>
											<option value="">Lodon United Kingdom</option>
											<option value="">Paris Italy</option>
										</select>
									</div>
								</div>
								<!-- 								<div class="form-group"> -->
								<!-- 									<input type="text" id="checkin_date" class="form-control" placeholder="Date from"> -->
								<!-- 								</div> -->
								<!-- 								<div class="form-group"> -->
								<!-- 									<input type="text" id="checkin_date" class="form-control" placeholder="Date to"> -->
								<!-- 								</div> -->
								<!-- 								<div class="form-group"> -->
								<!-- 									<div class="range-slider"> -->
								<!-- 										<span> <input type="number" value="25000" min="0" max="120000" /> - <input -->
								<!-- 												type="number" value="50000" min="0" max="120000" /> -->
								<!-- 										</span> -->
								<!-- 										<input value="1000" min="0" max="120000" step="500" type="range" /> -->
								<!-- 										<input value="50000" min="0" max="120000" step="500" type="range" /> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<div class="form-group">
									<input type="submit" value="Search" class="btn btn-primary py-3 px-5">
								</div>
							</div>
						</form>
					</div>
					<!--用評價方式搜尋商品(slider bar) -->
					<!--         		<div class="sidebar-wrap bg-light ftco-animate"> -->
					<!--         			<h3 class="heading mb-4">Star Rating</h3> -->
					<!--         			<form method="post" class="star-rating"> -->
					<!-- 							  <div class="form-check"> -->
					<!-- 									<input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
					<!-- 									<label class="form-check-label" for="exampleCheck1"> -->
					<!-- 										<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p> -->
					<!-- 									</label> -->
					<!-- 							  </div> -->
					<!-- 							  <div class="form-check"> -->
					<!-- 						      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
					<!-- 						      <label class="form-check-label" for="exampleCheck1"> -->
					<!-- 						    	   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p> -->
					<!-- 						      </label> -->
					<!-- 							  </div> -->
					<!-- 							  <div class="form-check"> -->
					<!-- 						      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
					<!-- 						      <label class="form-check-label" for="exampleCheck1"> -->
					<!-- 						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p> -->
					<!-- 						     </label> -->
					<!-- 							  </div> -->
					<!-- 							  <div class="form-check"> -->
					<!-- 							    <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
					<!-- 						      <label class="form-check-label" for="exampleCheck1"> -->
					<!-- 						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p> -->
					<!-- 						      </label> -->
					<!-- 							  </div> -->
					<!-- 							  <div class="form-check"> -->
					<!-- 						      <input type="checkbox" class="form-check-input" id="exampleCheck1"> -->
					<!-- 						      <label class="form-check-label" for="exampleCheck1"> -->
					<!-- 						      	<p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p> -->
					<!-- 							    </label> -->
					<!-- 							  </div> -->
					<!-- 							</form> -->
					<!--         		</div> -->
				</div>

				<div class="col-lg-9">
					<div class="row">
						<div style="width: 100%; margin: 0 5% 5% 2%; border-bottom: 1px solid gray;">
							<table>
								<tr>
									<td style="width: 20%">排序方式:</td>
									<td style="width: 22%"><a href="<c:url value='/ProductsPriceDesc/1'/>">價格高→低</a></td>
									<td style="width: 22%"><a href="<c:url value='/ProductsPriceAsc/1'/>">價格低→高</a></td>
									<td style="width: 22%"><a href="<c:url value='/ProductsReviewDesc/1'/>">評價高→低</a></td>
									<td style="width: 22%"><a href="<c:url value='/ProductsReviewAsc/1'/>">評價低→高</a></td>
								</tr>

							</table>

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
										<div class="d-flex" style="height:100px;">
											<div class="one">
												<h3 style="height: 70px;">
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
<!-- 										<p>這邊要放商品簡介文字</p> -->
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
						<c:if test="${pageNo!=totalPages}">
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
						<h2 class="ftco-heading-2">dirEngine</h2>
						<p>Far far away, behind the word mountains, far from the countries Vokalia and
							Consonantia, there live the blind texts.</p>
						<ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Service</a></li>
							<li><a href="#" class="py-2 d-block">Terms and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Become a partner</a></li>
							<li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span class="text">203 Fake St.
										Mountain View, San Francisco, California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span class="text">+2
											392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i>
						by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
				stroke="#F96D00" /></svg>
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