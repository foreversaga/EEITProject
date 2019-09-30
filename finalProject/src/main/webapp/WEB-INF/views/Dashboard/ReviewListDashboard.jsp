<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 字體CDN -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+TC&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/TableCss/vendor/perfect-scrollbar/perfect-scrollbar.css'/>">
	<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/icomoon.css'/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/TableCss/css/util.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/TableCss/css/main.css'/>">
<!-- 上述三行顯示訂單內容必要連結 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="<c:url value='/css/RWDcss/js/jquery.min.js'/>"></script>
<!-- ==================================================================== -->
<script src="http://malsup.github.io/jquery.form.js"></script>
<script
	src="<c:url value='/css/TableCss/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
<script>
	$(document).ready(function() {

		$('[data-toggle=offcanvas]').click(function() {
			$('.row-offcanvas').toggleClass('active');
		});

	});

// 	購物車
// 	function DeleteItem(clicked_id) {
// 		var url = "<c:url value='/DeleteCartProduct?pId=" + clicked_id + "'/>";
// 		$.ajax({
// 			url : url,
// 			type : "get",
// 			success : function(data) {
// 				$("div#shoppingCartMenu").html(data);
// 			}
// 		});
// 	};
// 	購物車新版本
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

	//顯示訂單內容滾條
	$('.js-pscroll').each(function() {
		var ps = new PerfectScrollbar(this);

		$(window).on('resize', function() {
			ps.update();
		})
	});

	function ToggleReview(clicked_id) {
		var rId='"#'+clicked_id+'"';
		var updaterId='#AmendReview'+clicked_id;
		$("#ShowReview").hide();
		$(updaterId).fadeIn();
		$("#clicked_id").hide();
	};

	function CancelAmend(clicked_id) {
		var rId='"#'+clicked_id+'"';
		var updaterId='#AmendReview'+clicked_id;
		event.preventDefault();
		$("#ShowReview").fadeIn();
		$(updaterId).hide();
		$("#clicked_id").fadeIn();

	};
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.Background {
	/*使圖片隨著瀏覽器尺寸自動縮放，不因大小出現縫隙*/
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	z-index: -999;
}

.Background img {
	min-height: 100%;
	width: 100%;
}

@media screen and (max-width: 1300px) {
	/*使圖片保持長寬比不能變形，圖片原始寬度*/
	img.Background {
		left: 50%;
		margin-left: -500px;
	}
}

body {
	background: #eee !important;
}

.scrollerbar{margin-top:8px;overflow:scroll;height:450px;overflow-x:hidden;overflow-y:auto;}
.scrollerbar{scrollbar-arrow-color:#f00;}

.AutoNewlineforView{
word-break: break-all;/*必須*/
}
</style>
<body>
	<div class="Background">
		<img src="<c:url value='/img/dashboardbackground.jpg'/>">
	</div>
	<nav class="navbar fixed-top navbar-expand-md navbar-dark bg-dark mb-3" style="font-family: 'Noto Serif TC', serif;">
		<div class="flex-row d-flex">
			<button type="button" class="navbar-toggler mr-2 "
				data-toggle="offcanvas" title="Toggle responsive left sidebar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<%-- 			<a class="navbar-brand" href="<c:url value='/UserDashboard'/>" --%>
			<!-- 				title="User Dashboard">後臺系統</a> -->
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsingNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="collapsingNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" style="margin-left:520px"
					href="<c:url value='/'/>">旅遊趣<span class="sr-only"></span></a></li>
			</ul>

			<ul class="navbar-nav ml-auto "style="color: white;">
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#ChangePage" style="color: white;margin-left:850px"
						id="navbarDropdown" role="button" data-toggle="modal" aria-haspopup="true"
						aria-expanded="false"  data-target="#shoppingCartMenu">購物車</a></li></ul>
					<div class="modal fade" id="shoppingCartMenu" tabindex="-1" role="dialog"
			aria-labelledby="shoppingCartMenuTitle" aria-hidden="true" data-backdrop="false">
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
							<p style="text-align: center; margin-top: 10%">購物車內已無商品</p>
						</c:if>
						<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
							<img style="width: 80px; float: left; vertical-align: center; margin-right: 1%;"
								src="<c:url value='/showPic/${cart.value.pId}'/>">
							<p style="line-height: 10px">${cart.value.pName}</p>
							<span style="line-height: 5px">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</span>
							<span><input class="btn btn-outline-danger" id="${cart.value.pId}" type="button"
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
						<button type="button" onclick="CheckOutButton()" class="btn btn-success">結帳</button>
					</div>
				</div>
			</div>
		</div>
				
				<!-- <li class="nav-item">
                    <a class="nav-link" href="" data-target="#myModal" data-toggle="modal">About</a>
                </li> -->
				<!-- 用戶選單 -->
				<ul class="navbar-nav ml-auto"style="color: white;margin-right:23%">
				<li class="nav-item "><a class="nav-link dropdown-toggle"
					href="#" id="userDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <span
						class=" d-none d-lg-inline  " style="color: white;"></span> <img
						src="<c:url value='/showmPic/${LoginOK.mId}'/>"
						class="img-circle " title="${LoginOK.mAccount}"
						style="width: 30px; height: 30px; border-radius: 50%;" />
				</a> <!-- Dropdown - User Information -->
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in mt-2" style=" margin-right:510px"
						aria-labelledby="userDropdown"
						style="font-family: 'Noto Serif TC', serif;">
						<a class="dropdown-item" href="<c:url value='/Dashboard'/>"> <i
							class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							後台系統
						</a> <a class="dropdown-item" href="<c:url value='/AddProduct'/>">
							<i class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							新增商品
						</a><a class="dropdown-item"
							href="<c:url value='/ProductListDashboard'/>"> <i
							class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							修改商品
						</a> <a class="dropdown-item"
							href="<c:url value='/MemberListDashboard'/>"> <i
							class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							會員列表
						</a> <a class="dropdown-item"
							href="<c:url value='/ReviewListDashboard'/>"> <i
							class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							評價列表
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="<c:url value='/logout'/>"
							data-toggle="modal" data-target="#logoutModal"> <i
							class=" mr-2 text-gray-400 fa fa-sign-out" style="color: gray;"></i>
							Logout
						</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<div class=" container align-items-center" id="main">
		<div class="container  "style="font-family: 'Noto Serif TC', serif;">
			<div class="  justify-content-around  " style="text-align: center;">
				<div class="justify-content-center "style="margin-top:100px">
				<a href="<c:url value='/AddProduct'/>">
				<input type="button" class="btn btn-warning btn btn-lg mt-5 " 
					data-toggle="collapse" data-target="#AddProduct"
					aria-expanded="false" aria-expanded="false"
					aria-controls="AddProduct" value="新增商品"/></a>
				<a href="<c:url value='ProductListDashboard'/>"> <input
						type="button" class="btn btn-warning btn btn-lg mt-5"
						data-toggle="collapse" data-target="#ProductList"
						aria-expanded="false" aria-controls="ProductList" value="修改商品" /></a>	
				<a href="<c:url value='/MemberListDashboard'/>">
				<input type="button" class="btn btn-warning btn btn-lg mt-5" 
					data-toggle="collapse" data-target="#MemberList"
					aria-expanded="false" aria-controls="MemberList" value="會員列表"/></a>
				
				<button type="button" class="btn btn-warning btn btn-lg mt-5" 
					data-toggle="collapse" data-target="#RatingList"
					aria-expanded="false" aria-controls="RatingList" >評價列表</button>
	</div>

				<!-- 				=============查看所有評價與修改評價============= -->
				<div class=" sticky-top   "
					style="font-family: 'Noto Serif TC', serif">
					<div class="container  p-0 ">
						<div class="container flex-column collapse" id="RatingList">

							<div class="  pt-5">
								<div class="card ">

									<div class="card-header card-header-primary">
										<h4 class="card-title " style="text-align: center">評價管理</h4>

									</div>
									<div class="">
										<div class="container-fruid" style="height: 450px;">
											<div class="">
												<div class="table100 ver1 mb-5">
													<div class="table100-head mt-1 " style="text-align: center">
														<table>
															<thead>
																<tr class="  row100 head justify-content-around"
																	style="text-align: center;">
																	<th class="cell100 column1">帳號</th>
																	<th class="cell100 column2">產品編號</th>
																	<th class="cell100 column3 ">評價</th>
																	<th class="cell100 column4">發表時間</th>
																</tr>
															</thead>
														</table>
													</div>

													<div class="container-fruid js-pscroll  scrollerbar"
														style="text-align: center; ">
														<table>
															<tbody>
															<c:forEach varStatus="vs" var="reviewBean" items="${reviewList}">
									<tr class="row100 body" style="font-size: 30px;">
										<td class="cell100 column1" style="text-align: center; padding-left: 0px;">${reviewBean.mAccount}<img
											width="30%;" src="" /></td>
										<td class="cell100 column2">${reviewBean.pId}</td>
										<td class="cell100 column3" style="text-align: center;width:15%;">
												
													<button class="btn btn-secondary mt-2" type="button" data-toggle="collapse" 
														data-target="#collapseReview${reviewBean.rId}" aria-expanded="false" aria-controls="collapseReview${reviewBean.rId}">
														查看評價</button>
													<div class="collapse" id="collapseReview${reviewBean.rId}">
														<div style="text-align: left; margin-top: 2%;" class="card card-body">
															<div id="ShowReview">
																<span class="rate"> <c:choose>
																		<c:when
																			test="${reviewBean.rRating>=1&&reviewBean.rRating<2 }">
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when
																			test="${reviewBean.rRating>=2&&reviewBean.rRating<3 }">
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when
																			test="${reviewBean.rRating>=3&&reviewBean.rRating<4 }">
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star"></i>
																			<i class="icon-star-o"></i>
																			<i class="icon-star-o"></i>
																		</c:when>
																		<c:when
																			test="${reviewBean.rRating>=4&&reviewBean.rRating<5 }">
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
																<h5>${reviewBean.rTitle}</h5>
																<p>${reviewBean.rReview}</p>
																		<button id="${reviewBean.rId}" onclick="ToggleReview(this.id)" class="btn btn-secondary">修改評價</button>
															</div>
															<div id="AmendReview${reviewBean.rId}" style="display: none">
<!-- 																<div class="card card-body" style="text-align: left; margin-top: 2%;"> -->
																	<form:form action="${pageContext.request.contextPath}/ReviewListDashboard"
																		   modelAttribute="updateallrb" method="POST">
																		<form:input type="hidden" path="mName" value="${LoginOK.mName}"></form:input>
																		<form:input type="hidden" path="rId" value="${reviewBean.rId}"></form:input>
																		<form:input type="hidden" path="mAccount" value="${reviewBean.mAccount}"></form:input>
<%-- 																		<form:input type="hidden" path="oId" value="${orderItem.orderBean.oId}"></form:input> --%>
																		<h5>評分:</h5>
																		<p>
																			<form:radiobutton path="rRating" value="1" label="1" checked="${reviewBean.rRating>=1&&reviewBean.rRating<2 ? 'checked' : '' }"/>
																			<form:radiobutton path="rRating" value="2" label="2" checked="${reviewBean.rRating>=2&&reviewBean.rRating<3 ? 'checked' : '' }"/>
																			<form:radiobutton path="rRating" value="3" label="3" checked="${reviewBean.rRating>=3&&reviewBean.rRating<4 ? 'checked' : '' }"/>
																			<form:radiobutton path="rRating" value="4" label="4" checked="${reviewBean.rRating>=4&&reviewBean.rRating<5 ? 'checked' : '' }"/>
																			<form:radiobutton path="rRating" value="5" label="5" checked="${reviewBean.rRating==5 ? 'checked' : '' }"/>
																		</p>
																		<form:input class="mb-1" style="margin-right: -300px" type="text" size="20" path="rTitle" value="${reviewBean.rTitle}"></form:input>
																		<br>
																		<textarea style=" margin-right: -220px" name="rReview" rows="8" cols="28">${reviewBean.rReview}</textarea>
																		<form:input type="hidden" path="pId" value="${reviewBean.pId}"></form:input>
																		<br>
																		<input class="btn btn-outline-success btn-sm" type="submit" value="送出">
																		<button id="${reviewBean.rId}" onclick="CancelAmend(this.id)" class="btn btn-outline-dark btn-sm">取消</button>
																	</form:form>
																</div>
															</div>
												
														</div>
<!-- 													</div> -->
											</td>
											<td class="cell100 column4">${reviewBean.rTimestamp}</td>
									</tr>
								</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				

				<!-- 		============下方三個div為前三個div============= -->
			</div>
		</div>
	</div>


	<!--/main col-->





	<!-- 	<footer class="container  justify-content-center navbar-fixed-bottom "> -->
	<!-- 		<div -->
	<!-- 			class=" container align-items-end row featurette bg-dark col-md-12 p-5 pt-0 mt-2" -->
	<!-- 			style="color: white"> -->

	<!-- 			<div class=" align-self-center col-md-12 align-self-center" -->
	<!-- 				style="color: white; text-align: center;"> -->

	<!-- 				<a style="margin-top: 3px; text-align: center;">©2019 Travel Fun -->
	<!-- 					Technology</a> <a style="margin-top: 3px; text-align: center;">Limited. -->
	<!-- 					All Rights Reserved.</a> -->

	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</footer> -->
</body>
</html>