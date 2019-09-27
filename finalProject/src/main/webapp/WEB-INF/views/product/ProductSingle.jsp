<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>${productBean.pName}</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script>
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
		$("input#addtocart").click(function(e) {
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


<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/ionicons.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/flaticon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/icomoon.css'/>">
<link rel="stylesheet" href="<c:url value='/css/RWDcss/css/style.css'/>">

<style type="text/css">
div.dropdown-menu {
	width: 300px;
	height: 423px;
	background-color: #f0f0f0;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	overflow-y: auto;
}

div#ftco-nav li.nav-item {
	margin: 0 20px;
}

span#star-span {
	color: #ffff37;
}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
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
					<c:if test="${!empty LoginOK}">
						<li class="nav-item"><a href="<c:url value='/UserDashboard'/>" class="nav-link">會員中心</a></li>
						<li class="nav-item"><a href="<c:url value='/logout'/>" class="nav-link">Logout</a></li>
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
								<img style="width: 80px; float: left; vertical-align: center; margin-right: 1%;"
									src="<c:url value='/showPic/${cart.value.pId}'/>">
								<p style="line-height: 10px">${cart.value.pName}</p>
								<span style="line-height: 5px">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</span>
								<span><input class="btn btn-outline-danger" id="${cart.value.pId}" type="button"
										onclick="DeleteItem(this.id)" value="刪除" /> </span>
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
	<div style="width: 50%; margin: 0 auto;">
		<img width="100%" src="<c:url value='/showPic/${productBean.pId}'/>" />
		<div id="Product-Title">
			<h1 style="font-size: 50px;" class="display-2">${productBean.pName}</h1>
		</div>
		<div id="Product-Rating">
			<p class="rate">
				<c:choose>
					<c:when test="${productBean.pAvgRating>=1&&productBean.pAvgRating<2 }">
						<i class="icon-star"></i>
						<i class="icon-star-o"></i>
						<i class="icon-star-o"></i>
						<i class="icon-star-o"></i>
						<i class="icon-star-o"></i>
					</c:when>
					<c:when test="${productBean.pAvgRating>=2&&productBean.pAvgRating<3 }">
						<i class="icon-star"></i>
						<i class="icon-star"></i>
						<i class="icon-star-o"></i>
						<i class="icon-star-o"></i>
						<i class="icon-star-o"></i>
					</c:when>
					<c:when test="${productBean.pAvgRating>=3&&productBean.pAvgRating<4 }">
						<i class="icon-star"></i>
						<i class="icon-star"></i>
						<i class="icon-star"></i>
						<i class="icon-star-o"></i>
						<i class="icon-star-o"></i>
					</c:when>
					<c:when test="${productBean.pAvgRating>=4&&productBean.pAvgRating<5 }">
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
				<span>${productBean.pAvgRating}</span>
			</p>
		</div>
		<hr>
		<p>$${productBean.pPrice}</p>
		<p>
			庫存:
			<c:choose>
				<c:when test="${productBean.pInstock==0 }">
					<p>已售完</p>
				</c:when>
				<c:otherwise>
		${productBean.pInstock}	
		</c:otherwise>
			</c:choose>
		</p>
		<hr>
		<p class="bottom-area d-flex">
			<form:form method="POST" action="${pageContext.request.contextPath}/Buy"
				modelAttribute="orderItem" id="idform">
				<c:if test="${productBean.pInstock==0 }">
					<p>已售完</p>
				</c:if>
				<c:if test="${productBean.pInstock!=0 }">
					<form:select path="iQty" style="margin-top:10px;margin-right:5%;">
						<c:forEach var="stock" begin="1" end="${productBean.pInstock}">
							<option value="${stock}">${stock}</option>
						</c:forEach>
					</form:select>
				</c:if>
				<form:input type="hidden" path="pId" value="${productBean.pId }" />
				<form:input type="hidden" path="pName" value="${productBean.pName }" />
				<form:input type="hidden" path="pPrice" value="${productBean.pPrice }" />
				<c:if test="${productBean.pInstock!=0 }">
					<input id="addtocart" class="btn btn-outline-info" type="button" value="加到購物車">
				</c:if>
			</form:form>
		</p>

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab" data-toggle="tab" href="#home"
				role="tab" aria-controls="home" aria-selected="true">商品說明</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile"
				role="tab" aria-controls="profile" aria-selected="false">用戶評價</a></li>
			<li class="nav-item"><a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact"
				role="tab" aria-controls="contact" aria-selected="false">Google地圖</a></li>
		</ul>
		<div class="tab-content" id="myTabContent" style="height: 300px">
			<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">${productBean.pContent}</div>
			<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				<c:choose>
					<c:when test="${empty reviewList}">此商品尚無評價。</c:when>
					<c:otherwise>
						<c:forEach varStatus="vs" var="reviewBean" items="${reviewList}">
							<div class="card border-light mb-3">
								<h5 class="card-header">
									<span style="width: 400px;">用戶:${reviewBean.mName}</span> <span class="rate"
										style="margin-right: 10%"> <c:choose>
											<c:when test="${reviewBean.rRating>=1&&reviewBean.rRating<2 }">
												<i class="icon-star"></i>
												<i class="icon-star-o"></i>
												<i class="icon-star-o"></i>
												<i class="icon-star-o"></i>
												<i class="icon-star-o"></i>
											</c:when>
											<c:when test="${reviewBean.rRating>=2&&reviewBean.rRating<3 }">
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star-o"></i>
												<i class="icon-star-o"></i>
												<i class="icon-star-o"></i>
											</c:when>
											<c:when test="${reviewBean.rRating>=3&&reviewBean.rRating<4 }">
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star"></i>
												<i class="icon-star-o"></i>
												<i class="icon-star-o"></i>
											</c:when>
											<c:when test="${reviewBean.rRating>=4&&reviewBean.rRating<5 }">
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
									</span>
								</h5>
								<div class="card-body">
									<h5 class="card-title">${reviewBean.rTitle}</h5>
									<p class="card-text">${reviewBean.rReview}</p>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
				<div style="margin-bottom: 200px;" id="map"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
var map;
var infowindow;
var positions = ${mapList};
var local = {	
	    lat: ${productBean.pLat},
	    lng: ${productBean.pLng}
	};
var markers = [];

function initMap() {

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 19,
    center: local
  });

  for (var i = 0; i < positions.length; i++) {
    addMarker(i);

  }

	  markers[1].addListener('click',function(){
 	  infowindow.open(map, markers[1]);
	});
	  markers[2].addListener('click',function(){
	 	  infowindow.open(map, markers[2]);
	});
	  markers[3].addListener('click',function(){
	 	  infowindow.open(map, markers[3]);
	});
	  markers[0].addListener('click',function(){
	 	  infowindow.open(map, markers[0]);
	});

}

function addMarker(e) {
  markers[e] = new google.maps.Marker({
    position: {
      lat: parseFloat(positions[e].lat),
      lng: parseFloat(positions[e].lng)
    },
    map: map,
//     label: positions[e].label
  });
  infowindow = new google.maps.InfoWindow({
  	  content: positions[e].label,
  	  position: {
  	      lat: parseFloat(positions[e].lat),
  	      lng: parseFloat(positions[e].lng)
  	    },
  	  maxWidth:200
  	});
  
}

</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRbkV92eGVhHDqqN1xgXTGwHHH-XAX7HI&callback=initMap">
		
	</script>
</body>
</html>
