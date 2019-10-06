<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>旅遊趣</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="<c:url value='/css/RWDcss/js/jquery.min.js'/>"></script>
<!-- 字體CDN -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+TC&display=swap"
	rel="stylesheet">
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
					$("div#shoppingCartMenu").html(data);
				}
			});
		});
	});
	//京都天氣
	!function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://weatherwidget.io/js/widget.min.js';
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, 'script', 'weatherwidget-io-js');
</script>
<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/open-iconic-bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/animate.css'/>">

<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/owl.carousel.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/owl.theme.default.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/magnific-popup.css'/>">

<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/aos.css'/>">

<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/ionicons.min.css'/>">

<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/bootstrap-datepicker.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/jquery.timepicker.css'/>">


<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/flaticon.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/RWDcss/css/icomoon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/style.css'/>">
<style type="text/css">
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

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container"
			style="font-family: 'Noto Serif TC', serif; color: white">
			<a class="navbar-brand" href="<c:url value='/'/>">旅遊趣</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="<c:url value='/'/>"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="<c:url value='/shop/1'/>"
						class="nav-link">Products</a></li>
					<c:if test="${empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/login'/>"
							class="nav-link">Login</a></li>
						<li class="nav-item"><a href="<c:url value='/register/add'/>"
							class="nav-link">Register</a></li>
						<li class="nav-item"><a href="<c:url value='/ForumIndex'/>"
							class="nav-link">討論區</a></li>
					</c:if>
					<c:if test="${!empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/ForumIndex/1'/>"
							class="nav-link">討論區</a></li>
						<li class="nav-item"><a
							href="<c:url value='/UserDashboard'/>" class="nav-link">會員中心</a></li>
						<li class="nav-item"><a href="<c:url value='/OrderDetails'/>"
							class="nav-link">查詢訂單</a></li>
						<li class="nav-item"><a href="<c:url value='/Dashboard'/>"
							class="nav-link">後臺系統</a></li>
						<li class="nav-item"><a href="<c:url value='/logout'/>"
							class="nav-link">Logout</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap js-fullheight"
		style="background-image: url(<c:url value='/img/KyotoFUJI.jpg'/>);">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate"
					data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4 justify-content-center"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"
						style="text-align: center;">
						<strong style="text-align: center;">京都<br></strong>
					</h1>

					<div class="block-17 my-4" style="width: 80%;"></div>
				</div>
			</div>
		</div>
	</div>

	<section
		class="ftco-section services-section bg-light justify-content-center"
		style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-4 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
						<div class="d-flex justify-content-center">
							<div class="icon">
								<span class=""></span>
							</div>
						</div>
						<div class="media-body p-2 mt-2">
							<h3 class="heading mb-4">歷史文化魅力</h3>
							<p>金閣寺、清水寺、伏見稻荷大社等多處世界歷史文化遺產，日本具代表性的觀光都市和文化都市。</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
						<div class="d-flex justify-content-center">
							<div class="icon">
								<span class=""></span>
							</div>
						</div>
						<div class="media-body p-2 mt-2">
							<h3 class="heading mb-4">自然美景</h3>
							<p>嵐山竹林、天橋立、嵯峨渡月橋，帶您一探京都一年四季不同的樣貌</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
						<div class="d-flex justify-content-center">
							<div class="icon">
								<span class=""></span>
							</div>
						</div>
						<div class="media-body p-2 mt-2">
							<h3 class="heading mb-4">舌尖美食</h3>
							<p>奧舟湯豆腐、茶寮都路里、三嶋亭壽喜燒，品嘗京都精緻料理。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section"
		style="font-family: 'Noto Serif TC', serif;">
		<div class="container">
			<div class="row justify-content-start">
				<div class="col-md-5 heading-section ftco-animate">
					<!-- 					<span class="subheading">Best Directory Website</span> -->
					<h2 class="mb-4 pb-3">
						<strong>認識京都</strong>
					</h2>
					<h5>雖然曾歷戰火，京都之美仍然遺世獨立。只要親自走訪，你就會發現京都把日本的「侘寂」美學詮釋得有多淋漓盡致。</h5>
					<h5>作為日本藝妓發源地，值得你深入認識這個古典的文藝世界。花一個早晨在嵐山的竹林裡靜思，學習正宗懷石料理，或是到金閣寺感受靜謐自在。伏見稻荷大社也是人氣狂推的必去景點，漫步在著名的鳥居隧道，宛如一步步走進桃花源。</h5>

					<!-- 					<p> -->
					<!-- 						<a href="#" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3">Read more</a> -->
					<!-- 					</p> -->
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-6 heading-section ftco-animate">
					<span class="subheading"></span>
					<h2 class="mb-4 pb-3">
						<strong></strong>實用資訊
					</h2>
					<div class=" ">
						<a class="weatherwidget-io"
							href="https://forecast7.com/zh-tw/35d01135d77/kyoto/"
							data-label_1="京都" data-font="微軟正黑體 (Microsoft JhengHei)"
							data-theme="original">京都</a>
					</div>
					<div class="row justify-content-start">
						<div class="col-md-6">
							<ul class="mt-5 " style="list-style-type: none; margin: 0px;">
								<li>時區</li>
								<li>GMT +09:00</li>
								<li>比你的所在地時區快1個小時</li>
							</ul>
						</div>
						<div class="col-md-6">
							<ul class="mt-5 " style="list-style-type: none; margin: 0px;">
								<li>最佳旅行時間</li>
								<li>4月 - 5月</li>
								<li>櫻花季</li>
								<li>10月</li>
								<li>時代祭或鞍馬山野火節</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section ftco-destination">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div id="carouselExampleIndicators" class="carousel slide "
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner ">
							<div class=" carousel-item active ">
								<img class=" d-block w-100"
									src="<c:url value='/img/kouyou.JPG'/>" alt="First slide">
								<span
									style="text-align: center; display: block; font-family: 'Noto Serif TC', serif"></span>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="<c:url value='/img/universal studio.JPG'/>"
									alt="Second slide"> <span
									style="text-align: center; display: block; font-family: 'Noto Serif TC', serif"></span>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100"
									src="<c:url value='/img/coupon400.JPG'/>" alt="Third slide">
								<span
									style="text-align: center; display: block; font-family: 'Noto Serif TC', serif"></span>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>

	</section>
	<section class="ftco-section bg-light "
		style="font-family: 'Noto Serif TC', serif">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span id="testspan" class="subheading">好評不斷</span>
					<h2 class="mb-4">
						<strong>2019 京都當地玩樂</strong>
					</h2>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row ">
				<c:forEach varStatus="vs" var="kyotoproduct" items="${productList}"
					begin="22" end="26">
					<div class="col-sm col-md-6 col-lg ftco-animate container">
						<div class="destination">
							<a href="<c:url value='/ProductSingle/${kyotoproduct.pId}'/>"
								class="img img-2 d-flex justify-content-center align-items-center"
								style="background-image: url(<c:url value='/showPic/${kyotoproduct.pId}'/>);">
								<!-- 							<div class="icon d-flex justify-content-center align-items-center"> -->
								<!-- 								<span class="icon-search2"></span> --> <!-- 							</div> -->
							</a>
							<div class="text p-3">
								<div class="d-flex">
									<div class="one">
										<h3 style="height: 80px;">
											<a href="<c:url value='/ProductSingle/${productBean.pId}'/>">${kyotoproduct.pName}</a>
										</h3>
										<p class="rate">
											<c:choose>
												<c:when
													test="${kyotoproduct.pAvgRating>=1&&kyotoproduct.pAvgRating<2 }">
													<i class="icon-star"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
												</c:when>
												<c:when
													test="${kyotoproduct.pAvgRating>=2&&kyotoproduct.pAvgRating<3 }">
													<i class="icon-star"></i>
													<i class="icon-star"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
												</c:when>
												<c:when
													test="${kyotoproduct.pAvgRating>=3&&kyotoproduct.pAvgRating<4 }">
													<i class="icon-star"></i>
													<i class="icon-star"></i>
													<i class="icon-star"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
												</c:when>
												<c:when
													test="${kyotoproduct.pAvgRating>=4&&kyotoproduct.pAvgRating<5 }">
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
											<span>${kyotoproduct.pAvgRating}</span>
										</p>
									</div>
									<div class="two">
										<span class="price per-price">$${kyotoproduct.pPrice}<br></span>
									</div>
								</div>
								<p style="height: 180px;">${kyotoproduct.pContent}</p>
								<hr>
								<p class="bottom-area d-flex">
									<a class="btn btn-outline-info"
										href="<c:url value='/ProductSingle/${kyotoproduct.pId}'/>">詳細資訊</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<center>
			<a href="<c:url value='/shop/1'/>"><button type="button"
					class="btn btn-outline-warning btn btn-lg mt-5">探索更多</button></a>
		</center>
	</section>


	<section class="ftco-section bg-light"
		style="font-family: 'Noto Serif TC', serif">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<h2>
						<strong>東京附近目的地</strong>
					</h2>
				</div>
			</div>
			<div class="row">
				<div class=" view col-md-3">
					<a href="<c:url value='/Tokyotheme'/>"><img
						src="<c:url value='/img/Tokyo.JPG'/>" class="img-fluid" alt=""></a>
					<div class="mask flex-center rgba-black-strong"></div>
				</div>
				<div class=" view col-md-3">
					<a href="<c:url value='/Osakatheme'/>"><img
						src="<c:url value='/img/Osaka.JPG'/>" class="img-fluid" alt=""></a>
					<div class="mask flex-center rgba-black-strong"></div>
				</div>
			</div>
		</div>
	</section>
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
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
							<br>
							<li style="margin-top: 3px; color: white">支付方式</li>
							<br>
							<img class=" mt-2" src="<c:url value='/img/visa.png'/>"
								height="40px" href="">
							<img class=" mt-2" src="<c:url value='/img/master.png'/>"
								height="40px" href="">
							<img class=" mt-2" src="<c:url value='/img/jcb.png'/>"
								height="40px" href="">
							<img class=" mt-2" src="<c:url value='/img/american.png'/>"
								height="40px" href="">
							<img class=" mt-2" src="<c:url value='/img/paypal.png'/>"
								height="40px" href="">
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
								<li><span class="icon icon-map-marker"></span><span
									class="text">106台北市大安區復興南路一段390號 2,3號</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">02-23766198</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">TravleFun@outlook.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 			<div class="row"> -->
			<!-- 				<div class="col-md-12 text-center"> -->

			<!-- 					<p> -->
			<!-- 						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			<!-- 						Copyright &copy; -->
			<!-- 						<script> -->
			<!--  							document.write(new Date().getFullYear()); -->
			<!-- 						</script> -->
			<!-- 						All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> -->
			<!-- 						by <a href="https://colorlib.com" target="_blank">Colorlib</a> -->
			<!-- 						Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			<!-- 					</p> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<!-- 		<svg class="circular" width="48px" height="48px"> -->
		<%-- 			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> --%>
		<%-- 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" --%>
		<%-- 				stroke="#F96D00" /></svg> --%>
	</div>



	<script
		src="<c:url value='/css/RWDcss/js/jquery-migrate-3.0.1.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/popper.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/jquery.easing.1.3.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/jquery.stellar.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/owl.carousel.min.js'/>"></script>
	<script
		src="<c:url value='/css/RWDcss/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/aos.js'/>"></script>
	<script
		src="<c:url value='/css/RWDcss/js/jquery.animateNumber.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/bootstrap-datepicker.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/scrollax.min.js'/>"></script>
	<script src="<c:url value='/css/RWDcss/js/main.js'/>"></script>
	<script src="http://malsup.github.io/jquery.form.js"></script>
</body>
</html>
