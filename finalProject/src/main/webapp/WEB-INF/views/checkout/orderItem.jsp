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

	function ToggleReview(id) {
		var show = '#ShowReview' + id;
		var amend = '#AmendReview' + id;
		var toggle = '#ToggleReview' + id;
		$(show).hide();
		$(amend).fadeIn();
		$(toggle).hide();
	};

	function CancelAmend(id) {
		event.preventDefault();
		var show = '#ShowReview' + id;
		var amend = '#AmendReview' + id;
		var toggle = '#ToggleReview' + id;
		$(show).fadeIn();
		$(amend).hide();
		$(toggle).fadeIn();

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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/TableCss/vendor/perfect-scrollbar/perfect-scrollbar.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/TableCss/css/util.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/TableCss/css/main.css'/>">
<style type="text/css">
* {
	font-family: Microsoft JhengHei;
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

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='/'/>">旅遊趣</a>
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
						<li class="nav-item"><a style="font-size: 20px;" style="font-size: 20px;" href="<c:url value='/ForumIndex/1'/>" class="nav-link">討論區</a></li>
					</c:if>
					<c:if test="${!empty LoginOK}">
						<li class="nav-item"><a style="font-size: 20px;" href="<c:url value='/UserDashboard'/>" class="nav-link">會員中心</a></li>
						<li class="nav-item"><a style="font-size: 20px;" href="<c:url value='/logout'/>" class="nav-link">Logout</a></li>
					</c:if>
				</ul>
				<ul class="navbar-nav mr-right">
					<li class="nav-item dropdown"><a style="font-size: 20px;"
						class="nav-link dropdown-toggle" href="#ChangePage"
						id="navbarDropdown" role="button" data-toggle="modal"
						aria-haspopup="true" aria-expanded="false"
						data-target="#shoppingCartMenu">購物車</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
		<!-- Modal -->
	<div class="modal fade" id="shoppingCartMenu" tabindex="-1"
		role="dialog" aria-labelledby="shoppingCartMenuTitle"
		aria-hidden="true" data-backdrop="false">
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
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:if test="${empty shoppingCart.content }">
						<p
							style="font-weight: 8; font-size: 20px; text-align: center; margin-top: 5%">購物車內已無商品</p>
					</c:if>
					<c:forEach varStatus="vs" var="cart"
						items="${shoppingCart.content }">
						<img
							style="width: 80px; float: left; vertical-align: center; margin-right: 1%;"
							src="<c:url value='/showPic/${cart.value.pId}'/>">
						<p style="line-height: 10px">${cart.value.pName}</p>
						<span style="line-height: 5px">數量:${cart.value.iQty}
							價格:${cart.value.pPrice}</span>
						<span><input class="btn btn-outline-danger"
							id="${cart.value.pId}" type="button"
							onclick="DeleteItem(this.id)" value="刪除" /> </span>
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
					<button type="button" onclick="CheckOutButton()"
						class="btn btn-success">結帳</button>
				</div>
			</div>
		</div>
	</div>
<!-- 	END of Modal -->

	<div class="hero-wrap js-fullheight" style="background-image: url(<c:url value='/css/RWDcss/images/bg_5.jpg'/>);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
				<div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
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
	<div id="ChangePage" class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110" style="margin-top:-15%;">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head" style="text-align: center;">
									<th class="cell100 column1" style="width: 10%">商品圖示</th>
									<th class="cell100 column2">明細內容</th>
									<th class="cell100 column3" style="width: 15%">我的評價</th>

								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<c:forEach varStatus="vs" var="orderItem" items="${orderItemList}">
									<tr class="row100 body" style="font-size: 30px;">
										<td class="cell100 column1" style="width: 10%; text-align: center; padding-left: 0px;"><img width="30%;"
											src="<c:url value='/showPic/${orderItem.pId}'/>" /></td>
										<td class="cell100 column2"><span style="font-size: 20px;">${orderItem.iDes}</span></td>
										<td class="cell100 column3" style="text-align: center; width: 15%;"><c:choose>
												<c:when test="${!empty review[orderItem.pId]}">
													<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseReview${review[orderItem.pId].rId}"
														aria-expanded="false" aria-controls="collapseReview${review[orderItem.pId].rId}">查看我的評價</button>
													<div class="collapse" id="collapseReview${review[orderItem.pId].rId}">
														<div style="text-align: left; margin-top: 2%;" class="card card-body">
															<div id="ShowReview${review[orderItem.pId].rId}">
																<span class="rate"> <c:choose>
																		<c:when test="${review[orderItem.pId].rRating>=1&&review[orderItem.pId].rRating<2 }">
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when test="${review[orderItem.pId].rRating>=2&&review[orderItem.pId].rRating<3 }">
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when test="${review[orderItem.pId].rRating>=3&&review[orderItem.pId].rRating<4 }">
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when test="${review[orderItem.pId].rRating>=4&&review[orderItem.pId].rRating<5 }">
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
																<p style="font-size: 20px;">${review[orderItem.pId].rReview}</p>
																<button id="${review[orderItem.pId].rId}" onclick="ToggleReview(this.id)" class="btn btn-primary" style="width: 25%">修改評價</button>
															</div>
															<div id="AmendReview${review[orderItem.pId].rId}" style="display: none">
																<!-- 																<div class="card card-body" style="text-align: left; margin-top: 2%;"> -->
																<form:form action="${pageContext.request.contextPath}/ProcessAmendReview" modelAttribute="newrb" method="POST">
																	<form:input type="hidden" path="mName" value="${LoginOK.mName}"></form:input>
																	<form:input type="hidden" path="rId" value="${review[orderItem.pId].rId}"></form:input>
																	<form:input type="hidden" path="mAccount" value="${review[orderItem.pId].mAccount}"></form:input>
																	<form:input type="hidden" path="oId" value="${orderItem.orderBean.oId}"></form:input>
																	<h5>評分:</h5>
																	<p>
																		<form:radiobutton path="rRating" value="1" label="1"
																			checked="${review[orderItem.pId].rRating>=1&&review[orderItem.pId].rRating<2 ? 'checked' : '' }" />
																		<form:radiobutton path="rRating" value="2" label="2"
																			checked="${review[orderItem.pId].rRating>=2&&review[orderItem.pId].rRating<3 ? 'checked' : '' }" />
																		<form:radiobutton path="rRating" value="3" label="3"
																			checked="${review[orderItem.pId].rRating>=3&&review[orderItem.pId].rRating<4 ? 'checked' : '' }" />
																		<form:radiobutton path="rRating" value="4" label="4"
																			checked="${review[orderItem.pId].rRating>=4&&review[orderItem.pId].rRating<5 ? 'checked' : '' }" />
																		<form:radiobutton path="rRating" value="5" label="5" checked="${review[orderItem.pId].rRating==5 ? 'checked' : '' }" />
																	</p>
																	<form:input style="margin-right: -300px" type="text" size="20" path="rTitle" value="${review[orderItem.pId].rTitle}"></form:input>
																	<br>
																	<textarea style="margin-right: -220px" name="rReview" rows="8" cols="40">${review[orderItem.pId].rReview}</textarea>
																	<form:input type="hidden" path="pId" value="${orderItem.pId}"></form:input>
																	<br>
																	<input class="btn btn-outline-success btn-sm" type="submit" value="送出">
																	<button id="${review[orderItem.pId].rId}" onclick="CancelAmend(this.id)" class="btn btn-outline-dark btn-sm">取消</button>
																</form:form>
															</div>
														</div>

													</div>
													<!-- 													</div> -->
												</c:when>
												<c:otherwise>
													<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseAddReview${orderItem.pId}"
														aria-expanded="false" aria-controls="collapseAddReview">填寫評價</button>
													<div class="collapse" id="collapseAddReview${orderItem.pId}">
														<div class="card card-body" style="text-align: left; margin-top: 2%;">
															<form:form action="${pageContext.request.contextPath}/ProcessNewReview" modelAttribute="newrb" method="POST">
																<form:input type="hidden" path="mName" value="${LoginOK.mName}"></form:input>
																<form:input type="hidden" path="mAccount" value="${LoginOK.mAccount}"></form:input>
																<form:input type="hidden" path="oId" value="${orderItem.orderBean.oId}"></form:input>
																<h5>評分:</h5>
																<p>
																	<form:radiobutton path="rRating" value="1" label="1" checked="${reviewBeanParam.rRating==1 ? 'checked' : '' }" />
																	<form:radiobutton path="rRating" value="2" label="2" checked="${reviewBeanParam.rRating==2 ? 'checked' : '' }" />
																	<form:radiobutton path="rRating" value="3" label="3" checked="${reviewBeanParam.rRating==3 ? 'checked' : '' }" />
																	<form:radiobutton path="rRating" value="4" label="4" checked="${reviewBeanParam.rRating==4 ? 'checked' : '' }" />
																	<form:radiobutton path="rRating" value="5" label="5" checked="${reviewBeanParam.rRating==5 ? 'checked' : '' }" />
																	<span style="color: red">${errormsg.rating}</span>
																</p>
																<form:input style="margin-right: -300px" type="text" size="20" path="rTitle" value="${reviewBeanParam.rTitle}" placeholder="請輸入標題"></form:input>
																<br>
																<textarea style="margin-right: -300px" name="rReview" rows="8" cols="40" placeholder="請輸入評價內容">${reviewBeanParam.rReview}</textarea>
																<form:input type="hidden" path="pId" value="${orderItem.pId}"></form:input>
																<br>
																<p style="color: red;">${errormsg.title}</p>
																<p style="color: red">${errormsg.review}</p>
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
