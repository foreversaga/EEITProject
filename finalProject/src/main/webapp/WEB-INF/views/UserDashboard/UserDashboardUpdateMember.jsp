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
<script>
	$(document).ready(function() {

		$('[data-toggle=offcanvas]').click(function() {
			$('.row-offcanvas').toggleClass('active');
		});

	});

	// 	購物車
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

	// 天氣預報javaScript:https://weatherwidget.io/
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
</style>
<body>
	<div class="Background">
		<img src="<c:url value='/img/dashboardbackground.jpg'/>">
	</div>
	<nav class="navbar fixed-top navbar-expand-md navbar-dark bg-dark mb-3">
		<div class="flex-row d-flex">
			<button type="button" class="navbar-toggler mr-2 "
				data-toggle="offcanvas" title="Toggle responsive left sidebar">
				<span class="navbar-toggler-icon"></span>
			</button>
<%-- 			<a class="navbar-brand" href="<c:url value='/UserDashboard'/>" --%>
<!-- 				title="User Dashboard">會員中心</a> -->
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsingNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse" id="collapsingNavbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value='/'/>">旅遊趣<span class="sr-only"></span></a></li>
				<!-- <li class="nav-item">
                    <a class="nav-link" href="//www.codeply.com">Link</a>
                </li> -->
			</ul>
<!-- 			<ul class="navbar-nav mr-auto"> -->
<!-- 				<li class="nav-item dropdown"><a -->
<!-- 					class="nav-link dropdown-toggle fa fa-align-justify fa-pull-left ml-2" -->
<!-- 					style="color: white;" href="#" id="navbarDropdown" role="button" -->
<!-- 					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 						分類 </a> -->
<!-- 					<div -->
<!-- 						class="dropdown-menu dropdown-menu dropdown-menu-left shadow animated--grow-in" -->
<!-- 						aria-labelledby="navbarDropdown"> -->
<!-- 						<a class="dropdown-item" href="#">景點門票-表演</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a class="dropdown-item" href="#">美食</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a class="dropdown-item" href="#">特色活動體驗</a> -->
<!-- 						<div class="dropdown-divider"></div> -->
<!-- 						<a class="dropdown-item" href="#">交通票券</a> -->
<!-- 					</div></li> -->
<%-- 				<form:form class="form-inline col-md-offset-2 ml-5"> --%>
<!-- 					<input class="form-control" type="text" placeholder="Search" -->
<!-- 						aria-label="Search"> -->
<%-- 				</form:form> --%>
<!-- <!-- 			</ul> 先移掉購物車iCon fa fa-shopping-cart  fa-pull-right 會影響置中 -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle  mr-3"
					style="color: white;" id="navbarDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">購物車</a>
					<div class="dropdown-menu dropdown-menu-right"
						id="shoppingCartMenu"
						style="width: 300px; height: 340px; background-color: #f0f0f0; font-family: 'Noto Serif TC', serif; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); overflow-y: auto;"
						aria-labelledby="navbarDropdown">
						<c:if test="${empty shoppingCart.content }">
							<p style="text-align: center; margin-top: 10%">購物車暫無商品</p>
						</c:if>
						<c:forEach varStatus="vs" var="cart"
							items="${shoppingCart.content }">
							<hr>
							<img style="width: 50px; height: 50px; float: left;"
								src="<c:url value='/showPic/${cart.value.pId}'/>">
							<p style="line-height: 30px">${cart.value.pName}</p>
							<span style="line-height: 5px">數量:${cart.value.iQty}
								價格:${cart.value.pPrice}</span>
							<span><input id="${cart.value.pId}" type="button"
								onclick="DeleteItem(this.id)" value="刪除" /> </span>
							<c:if test="${vs.last}">
								<hr>
							</c:if>
						</c:forEach>
						<c:if test="${!empty shoppingCart.content }">
							<a href="<c:url value='/CheckOut'/>"><input type="button"
								class="btn btn-primary btn-lg mr-1" style="float: right;"
								value="前往結帳" /></a>
						</c:if>
					</div> <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
				</li>
				<!-- <li class="nav-item">
                    <a class="nav-link" href="" data-target="#myModal" data-toggle="modal">About</a>
                </li> -->
				<!-- 用戶選單 -->
				<li class="nav-item "><a class="nav-link dropdown-toggle"
					href="#" id="userDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <span
						class=" d-none d-lg-inline  "
						style="color: white;"></span> 
						<img src="<c:url value='/showmPic/${LoginOK.mId}'/>" class="img-circle " title="${LoginOK.mAccount}" style=" width:30px; height:30px; border-radius:50%; "/>
				</a> <!-- Dropdown - User Information -->
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="<c:url value='/UpdateMemberForm'/>">
							<i class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							帳戶設定
						</a> <a class="dropdown-item" href="<c:url value='/UserOrderDetail'/>">
							<i class="  mr-2 text-gray-400 fa fa-shopping-bag"
							style="color: #99E64D;"></i> 我的訂單
						</a> <a class="dropdown-item" href="<c:url value='/UserDashboardRating'/>"> <i
							class="  mr-2 text-gray-400 fa fa-gratipay" style="color: pink;"></i>
							我的評價
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
	<div class="container " id="main">
		<div class="container row row-offcanvas row-offcanvas-left ">
			<!-- <div class="  col-md-3  sidebar-offcanvas bg-light " id="sidebar" role="navigation"
                style="text-align: center">
                <ul class=" nav  list-group list-group-item-flush  flex-column sticky-top  p-0 pt-5 "style="font-family: 'Noto Serif TC', serif">
                    <li class=" list-group-item list-group-item-action "><a class="nav-link" href="#">個人中心</a></li>
                    <li class="list-group-item list-group-item-action "><a class="nav-link" href="#">我的訂單</a></li>
                    <li class=" list-group-item list-group-item-action "><a class="nav-link" href="#">我的評價</a></li>
                    <li class=" list-group-item list-group-item-action "><a class="nav-link" href="#">帳戶設定</a></li> -->
			<!-- </ul>
            </div> -->
			<div
				class="container sidebar-heading col-md-3  sidebar-offcanvas bg-light "
				id="sidebar" role="navigation" style="text-align: center;margin-top:30px">
				<div
					class="list-group list-group-flush flex-column sticky-top  p-0 pt-5 "
					style="font-family: 'Noto Serif TC', serif">
					<a href="<c:url value='/UserDashboard'/>"
						class="list-group-item list-group-item-action bg-light ">個人中心</a>
					<a href="<c:url value='/UserOrderDetail'/>"
						class="list-group-item list-group-item-action bg-light">我的訂單</a> <a
						href="<c:url value='/UserDashboardRating'/>" class="list-group-item list-group-item-action bg-light">我的評價</a>
					<a href="<c:url value='/UpdateMemberForm'/>"
						class="list-group-item list-group-item-action bg-light">帳戶設定</a> 
				</div>
			</div>
			<!--/col-->
			<div class="container col-md-9 p-0 "style="margin-top:25px">
				<div class="container flex-column">

					<div class="  pt-5">
						<div class="card ">
							<form:form method="POST" modelAttribute="MemberBean">
								<div class="card-header card-header-primary">
									<h4 class="card-title ">個人資訊管理</h4>
									<p class="card-category">以下資訊僅用於幫助你在支付時自動填寫你的個人資料，你的資料將會安全地被保存且不會公開</p>
								</div>
								<div class="card-body">

									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">用戶名(須與旅遊證件一致)</label>
												<form:input id="mName" path="mName" value="${LoginOK.mName}"
													type="text" class="form-control " disabled="true" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">生日(須與旅遊證件一致)</label>
												<form:input id="mDate" path="mDate" value="${LoginOK.mDate}"
													type="text" class="form-control " disabled="true" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="bmd-label-floating">性別</label>
												<form:input id="mGender" path="mGender"
													value="${LoginOK.mGender}" type="email"
													class="form-control " disabled="true" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">帳號</label>
												<form:input id="mAccount" path="mAccount"
													value="${LoginOK.mAccount}" type="text"
													class="form-control" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">密碼</label>
												<form:input id="mPassword" path="mPassword"
													value="${LoginOK.mPassword}" type="password"
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label class="bmd-label-floating">Email</label>
												<form:input id="mEmail" path="mEmail"
													value="${LoginOK.mEmail}" type="text" class="form-control" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-8">
											<div class="form-group">
												<label class="bmd-label-floating">地址</label>
												<form:input id="mAddress" path="mAddress"
													value="${LoginOK.mAddress}" type="text"
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">手機號碼</label>
												<form:input id="mPhone" path="mPhone"
													value="${LoginOK.mPhone}" type="text" class="form-control" />
											</div>
										</div>
									</div>

								</div>
								<div class="row"></div>
								<button type="submit"
									class="btn btn-primary pull-right col-md-4 align-self-end m-1">Update
									Profile</button>
								<div class="clearfix"></div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>


		<!--/main col-->
	</div>




	<footer class="container  navbar-fixed-bottom flex-column ">
		<div
			class=" container align-items-end row featurette bg-dark  p-5  mt-1 "
			style="color: white">
			<div class="  justify-content-end col-md-5 order-md-7">
				<h3 class="title2">聯絡我們</h3>
				<div class="form-group">
					<label for="txtName">寄件人姓名</label> <input type="text"
						class="form-control" name="txtName" id="txtName" required>
				</div>
				<div class="form-group">
					<label for="txtEmail">信箱</label> <input type="email"
						class="form-control" name="txtEmail" id="txtEmail" required>
				</div>
				<div class="form-group">
					<label for="msg">訊息</label>
					<textarea class="form-control" required></textarea>
				</div>
				<button type="submit" class="btn btn-primary" style="width: 100%;">傳送</button>
			</div>
			<div class=" align-self-center col-md-7" style="color: white">
				<ul>
					<li style="margin-top: 3px;">©2019 Travel Fun Technology</li>
					<li style="margin-top: 3px;">Limited. All Rights Reserved.</li>
					<li style="margin-top: 3px;">電話：02-23766198</li>
					<li style="margin-top: 3px;">信箱：EEIT108@outlook.com</li>
					<li style="margin-top: 3px;">地址：106台北市大安區復興南路一段390號 2,3號</li>
					<li style="margin-top: 3px;">粉專：https://www.travelFun.com/EEIT108/</li>
				</ul>
				<ul>
					<li style="margin-top: 3px;">支付方式</li>
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
	</footer>
</body>
</html>