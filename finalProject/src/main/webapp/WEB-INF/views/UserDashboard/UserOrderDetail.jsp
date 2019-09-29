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
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/TableCss/css/util.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/TableCss/css/main.css'/>">
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
	<script src="<c:url value='/css/TableCss/vendor/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
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
.scrollerbar{overflow:scroll;height:545px;overflow-x:hidden;overflow-y:auto;}
.scrollerbar{scrollbar-arrow-color:#f00;}
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
				<li class="nav-item active"><a class="nav-link" style="margin-left:440px"
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
			<ul class="navbar-nav ml-auto "style="color: white;">
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#ChangePage" style="color: white;margin-left:850px"
						id="navbarDropdown" role="button" data-toggle="modal" aria-haspopup="true"
						aria-expanded="false"  data-target="#shoppingCartMenu">購物車</a></li></ul>
					<div class="modal fade" id="shoppingCartMenu" tabindex="-1" role="dialog"
			aria-labelledby="shoppingCartMenuTitle" aria-hidden="true" data-backdrop="false">
			<div class="modal-dialog modal-dialog-centered" role="document" style="font-family: 'Noto Serif TC', serif;">
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
				<ul class="navbar-nav ml-auto"style="color: white;margin-right:25%">
				<li class="nav-item "><a class="nav-link dropdown-toggle"
					href="#" id="userDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> <span
						class=" d-none d-lg-inline  "
						style="color: white;"></span>
						<img src="<c:url value='/showmPic/${LoginOK.mId}'/>" class="img-circle " title="${LoginOK.mAccount}" style=" width:30px; height:30px; border-radius:50%; "/>
				</a> <!-- Dropdown - User Information -->
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in" style=" margin-right:510px"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="<c:url value='/UpdateMemberForm'/>">
							<i class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							帳戶設定
						</a> <a class="dropdown-item" href="<c:url value='/UserOrderDetail'/>">
							<i class="  mr-2 text-gray-400 fa fa-shopping-bag"
							style="color: #99E64D;"></i>訂單/評價管理
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
			<div class="container-fruid " style="margin-top:200px;width:250px;">
			<div
				class=" sidebar-heading  sidebar-offcanvas bg-light "
				id="sidebar" role="navigation" style="text-align: center;height:1334px">
				<div
					class="list-group list-group-flush flex-column sticky-top    "
					style="font-family: 'Noto Serif TC', serif">
					<a href="<c:url value='/UserDashboard'/>"
						class="list-group-item list-group-item-action bg-light ">個人中心</a>
					<a href="<c:url value='/UserOrderDetail'/>"
						class="list-group-item list-group-item-action bg-light">訂單/評價管理</a>
					<a href="<c:url value='/UpdateMemberForm'/>"
						class="list-group-item list-group-item-action bg-light">帳戶設定</a> 
				</div>
			</div>
			</div>
			<!--/col-->
			<div class="container-fruid col-md-9 p-0 "style="margin-top:150px">

				<div class="container flex-column"style="font-family: 'Noto Serif TC', serif;">

					<div class="  pt-5">
						<div class="card ">
						<div class="card-header card-header-primary">
									<h4 class="card-title ">訂單 / 評價資訊管理</h4>
									<p class="card-category">以下資訊用於幫助您查詢訂單明細，並填寫/查詢/更新評價，您的資料將會安全地被保存且不會公開</p>
								</div>
								<div class="mt-2">
		<div class="container-fruid" style="height:600px;">
			<div class="">
				<div class="table100 ver1 mb-5"style="text-align: center;">
					<div class="table100-head ">
						<table>
							<thead>
								<tr class="  row100 head ">
									<th class="cell100 column1">訂單編號</th>
									<th class="cell100 column2">訂購日期</th>
									<th class="cell100 column3">訂購金額</th>
									<th class="cell100 column4"style="width:20%">付款狀態</th>
									<th class="cell100 column5"style="width:20%">收貨人</th>
									<th class="cell100 column6">運送地址</th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="container-fruid js-pscroll mt-2 scrollerbar"style="height:545px;">
						<table>
							<tbody>
							
								<c:forEach varStatus="vs" var="orderBean" items="${orderList}">
									<tr class="row100 body ">
										<td class=" justify-content-center cell100 column1 " style="text-align: center;height:100px"><a
											href="<c:url value='/showOrderItem/${orderBean.oId}'/>">${orderBean.oId}</a></td>
										<td class="container-fruid cell100 column2 mb-5">${orderBean.oTimestamp}</td>
										<td class="cell100 column3">${orderBean.oTotalAmount}</td>
										<td class="cell100 column4"style="width:20%">${orderBean.oPaymentStatus}</td>
										<td class="cell100 column5"style="width:20%">${orderBean.oReceiveName}</td>
										<td class="cell100 column6">${orderBean.oAddress}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
													<hr>
				<h2 class="sub-header mt-5 mb-5"
					style="text-align: center; display: block; font-family: 'Noto Serif TC', serif;height:50px">熱銷商品</h2>
				<div class="container row mb-3 ml-1 d-flex justify-content-center"
					style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">
					<div class="card-deck">
						<div class="card">
							<a href="<c:url value='/ProductSingle/17'/>"><img class="card-img-top" src="<c:url value='/img/Roppongi.JPG'/>"
								href=""></a>
							<div class="card-body">
								<h5 class="card-title "></h5>
								<p class="card-text">位於六本木新城森大廈52樓的室內展望迴廊，挑高樓層、360度環繞式玻璃觀景窗、無遮蔽零死角，可遠眺東京鐵塔、東京晴空塔等著名城市地標！</p>
								<!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
							</div>
						</div>
						<div class="card">
							<a href="<c:url value='/ProductSingle/11'/>">
							<img class="card-img-top " src="<c:url value='/img/Tokyoticket.JPG'/>"
								href=""></a>
							<div class="card-body">
								<h5 class="card-title"></h5>
								<p class="card-text">專為來訪旅客設計的東京地鐵乘車票券，有效期間內自由進出東京各大地鐵站，不只省下了大筆交通費用，也節省了在各站買票的時間。</p>
							</div>
						</div>
						<div class="card">
							<a href="<c:url value='/ProductSingle/21'/>">
							<img class="card-img-top" src="<c:url value='/img/ghiblimuseum.JPG'/>"
								href=""></a>
							<div class="card-body">
								<h5 class="card-title"></h5>
								<p class="card-text">在這裡有許多宮崎駿電影中出現過的場景，不僅是小朋友，就算是大人和家長也能夠在這裡找尋童年的記憶，讓好奇心再次打開，重新進入一個夢想的城邦！</p>
							</div>
						</div>
					</div>
					<!--/col-->
				</div>
						</div>
					</div>
				</div>
	
			</div>
		</div>

		<!--/main col-->
	</div>




	<footer class="container  navbar-fixed-bottom flex-column ">
		<div
			class=" container align-items-end row featurette bg-dark  p-5  mt-1 ml-1"
			style="color: white;width:1040px">
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
					<li style="margin-top: 3px;">信箱：TravleFun@outlook.com</li>
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