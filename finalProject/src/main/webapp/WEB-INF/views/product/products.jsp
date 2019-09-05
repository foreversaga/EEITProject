<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
<meta charset="UTF-8">
<title>商品頁面</title>
<script type="text/javascript">
	function DeleteItem(clicked_id) {
		var url = "<c:url value='/DeleteCartProduct?pId=" + clicked_id + "'/>";
		$.ajax({
			url : url,
			type : "get",
			success : function(data) {
				$("div.dropdown-item").html(data);
			}
		});
	};

// 	$(document)
// 			.ready(
// 					function() {
// 						$("#click").click(function() {
// 							$("#showcart").slideToggle("fast");
// 						});
// 						var cartdiv = document.getElementById("click");
// 						$("body")
// 								.click(
// 										function() {
// 											cartdiv.style.display == "block" ? cartdiv.style.display == "none"
// 													: cartdiv.style.display == "none";
// 										});
// 					});
</script>
<style>
div#card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 190px;
	border-radius: 5px;
	display: inline-block;
	margin: 20px;
}

div#card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

img {
	border-radius: 5px 5px 0 0;
}

.container {
	padding: 2px 16px;
}

div.ProductMainPage {
	width: 940px;
	margin: 30px auto;
	z-index: 1;
}

.PageButtonDiv {
	margin: 10px;
}

.PageButton {
	color: #20bf6b !important;
	text-transform: uppercase;
	background: #ffffff;
	padding: 10px;
	border: 4px solid #20bf6b !important;
	border-radius: 6px;
	display: inline-block;
	transition: all 0.3s ease 0s;
	text-decoration: none;
}

.PageButton:hover {
	color: #494949 !important;
	border-radius: 50px;
	border-color: #494949 !important;
	transition: all 0.3s ease 0s;
}

#showcart {
	display: none;
	width: 300px;
	height: 423px;
	z-index: 2;
	right: 140px;
	float: right;
	position: absolute;
	background-color: #f0f0f0;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	overflow-y: auto;
/*     -webkit-overflow-scrolling: touch; */
}
</style>
</head>
<body>
	<img style="width: 100%" src="<c:url value='/img/index-banner.jpg'/>">
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand">旅遊去</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
              
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                      <a class="nav-link" href="<c:url value='/'/>">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="<c:url value='/products/1'/>">商品頁面</a>
                    </li>
                <li class="nav-item">
                      <a class="nav-link" href="<c:url value='/login'/>">會員登入</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="<c:url value='/AddProduct'/>">新增商品</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="<c:url value='/logout'/>">會員登出</a>
                    </li>
                  </ul>
                  <ul class="navbar-nav mr-right">
                      <li class="nav-item dropdown" >
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        購物車
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                       <c:if test="${empty shoppingCart.content }">
			<p style="text-align: center; margin-top: 10%">購物車內已無商品</p>
		</c:if>
                       <c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
		<hr>
			<img style="width: 50px; height: 50px; float: left;"
				src="<c:url value='/showPic/${cart.value.pId}'/>">
			<p style="line-height: 10px">${cart.value.pName}</p>
			<span style="line-height: 5px">數量:${cart.value.iQty}
				價格:${cart.value.pPrice}</span>
			<span><input id="${cart.value.pId}" type="button"
				onclick="DeleteItem(this.id)" value="刪除" /> </span>
<c:if test="${vs.last}"><hr></c:if>
		</c:forEach>
		<c:if test="${!empty shoppingCart.content }">
			<a href="<c:url value='/CheckOut'/>">結帳</a>
		</c:if>
                   
                      </div>
                    </li>
                  </ul>
                  <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                  </form>
                </div>
              </nav>
	<!-- dropdown cart button -->
<!-- 	<div id="showcart"> -->
<%-- 		<c:if test="${empty shoppingCart.content }"> --%>
<!-- 			<p style="text-align: center; margin-top: 10%">購物車內已無商品</p> -->
<%-- 		</c:if> --%>
<%-- 		<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }"> --%>
<!-- 		<hr> -->
<!-- 			<img style="width: 50px; height: 50px; float: left;" -->
<%-- 				src="<c:url value='/showPic/${cart.value.pId}'/>"> --%>
<%-- 			<p style="line-height: 10px">${cart.value.pName}</p> --%>
<%-- 			<span style="line-height: 5px">數量:${cart.value.iQty} --%>
<%-- 				價格:${cart.value.pPrice}</span> --%>
<%-- 			<span><input id="${cart.value.pId}" type="button" --%>
<!-- 				onclick="DeleteItem(this.id)" value="刪除" /> </span> -->
<%-- <c:if test="${vs.last}"><hr></c:if> --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:if test="${!empty shoppingCart.content }"> --%>
<%-- 			<a href="<c:url value='/CheckOut'/>">結帳</a> --%>
<%-- 		</c:if> --%>
<!-- 	</div> -->
	<!-- end of dropdown cart button -->
	<div class="ProductMainPage">
		<c:forEach varStatus="stVar" var="productBean" items="${productList}">
			<c:if test="${stVar.index%4==0 }">
				<br>
			</c:if>
			<div id="card">
				<img src="<c:url value='/showPic/${productBean.pId}'/>"
					style="width: 100px; height: 100px;">
				<div class="container">
					<p>
						<b>商品名稱:${productBean.pName}</b>
					</p>
					<p>價格:${productBean.pPrice}</p>
					<form:form method="GET"
						action="${pageContext.request.contextPath}/Buy"
						modelAttribute="orderItem" id="idform">
						<c:if test="${productBean.pInstock==0 }">
							<p>已售完</p>
						</c:if>
						<c:if test="${productBean.pInstock!=0 }">
							<form:select path="iQty">
								<c:forEach var="stock" begin="1" end="${productBean.pInstock}">
									<option value="${stock}">${stock}</option>
								</c:forEach>
							</form:select>
						</c:if>
						<form:input type="hidden" path="pId" value="${productBean.pId }" />
						<form:input type="hidden" path="pName"
							value="${productBean.pName }" />
						<form:input type="hidden" path="pPrice"
							value="${productBean.pPrice }" />
						<c:if test="${productBean.pInstock!=0 }">
							<input type="submit" value="加到購物車">
						</c:if>
					</form:form>
				</div>
			</div>
		</c:forEach>

		<div class="PageButtonDiv">
			<c:if test="${pageNo>1}">
				<a class="PageButton" href="<c:url value='/products/1'/>"> 第一頁</a>
			</c:if>
			<c:if test="${pageNo>1}">
				<a class="PageButton" href="<c:url value='/products/${pageNo-1}'/>">
					上一頁</a>
			</c:if>
			<c:if test="${pageNo!=totalPages}">
				<a class="PageButton" href="<c:url value='/products/${pageNo+1}'/>">
					下一頁</a>
			</c:if>
		</div>
	</div>



</body>
</html>