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
<script type="text/javascript">
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
			<a class="navbar-brand" href="<c:url value='/UserDashboard'/>"
				title="User Dashboard">會員中心</a>
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
			<ul class="navbar-nav ml-auto ">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle fa fa-shopping-cart  fa-pull-right "
					style="color: white;" id="navbarDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">購物車</a>
					<div class="dropdown-menu dropdown-menu-right" id="shoppingCartMenu" 
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
						class=" d-none d-lg-inline fa fa-user-circle-o fa-pull-left "
						style="color: white;">用戶</span> <img
						class="img-profile rounded-circle" src="">
				</a> <!-- Dropdown - User Information -->
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="<c:url value='/UpdateMemberForm'/>">
							<i class=" mr-2 text-gray-400 fa fa-cogs" style="color: gray;"></i>
							帳戶設定
						</a> <a class="dropdown-item" href="<c:url value='/UserOrderDetail'/>"> <i
							class="  mr-2 text-gray-400 fa fa-shopping-bag"
							style="color: #99E64D;"></i> 我的訂單
						</a> <a class="dropdown-item" href="<c:url value='/UserDashboardRating'/>"> <i
							class="  mr-2 text-gray-400 fa fa-gratipay" style="color: pink;"></i>
							我的評價
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="<c:url value='/logout'/>"> <i
							class=" mr-2 text-gray-400 fa fa-sign-out" style="color: gray;"></i>
							Logout
						</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<div class="container " id="main">
		<div class="container row row-offcanvas row-offcanvas-left " >
			<!-- <div class="  col-md-3  sidebar-offcanvas bg-light " id="sidebar" role="navigation"
                style="text-align: center">
                <ul class=" nav  list-group list-group-item-flush  flex-column sticky-top  p-0 pt-5 "style="font-family: 'Noto Serif TC', serif">
                    <li class=" list-group-item list-group-item-action "><a class="nav-link" href="#">個人中心</a></li>
                    <li class="list-group-item list-group-item-action "><a class="nav-link" href="#">我的訂單</a></li>
                    <li class=" list-group-item list-group-item-action "><a class="nav-link" href="#">我的評價</a></li>
                    <li class=" list-group-item list-group-item-action "><a class="nav-link" href="#">帳戶設定</a></li> -->
			<!-- </ul>
            </div> -->
			<div class="sidebar-heading col-md-3  sidebar-offcanvas bg-light "
				id="sidebar" role="navigation" style="text-align: center">
				<div
					class="list-group list-group-flush flex-column sticky-top  p-0 pt-5 "
					style="font-family: 'Noto Serif TC', serif">
					<a href="<c:url value='/UserDashboard'/>"
						class="list-group-item list-group-item-action bg-light ">個人中心</a>
					<a href="<c:url value='/UserOrderDetail'/>" class="list-group-item list-group-item-action bg-light">我的訂單</a>
					<a href="<c:url value='/UserDashboardRating'/>" class="list-group-item list-group-item-action bg-light">我的評價</a>
					<a href="<c:url value='/UpdateMemberForm'/>"
						class="list-group-item list-group-item-action bg-light">帳戶設定</a> 
				</div>
			</div>
			<!--/col-->

			<div class="col main pt-5 ml-2 bg-white" >
				<div class="d-flex justify-content-center flex-row  ">
					<img src="<c:url value='/img/TravelIcon.png'/>" class="img-fluid" />
				</div>
				<span class="lead d-none d-sm-block"
					style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">下一個旅程去邊好？選擇你的目的地並計劃行程吧！</span>
				<center>
					<button type="button" class="btn btn-warning btn-lg "
						onclick="location.href=<c:url value='/'/>">返回首頁</button>
				</center>

				<hr>
				<!-- 天氣預報欄位 -->
				<div>
					<a class="weatherwidget-io"
						href="https://forecast7.com/zh-tw/25d03121d57/taipei-city/"
						data-label_1="台北市" data-label_2="WEATHER" data-font="Noto Sans TC"
						data-theme="marine">台北市 WEATHER</a>
				</div>
				<!--/row-->

				<hr>
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
								src="<c:url value='/img/Discover.JPG'/>" alt="First slide">
							<span
								style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">樂活體驗，探索無限可能</span>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="<c:url value='/img/food.JPG'/>"
								alt="Second slide"> <span
								style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">吃飯皇帝大，優惠票券替您省下荷包</span>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="<c:url value='/img/rail.jpg'/>"
								alt="Third slide"> <span
								style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">各式交通票券讓您暢通無阻</span>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>


				<a id="layouts"></a>
				<hr>
				<h2 class="sub-header mt-5 mb-5"
					style="text-align: center; display: block; font-family: 'Noto Serif TC', serif">熱門地區</h2>
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
<!-- 				熱門地區商品超連結要在img外面包一層<a href=""></a>,原本在img內的超連結不要用 -->
				<!--/row-->

			</div>
			<!--/main col-->
		</div>

		<footer class="container  navbar-fixed-bottom ">
			<div
				class=" container align-items-end row featurette bg-dark col-md-12 p-5 pt-0 mt-2"
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