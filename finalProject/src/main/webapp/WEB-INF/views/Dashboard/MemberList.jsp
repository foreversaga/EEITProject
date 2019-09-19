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
			<a class="navbar-brand" href="<c:url value='/UserDashboard'/>"
				title="User Dashboard">後臺系統</a>
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
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fa fa-align-justify fa-pull-left ml-2"
					style="color: white;" href="#" id="navbarDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						分類 </a>
					<div
						class="dropdown-menu dropdown-menu dropdown-menu-left shadow animated--grow-in"
						aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">景點門票-表演</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">美食</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">特色活動體驗</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">交通票券</a>
					</div></li>
				<form:form class="form-inline col-md-offset-2 ml-5">
					<input class="form-control" type="text" placeholder="Search"
						aria-label="Search">
				</form:form>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fa fa-shopping-cart  fa-pull-right "
					style="color: white;" id="navbarDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">購物車</a>
					<div class="dropdown-menu dropdown-menu-right" id="shoppingCartMenu" 
						style="width: 300px; height: 340px; background-color: #f0f0f0; font-family: 'Noto Serif TC', serif; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); overflow-y: auto;"
						aria-labelledby="navbarDropdown2">
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
						class=" d-none d-lg-inline fa fa-user-circle-o fa-pull-left "
						style="color: white;">用戶</span> <img
						class="img-profile rounded-circle" src="">
				</a> <!-- Dropdown - User Information -->
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="<c:url value='/Dashboard'/>">
							<i class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							後台系統
						</a>  <a class="dropdown-item" href="<c:url value='AddProduct'/>"> <i
							class="  mr-2 text-gray-400 fa fa-gratipay" style="color: pink;"></i>
							新增商品
						</a>
						<a class="dropdown-item" href="<c:url value='/MemberList'/>"> <i
							class="  mr-2 text-gray-400 fa fa-gratipay" style="color: pink;"></i>
							會員列表
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
				id="sidebar" role="navigation" style="text-align: center;">
				<div
					class="list-group list-group-flush flex-column sticky-top  p-0 pt-5 "
					style="font-family: 'Noto Serif TC', serif">
					<a href="<c:url value='/Dashboard'/>"
						class="list-group-item list-group-item-action bg-light ">後臺系統</a>
					<a href="<c:url value='/AddProduct'/>"
						class="list-group-item list-group-item-action bg-light">新增商品</a> 
					<a href="<c:url value='/MemberList'/>"
						class="list-group-item list-group-item-action bg-light">會員列表</a> 
				</div>
			</div>
			<!--/col-->
			<div class="container col-md-9 p-0 margin-top:10px"style="margin-top:20px">

				<div class="container flex-column">

					<div class="  pt-5">
						<div class="card ">
								<div class="mt-2">
		<div class="container-fruid" style="height:600px;">
			<div class="">
				<div class="table100 ver1 mb-5">
					<div class="table100-head ">
						<table>
							<thead>
								<tr class=" row100 head "style="text-align: center;">
									<th class="cell100 column1">帳號</th>
									<th class="cell100 column2">姓名</th>	
									<th class="cell100 column3">性別</th>
									<th class="cell100 column4">出生日期</th>
									<th class="cell100 column5">地址</th>
									<th class="cell100 column6">電話</th>									
								</tr>
							</thead>
						</table>
					</div>

					<div class="container-fruid js-pscroll"style="text-align: center;height:550px">
						<table>
							<tbody>
								<c:forEach  var="MemberBean" items="${Members}">
									<tr class="row100 body "style="text-align: center;">
										<td class=" justify-content-center cell100 column1 " ><a
											href="<c:url value='/UserDashboardUpdateMember'/>">${MemberBean.mAccount}</a></td>
										<td class="container-fruid cell100 column2 mb-5">${MemberBean.mName}</td>
										<td class="cell100 column3">${MemberBean.mGender}</td>
										<td class="cell100 column4">${MemberBean.mDate}</td>
										<td class="cell100 column5">${MemberBean.mAddress}</td>
										<td class="cell100 column6">${MemberBean.mPhone}</td>
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
					style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">熱銷活動</h2>
				<div class="container row mb-3 ml-1 d-flex justify-content-center"
					style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">
					<div class="card-deck">
						<div class="card">
							<img class="card-img-top" src="<c:url value='/img/Tokyo.JPG'/>"
								href="">
							<div class="card-body">
								<h5 class="card-title "></h5>
								<p class="card-text">全世界最著名的現代大都會，每年有超過一千萬旅客到訪，其新舊並存的風情吸引更多人朝聖。只要一天的時間，就足夠你從最古老的寺院穿越到最摩登的大廈。</p>
								<!-- <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
							</div>
						</div>
						<div class="card">
							<img class="card-img-top " src="<c:url value='/img/Osaka.JPG'/>"
								href="">
							<div class="card-body">
								<h5 class="card-title"></h5>
								<p class="card-text">作為日本第二大都市，大阪向世界各地的旅客保證，處處都是美食、美景和驚喜！歷史重地大阪城、世界最大水族館──大阪海遊館、高聳入雲的梅田藍天大廈都是必去景點。</p>
							</div>
						</div>
						<div class="card">
							<img class="card-img-top" src="<c:url value='/img/Kyoto.JPG'/>"
								href="">
							<div class="card-body">
								<h5 class="card-title"></h5>
								<p class="card-text">雖然曾歷戰火，京都之美仍然遺世獨立。只要親自走訪，你就會發現京都把日本的「侘寂」美學詮釋得有多淋漓盡致。</p>
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