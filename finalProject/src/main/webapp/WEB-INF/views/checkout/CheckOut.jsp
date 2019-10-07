<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<jsp:useBean id="orderInfo" class="cart.model.orderBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<title>我的訂單</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="<c:url value='/css/RWDcss/js/jquery.min.js'/>"></script>
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
<script type="text/javascript">
	function DelCart(pId) {
		var url = "<c:url value='/CheckOutDel?pId=" + pId + "'/>"
		$.ajax({
			type : "POST",
			url : url,
			success : function(data) {
				var count=0;
				<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content}">
				count = count + 1;
				</c:forEach>
				if(count==1){			
					alert("購物車內已無商品。");		
					location.href = "<c:url value='/products/1'/>";
					}else{
					$("div#UpdateDetail").html(data);
					}
			}
		});
	};

	$(document).ready(
			function() {
				$("select[name='qty']").on(
						"change paste keyup",
						function() {
							// 			var qty = this.value;
							// 			var tdunit = "td#unit" + this.id;
							// 			var unitprice = $(tdunit).html();
							// 			var tdsub = "td#sub" + this.id;
							// 			$(tdsub).html(qty * unitprice);
							var qty = this.value;
							var pId = this.id;
							var url = "<c:url value='/UpdateCart?pId=" + pId
									+ "&qty=" + qty + "'/>"
							$.ajax({
								type : "POST",
								url : url,
								success : function(data) {
									$("div#UpdateDetail").html(data);
								}
							});
						});
				$("button#AbortOrder").click(function(e) {
					e.preventDefault();
					if (confirm("您是否確定要放棄訂單?") == true) {
						window.location.href = "<c:url value='/AbortOrder'/>";
					} else {
						//do nothing
					}
				});
				
				$("input#SubmitOrder").submit(function(){
					e.preventDefault();
					if(${shoppingCart==null}){
						alert("購物車內無商品");
						return;
					}else{
// 						$("#OrderForm").submit();
					}
				});
			});
</script>
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

div#ftco-nav li.nav-item {
	margin: 0 20px;
}

p {
	font-size: 20px;
}

span {
	font-size: 15px;
}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='/'/>">旅遊趣</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false"
				aria-label="Toggle navigation">
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
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="hero-wrap js-fullheight" style="background-image: url(<c:url value='/css/RWDcss/images/bg_5.jpg'/>);">
		<div style="margin: 0 10%;">

			<div style="margin: 8% 2%; display: inline-block; width: 38%;" class="card">
				<div class="card-header">
					<span>購買人資訊</span>
				</div>
				<div class="card-body">
					<form:form id="OrderForm" method="POST" action="${pageContext.request.contextPath }/ConfirmOrder" modelAttribute="orderInfo">
						<table>
							<tr>
								<td><h5 class="card-title">購買人姓名:</h5></td>
								<td><h5>${orderInfo.mName}</h5></td>
							</tr>
							<tr>
								<td><h5 style="font-size: 20px">收件人姓名:</h5></td>
								<td><form:input size="10" class="card-title" type="text" path="oReceiveName" value="${orderBeanParam.oReceiveName}" /><span
									style="color: red">${errormsg.receivename}</span></td>
							</tr>
							<tr>
								<td><h5 style="font-size: 20px">收件人地址:</h5></td>
								<td><form:input size="20" class="card-title" type="text" path="oAddress" value="${orderBeanParam.oAddress }" /><span style="color: red">${errormsg.receiveadr}</span></td>
							</tr>
							<tr>
								<td><h5 style="font-size: 20px">收件人電話:</h5></td>
								<td><form:input size="10" class="card-title" type="text" path="oReceivePhone" value="${orderBeanParam.oReceivePhone}" /><span
									style="color: red">${errormsg.receivephone}</span></td>
							</tr>
							<tr>
								<td><h5 style="font-size: 20px">備註:</h5></td>
								<td><form:input class="card-title" type="text" path="oNote" value="${orderBeanParam.oNote }" /></td>
							</tr>
							<tr>
								<td><input id="SubmitOrder" type="submit" class="btn btn-outline-primary" value="送出"></td>
								<td><button id="AbortOrder" class="btn btn-outline-danger">取消</button></td>
								<%-- 								<td><button id="AbortOrder" onclick="javascript:location.href='<c:url value="/AbortOrder"/>'" class="btn btn-outline-danger">取消</button></td> --%>
							</tr>
						</table>
						<form:input type="hidden" value="${orderInfo.mAccount}" path="mAccount" />
						<form:input type="hidden" value="${orderInfo.oTimestamp}" path="oTimestamp" />
						<form:input type="hidden" value="${orderInfo.oTotalAmount}" path="oTotalAmount" />
					</form:form>
				</div>
			</div>
			<div id="UpdateDetail" style="margin: 20% 2%; display: inline-block; width: 50%" class="card">
				<div class="card-header">
					<span>購物明細</span>
				</div>
				<div>
					<table style="background-color: #99FF99; width: 100%;">
						<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content}">
							<tr>
								<td style="width: 30%;"><p>${cart.value.pName}</p></td>
								<td><span>數量:</span></td>
								<td>
									<%-- 								<input style="width: 40px;" id="${cart.value.pId}" name="qty" type="number" --%> <%-- 										value="${cart.value.iQty}" min="1" /> --%>
									<select id="${cart.value.pId}" name="qty">
										<c:forEach var="stock" begin="1" end="${stockMap[cart.value.pId]}">
											<c:choose>
												<c:when test="${stock==cart.value.iQty }">
													<option selected="selected" value="${stock}">${stock}</option>
												</c:when>
												<c:otherwise>
													<option value="${stock}">${stock}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
								</select>
								</td>
								<td><span>單價:</span></td>
								<td id="unit${cart.value.pId}"><span>$${cart.value.pPrice}</span></td>
								<td><span>小計:</span></td>
								<td style="width: 80px;" id="sub${cart.value.pId}"><span>$${cart.value.iQty * cart.value.pPrice}</span></td>
								<td><button class="btn btn-outline-danger" onclick="DelCart(this.id)" id="${cart.value.pId}">刪除</button></td>
							</tr>
						</c:forEach>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><span>金額總計:</span></td>
							<td><span>$${shoppingCart.total}</span></td>
							<td></td>
						</tr>
					</table>
					<!--end of 購物明細 -->
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

</body>
</html>
