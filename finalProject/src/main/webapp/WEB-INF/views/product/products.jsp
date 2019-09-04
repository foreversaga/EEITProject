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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
</script>
<meta charset="UTF-8">
<title>商品頁面</title>
<script type="text/javascript">
	function DeleteItem() {
		$.ajax({
			url : "<c:url value='/DeleteCartProduct'/>",
			data : $("#DeleteForm").serialize(),
			type : "get",
			success : function(data) {
// 				$(".ProductMainPage").html(data);
			}
		});
	};

	$(document)
			.ready(
					function() {
						$("#click").click(function() {
							$("#showcart").slideToggle("fast");
						});
						var cartdiv = document.getElementById("click");
						$("body")
								.click(
										function() {
											cartdiv.style.display == "block" ? cartdiv.style.display == "none"
													: cartdiv.style.display == "none";
										});
					});
</script>
<link rel=stylesheet type="text/css"
	href="<c:url value='/css/navbar.css'/>">
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 190px;
	border-radius: 5px;
	display: inline-block;
	margin: 20px;
}

.card:hover {
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
	right: 200px;
	float: right;
	position: absolute;
	background-color: #f0f0f0;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
	<img style="width: 100%" src="<c:url value='/img/index-banner.jpg'/>">
	<ul>
		<li class="logo">旅遊去</li>
		<li class="item"><a class="active" href="<c:url value='/'/>">Home</a></li>
		<li class="item"><a href="<c:url value='/products/1'/>">商品頁面</a></li>
		<li class="item"><a href="<c:url value='/login'/>">會員登入</a></li>
		<li class="item"><a href="<c:url value='/AddProduct'/>">新增商品</a></li>
		<li class="item"><a href="<c:url value='/logout'/>">會員登出</a></li>
		<li class="item"><a href="<c:url value='/CheckCart'/>">購物車</a></li>
		<li class="item" style="float: right; margin-right: 18%;"><a
			id="click">click</a></li>
	</ul>
	<!-- dropdown cart button -->
	<div id="showcart">
		<c:if test="${empty shoppingCart.content }">
			<p style="text-align: center; margin-top: 10%">購物車內已無商品</p>
		</c:if>
		<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
			<table>
				<tr>
					<td><img style="width: 50px; height: 50px;"
						src="<c:url value='/showPic/${cart.value.pId}'/>"></td>
					<td>${cart.value.pName}</td>
					<td>${cart.value.iQty}</td>
					<td>${cart.value.pPrice}</td>
					<td>
						<form id="DeleteForm" method="get"> 
						<input type="hidden" id="DeleteId" name="pId" value="${cart.value.pId}" />
						<input type="button" onclick="DeleteItem()" value="刪除" /> 
						</form>
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>
	<!-- end of dropdown cart button -->
	<div class="ProductMainPage">
		<c:forEach varStatus="stVar" var="productBean" items="${productList}">
			<c:if test="${stVar.index%4==0 }">
				<br>
			</c:if>
			<div class="card">
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