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
				$("div.dropdown-menu").html(data);
			}
		});
	};
	$(document).ready(function() {
		$("input:button").click(function(e) {
			e.preventDefault();
			var form = $(this.form);
			var url = form.attr('action');
			$.ajax({
				type : "POST",
				url : url,
				data : form.serialize(),
				success : function(data) {
					$("div.dropdown-menu").html(data);
				}
			});
		});
	});
</script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

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
	width: 300px;
	height: 423px;
	background-color: #f0f0f0;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	overflow-y: auto;
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
					<li class="nav-item"><a href="<c:url value='/'/>" class="nav-link">Home</a></li>
					<li class="nav-item active"><a href="<c:url value='/products/1'/>" class="nav-link">Products</a></li>
					<c:if test="${empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/login'/>" class="nav-link">Login</a></li>
						<li class="nav-item"><a href="<c:url value='/register/add'/>" class="nav-link">Register</a></li>
						<li class="nav-item"><a href="<c:url value='/paySuccess'/>" class="nav-link">帳單測試</a></li>
					</c:if>
					<li class="nav-item"><a href="<c:url value='/AddProduct'/>" class="nav-link">新增商品</a></li>
					<c:if test="${!empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link">Logout</a></li>
						<li class="nav-item"><a href="<c:url value='/OrderDetails'/>" class="nav-link">訂單查詢</a></li>
						<li class="nav-item"><a href="<c:url value='/review'/>" class="nav-link">評價查詢</a></li>
					</c:if>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">購物車</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<c:if test="${empty shoppingCart.content }">
								<p style="text-align: center; margin-top: 10%">購物車內已無商品</p>
							</c:if>
							<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
								<hr>
								<img style="width: 50px; height: 50px; float: left;"
									src="<c:url value='/showPic/${cart.value.pId}'/>">
								<p style="line-height: 10px">${cart.value.pName}</p>
								<span style="line-height: 5px">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</span>
								<span><input id="${cart.value.pId}" type="button" onclick="DeleteItem(this.id)"
										value="刪除" /> </span>
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
						<h3 class="heading mb-4">Find City</h3>
						<form action="#">
							<div class="fields">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Destination, City">
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
								<div class="form-group">
									<input type="text" id="checkin_date" class="form-control" placeholder="Date from">
								</div>
								<div class="form-group">
									<input type="text" id="checkin_date" class="form-control" placeholder="Date to">
								</div>
								<div class="form-group">
									<div class="range-slider">
										<span> <input type="number" value="25000" min="0" max="120000" /> - <input
												type="number" value="50000" min="0" max="120000" />
										</span>
										<input value="1000" min="0" max="120000" step="500" type="range" />
										<input value="50000" min="0" max="120000" step="500" type="range" />
									</div>
								</div>
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
						<c:forEach varStatus="stVar" var="productBean" items="${productList}">
							<c:if test="${stVar.index%3==0}">
								<br>
							</c:if>
							<div class="col-md-4 ftco-animate">
								<div class="destination">
									<a href="" class="img img-2 d-flex justify-content-center align-items-center"
										style="background-image: url(<c:url value='/showPic/${productBean.pId}'/>);"> <!-- 											<div class="icon d-flex justify-content-center align-items-center"> -->
										<!-- 												<span class="icon-search2"></span> --> <!-- 											</div> -->
									</a>
									<div class="text p-3">
										<div class="d-flex">
											<div class="one">
												<h3>
													<a href="">${productBean.pName}</a>
												</h3>
												<p class="rate">
													<i class="icon-star"></i> <i class="icon-star"></i> <i class="icon-star"></i> <i
														class="icon-star"></i> <i class="icon-star-o"></i> <span>8 Rating</span>
												</p>
											</div>
											<div class="two">
												<span class="price per-price">$${productBean.pPrice}<br> <small>/night</small></span>
											</div>
										</div>
										<p>這邊要放商品簡介文字</p>
										<hr>
										<p class="bottom-area d-flex">
											<form:form method="POST" action="${pageContext.request.contextPath}/Buy"
												modelAttribute="orderItem" id="idform">
												<c:if test="${productBean.pInstock==0 }">
													<p>已售完</p>
												</c:if>
												<c:if test="${productBean.pInstock!=0 }">
													<form:select path="iQty">
														<c:forEach var="stock" begin="1" end="${productBean.pInstock}">
															<option value="${stock}">${stock}</option>
														</c:forEach>
													</form:select>
												</c:if>
												<form:input type="hidden" path="pId" value="${productBean.pId }" />
												<form:input type="hidden" path="pName" value="${productBean.pName }" />
												<form:input type="hidden" path="pPrice" value="${productBean.pPrice }" />
												<c:if test="${productBean.pInstock!=0 }">
													<input class="btn btn-outline-info" style="float: right;" type="button" value="加到購物車">
												</c:if>
											</form:form>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<div class="PageButtonDiv">
						<c:if test="${pageNo>1}">
							<a class="PageButton" href="<c:url value='/productsRWD/1'/>"> 第一頁</a>
						</c:if>
						<c:if test="${pageNo>1}">
							<a class="PageButton" href="<c:url value='/productsRWD/${pageNo-1}'/>"> 上一頁</a>
						</c:if>
						<c:if test="${pageNo!=totalPages}">
							<a class="PageButton" href="<c:url value='/productsRWD/${pageNo+1}'/>"> 下一頁</a>
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