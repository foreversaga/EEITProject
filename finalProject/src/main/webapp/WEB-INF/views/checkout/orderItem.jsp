<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>我的訂單</title>
<meta charset="utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
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

	function ToggleReview() {
		$("#ShowReview").hide();
		$("#AmendReview").fadeIn();
		$("#ToggleReview").hide();
	};

	function CancelAmend() {
		event.preventDefault();
		$("#ShowReview").fadeIn();
		$("#AmendReview").hide();
		$("#ToggleReview").fadeIn();

	};
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
					<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">看看你買了些甚麼吧！</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- 	<section class="ftco-section ftco-degree-bg"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row"></div> -->
	<!-- 		</div> -->
	<!-- 	</section> -->
	<div id="orderitem" class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head" style="text-align: center;">
									<th class="cell100 column1">商品圖示</th>
									<th class="cell100 column2">明細內容</th>
									<th class="cell100 column3" style="width:15%">我的評價</th>

								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach varStatus="vs" var="orderItem" items="${orderItemList}">
									<tr class="row100 body" style="font-size: 30px;">
										<td class="cell100 column1" style="text-align: center; padding-left: 0px;"><img
											width="30%;" src="<c:url value='/showPic/${orderItem.pId}'/>" /></td>
										<td class="cell100 column2">${orderItem.iDes}</td>
										<td class="cell100 column3" style="text-align: center;width:15%;"><c:choose>
												<c:when test="${!empty review[orderItem.pId]}">
													<button class="btn btn-primary" type="button" data-toggle="collapse"
														data-target="#collapseReview" aria-expanded="false" aria-controls="collapseReview">
														查看我的評價</button>
													<div class="collapse" id="collapseReview">
														<div style="text-align: left; margin-top: 2%;" class="card card-body">
															<div id="ShowReview">
																<span class="rate"> <c:choose>
																		<c:when
																			test="${review[orderItem.pId].rRating>=1&&review[orderItem.pId].rRating<2 }">
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when
																			test="${review[orderItem.pId].rRating>=2&&review[orderItem.pId].rRating<3 }">
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when
																			test="${review[orderItem.pId].rRating>=3&&review[orderItem.pId].rRating<4 }">
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when
																			test="${review[orderItem.pId].rRating>=4&&review[orderItem.pId].rRating<5 }">
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
																	</c:choose></span>
																<h5>${review[orderItem.pId].rTitle}</h5>
																<p>${review[orderItem.pId].rReview}</p>
																		<button id="ToggleReview" onclick="ToggleReview()" class="btn btn-primary"
																style="width: 25%">修改評價</button>
															</div>
															<div id="AmendReview" style="display: none">
<!-- 																<div class="card card-body" style="text-align: left; margin-top: 2%;"> -->
																	<form:form action="${pageContext.request.contextPath}/ProcessAmendReview"
																		modelAttribute="newrb" method="POST">
																		<form:input type="hidden" path="mName" value="${LoginOK.mName}"></form:input>
																		<form:input type="hidden" path="rId" value="${review[orderItem.pId].rId}"></form:input>
																		<form:input type="hidden" path="mAccount" value="${review[orderItem.pId].mAccount}"></form:input>
																		<form:input type="hidden" path="oId" value="${orderItem.orderBean.oId}"></form:input>
																		<h5>評分:</h5>
																		<p>
																			<form:radiobutton path="rRating" value="1" label="1" checked="${review[orderItem.pId].rRating>=1&&review[orderItem.pId].rRating<2 ? 'checked' : '' }"/>
																			<form:radiobutton path="rRating" value="2" label="2" checked="${review[orderItem.pId].rRating>=2&&review[orderItem.pId].rRating<3 ? 'checked' : '' }"/>
																			<form:radiobutton path="rRating" value="3" label="3" checked="${review[orderItem.pId].rRating>=3&&review[orderItem.pId].rRating<4 ? 'checked' : '' }"/>
																			<form:radiobutton path="rRating" value="4" label="4" checked="${review[orderItem.pId].rRating>=4&&review[orderItem.pId].rRating<5 ? 'checked' : '' }"/>
																			<form:radiobutton path="rRating" value="5" label="5" checked="${review[orderItem.pId].rRating==5 ? 'checked' : '' }"/>
																		</p>
																		<form:input style="margin-right: -300px" type="text" size="20" path="rTitle" value="${review[orderItem.pId].rTitle}"></form:input>
																		<br>
																		<textarea style="margin-right: -220px" name="rReview" rows="8" cols="40">${review[orderItem.pId].rReview}</textarea>
																		<form:input type="hidden" path="pId" value="${orderItem.pId}"></form:input>
																		<br>
																		<input class="btn btn-outline-success btn-sm" type="submit" value="送出">
																		<button onclick="CancelAmend()" class="btn btn-outline-dark btn-sm">取消</button>
																	</form:form>
																</div>
															</div>
												
														</div>
<!-- 													</div> -->
												</c:when>
												<c:otherwise>
													<button class="btn btn-primary" type="button" data-toggle="collapse"
														data-target="#collapseAddReview" aria-expanded="false"
														aria-controls="collapseAddReview">填寫評價</button>
													<div class="collapse" id="collapseAddReview">
														<div class="card card-body" style="text-align: left; margin-top: 2%; ">
															<form:form action="${pageContext.request.contextPath}/ProcessNewReview"
																modelAttribute="newrb" method="POST">
																<form:input type="hidden" path="mName" value="${LoginOK.mName}"></form:input>
																<form:input type="hidden" path="mAccount" value="${LoginOK.mAccount}"></form:input>
																<form:input type="hidden" path="oId" value="${orderItem.orderBean.oId}"></form:input>
																<h5>評分:</h5>
																<p>
																	<form:radiobutton path="rRating" value="1" label="1" />
																	<form:radiobutton path="rRating" value="2" label="2" />
																	<form:radiobutton path="rRating" value="3" label="3" />
																	<form:radiobutton path="rRating" value="4" label="4" />
																	<form:radiobutton path="rRating" value="5" label="5" />
																</p>
																<form:input style="margin-right: -300px" type="text" size="20" path="rTitle" placeholder="請輸入標題"></form:input>
																<br>
																<form:textarea style="margin-right: -300px" path="rReview" rows="8" cols="40" placeholder="請輸入評價內容"></form:textarea>
																<form:input type="hidden" path="pId" value="${orderItem.pId}"></form:input>
																<br>
																<input class="btn btn-outline-success btn-sm" type="submit" value="送出">
															</form:form>
														</div>
													</div>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
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
	<script src="<c:url value='/css/TableCss/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
	<script>
		$('.js-pscroll').each(function() {
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
</body>
</html>
