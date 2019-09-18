<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>旅遊趣</title>
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
					<li class="nav-item"><a href="<c:url value='/AddProduct'/>" class="nav-link">新增商品</a></li>
					<li class="nav-item"><a href="<c:url value='/AddProductDB'/>" class="nav-link">新增商品DB</a></li>
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
		style="background-image: url(<c:url value='/css/RWDcss/images/bg_1.jpg'/>);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start"
				data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
						<strong>探索 <br></strong> 屬於你的城市
					</h1>
					<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to
						stay, eat, shop, or visit from local experts</p>
					<div class="block-17 my-4" style="width: 80%;">
						<form action="<c:url value='/QueryProduct/1'/>" method="get" class="d-block d-flex">
							<div class="fields d-block d-flex">
								<div class="textfield-search one-third">
									<input name="QueryString" type="text" class="form-control" placeholder="Ex: food, service, hotel">
								</div>
							</div>
							<input type="submit" class="search-submit btn btn-primary" value="Search">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section services-section bg-light">
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
						<div class="d-flex justify-content-center">
							<div class="icon">
								<span class="flaticon-guarantee"></span>
							</div>
						</div>
						<div class="media-body p-2 mt-2">
							<h3 class="heading mb-3">保證最低價</h3>
							<p>極致的優惠價，低到老闆開始懷疑人生。</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
						<div class="d-flex justify-content-center">
							<div class="icon">
								<span class="flaticon-like"></span>
							</div>
						</div>
						<div class="media-body p-2 mt-2">
							<h3 class="heading mb-3">旅行者的最愛</h3>
							<p>愉快的旅行，美好的回憶，我們的回頭客絡繹不絕。</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
						<div class="d-flex justify-content-center">
							<div class="icon">
								<span class="flaticon-detective"></span>
							</div>
						</div>
						<div class="media-body p-2 mt-2">
							<h3 class="heading mb-3">不停在全世界探索</h3>
							<p>我們隨時更新全世界最新的商品，不怕你買過，怕你沒看過。</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services d-block text-center">
						<div class="d-flex justify-content-center">
							<div class="icon">
								<span class="flaticon-support"></span>
							</div>
						</div>
						<div class="media-body p-2 mt-2">
							<h3 class="heading mb-3">24小時客服</h3>
							<p>讓旅行中的你遇到疑問時，不用擔心任何時差。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-destination">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">Featured</span>
					<h2 class="mb-4">
						<strong>Featured</strong> Destination
					</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="destination-slider owl-carousel ftco-animate">
						<div class="item">
							<div class="destination">
								<a href="#" class="img d-flex justify-content-center align-items-center"
									style="background-image: url(<c:url value='/css/RWDcss/images/destination-1.jpg'/>);">
									<!-- 									<div class="icon d-flex justify-content-center align-items-center"> --> <!-- 										<span class="icon-search2"></span> -->
									<!-- 									</div> -->
								</a>
								<div class="text p-3">
									<h3>
										<a href="#">Paris, Italy</a>
									</h3>
									<span class="listing">15 Listing</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="destination">
								<a href="#" class="img d-flex justify-content-center align-items-center"
									style="background-image: url(<c:url value='/css/RWDcss/images/destination-2.jpg'/>);">
									<!-- 									<div class="icon d-flex justify-content-center align-items-center"> --> <!-- 										<span class="icon-search2"></span> -->
									<!-- 									</div> -->
								</a>
								<div class="text p-3">
									<h3>
										<a href="#">San Francisco, USA</a>
									</h3>
									<span class="listing">20 Listing</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="destination">
								<a href="#" class="img d-flex justify-content-center align-items-center"
									style="background-image: url(<c:url value='/css/RWDcss/images/destination-3.jpg'/>;"> <!-- 									<div class="icon d-flex justify-content-center align-items-center"> -->
									<!-- 										<span class="icon-search2"></span> --> <!-- 									</div> -->
								</a>
								<div class="text p-3">
									<h3>
										<a href="#">Lodon, UK</a>
									</h3>
									<span class="listing">10 Listing</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="destination">
								<a href="#" class="img d-flex justify-content-center align-items-center"
									style="background-image: url(<c:url value='/css/RWDcss/images/destination-4.jpg'/>);">
									<!-- 									<div class="icon d-flex justify-content-center align-items-center"> --> <!-- 										<span class="icon-search2"></span> -->
									<!-- 									</div> -->
								</a>
								<div class="text p-3">
									<h3>
										<a href="#">Lion, Singapore</a>
									</h3>
									<span class="listing">3 Listing</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="destination">
								<a href="#" class="img d-flex justify-content-center align-items-center"
									style="background-image: url(<c:url value='/css/RWDcss/images/destination-5.jpg'/>);">
									<!-- 									<div class="icon d-flex justify-content-center align-items-center"> --> <!-- 										<span class="icon-search2"></span> -->
									<!-- 									</div> -->
								</a>
								<div class="text p-3">
									<h3>
										<a href="#">Australia</a>
									</h3>
									<span class="listing">3 Listing</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="destination">
								<a href="#" class="img d-flex justify-content-center align-items-center"
									style="background-image: url(<c:url value='/css/RWDcss/images/destination-6.jpg'/>);">
									<!-- 									<div class="icon d-flex justify-content-center align-items-center"> --> <!-- 										<span class="icon-search2"></span> -->
									<!-- 									</div> -->
								</a>
								<div class="text p-3">
									<h3>
										<a href="#">Paris, Italy</a>
									</h3>
									<span class="listing">3 Listing</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">好評不斷</span>
					<h2 class="mb-4">
						<strong>最熱門</strong> 隨時更新TOP5
					</h2>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<c:forEach varStatus="vs" var="Top5" items="${TopFiveList}">
					<div class="col-sm col-md-6 col-lg ftco-animate">
						<div class="destination">
							<a href="#" class="img img-2 d-flex justify-content-center align-items-center"
								style="background-image: url(<c:url value='/showPic/${Top5.pId}'/>);"> <!-- 							<div class="icon d-flex justify-content-center align-items-center"> -->
								<!-- 								<span class="icon-search2"></span> --> <!-- 							</div> -->
							</a>
							<div class="text p-3">
								<div class="d-flex">
									<div class="one">
										<h3>
											<a href="#">${Top5.pName}</a>
										</h3>
										<p class="rate">
											<c:choose>
												<c:when test="${Top5.pAvgRating>=1&&Top5.pAvgRating<2 }">
													<i class="icon-star"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
												</c:when>
												<c:when test="${Top5.pAvgRating>=2&&Top5.pAvgRating<3 }">
													<i class="icon-star"></i>
													<i class="icon-star"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
												</c:when>
												<c:when test="${Top5.pAvgRating>=3&&Top5.pAvgRating<4 }">
													<i class="icon-star"></i>
													<i class="icon-star"></i>
													<i class="icon-star"></i>
													<i class="icon-star-o"></i>
													<i class="icon-star-o"></i>
												</c:when>
												<c:when test="${Top5.pAvgRating>=4&&Top5.pAvgRating<5 }">
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
											<span>${Top5.pAvgRating}</span>
										</p>
									</div>
									<div class="two">
										<span class="price per-price">$${Top5.pPrice}<br> <small>/night</small></span>
									</div>
								</div>
								<p>${Top5.pContent}</p>
								<hr>
								<p class="bottom-area d-flex">
									<form:form method="POST" action="${pageContext.request.contextPath}/Buy"
										modelAttribute="orderItem" id="idform">
										<c:if test="${Top5.pInstock==0 }">
											<p>已售完</p>
										</c:if>
										<c:if test="${Top5.pInstock!=0 }">
											<form:select path="iQty" style="margin-top:10px;">
												<c:forEach var="stock" begin="1" end="${Top5.pInstock}">
													<option value="${stock}">${stock}</option>
												</c:forEach>
											</form:select>
										</c:if>
										<form:input type="hidden" path="pId" value="${Top5.pId }" />
										<form:input type="hidden" path="pName" value="${Top5.pName }" />
										<form:input type="hidden" path="pPrice" value="${Top5.pPrice }" />
										<c:if test="${Top5.pInstock!=0 }">
											<input class="btn btn-outline-info" style="float: right;" type="button" value="加到購物車">
										</c:if>
									</form:form>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<section class="ftco-section testimony-section">
		<div class="container">
			<div class="row justify-content-start">
				<div class="col-md-5 heading-section ftco-animate">
					<span class="subheading">Best Directory Website</span>
					<h2 class="mb-4 pb-3">
						<strong>Why</strong> Choose Us?
					</h2>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,
						there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the
						Semantics, a large language ocean.</p>
					<p>Even the all-powerful Pointing has no control about the blind texts it is an almost
						unorthographic life.</p>
					<p>
						<a href="#" class="btn btn-primary btn-outline-primary mt-4 px-4 py-3">Read more</a>
					</p>
				</div>
				<div class="col-md-1"></div>
				<div class="col-md-6 heading-section ftco-animate">
					<span class="subheading">Testimony</span>
					<h2 class="mb-4 pb-3">
						<strong>Our</strong> Guests Says
					</h2>
					<div class="row ftco-animate">
						<div class="col-md-12">
							<div class="carousel-testimony owl-carousel">
								<div class="item">
									<div class="testimony-wrap d-flex">
										<div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
											<span class="quote d-flex align-items-center justify-content-center"> <i
												class="icon-quote-left"></i>
											</span>
										</div>
										<div class="text ml-md-4">
											<p class="mb-5">Far far away, behind the word mountains, far from the countries
												Vokalia and Consonantia, there live the blind texts.</p>
											<p class="name">Dennis Green</p>
											<span class="position">Guest from italy</span>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="testimony-wrap d-flex">
										<div class="user-img mb-5" style="background-image: url(images/person_2.jpg)">
											<span class="quote d-flex align-items-center justify-content-center"> <i
												class="icon-quote-left"></i>
											</span>
										</div>
										<div class="text ml-md-4">
											<p class="mb-5">Far far away, behind the word mountains, far from the countries
												Vokalia and Consonantia, there live the blind texts.</p>
											<p class="name">Dennis Green</p>
											<span class="position">Guest from London</span>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="testimony-wrap d-flex">
										<div class="user-img mb-5" style="background-image: url(images/person_3.jpg)">
											<span class="quote d-flex align-items-center justify-content-center"> <i
												class="icon-quote-left"></i>
											</span>
										</div>
										<div class="text ml-md-4">
											<p class="mb-5">Far far away, behind the word mountains, far from the countries
												Vokalia and Consonantia, there live the blind texts.</p>
											<p class="name">Dennis Green</p>
											<span class="position">Guest from Philippines</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate">
					<span class="subheading">Recent Blog</span>
					<h2>
						<strong>Tips</strong> &amp; Articles
					</h2>
				</div>
			</div>
			<div class="row d-flex">
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="blog-single.html" class="block-20"
							style="background-image: url(<c:url value='/css/RWDcss/images/image_1.jpg'/>);"> </a>
						<div class="text p-4 d-block">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">8 Best homestay in Philippines that you don't miss out</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="blog-single.html" class="block-20"
							style="background-image: url(<c:url value='/css/RWDcss/images/image_2.jpg'/>);"> </a>
						<div class="text p-4">
							<span class="tag">Culture</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="blog-single.html" class="block-20"
							style="background-image: url(<c:url value='/css/RWDcss/images/image_3.jpg'/>);"> </a>
						<div class="text p-4">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a href="blog-single.html" class="block-20"
							style="background-image: url(<c:url value='/css/RWDcss/images/image_4.jpg'/>);"> </a>
						<div class="text p-4">
							<span class="tag">Tips, Travel</span>
							<h3 class="heading mt-3">
								<a href="#">Even the all-powerful Pointing has no control about the blind texts</a>
							</h3>
							<div class="meta mb-3">
								<div>
									<a href="#">August 12, 2018</a>
								</div>
								<div>
									<a href="#">Admin</a>
								</div>
								<div>
									<a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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
		<!-- 		<svg class="circular" width="48px" height="48px"> -->
		<%-- 			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" /> --%>
		<%-- 			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" --%>
		<%-- 				stroke="#F96D00" /></svg> --%>
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