<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="orderInfo" class="cart.model.orderBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<title>我的訂單</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script type="text/javascript">
	function DelCart(pId) {
		var url = "<c:url value='/CheckOutDel?pId=" + pId + "'/>"
		$.ajax({
			type : "POST",
			url : url,
			success : function(data) {
				$("div#UpdateDetail").html(data);
			}
		});
	}
	$(document).ready(
			function() {
				$("input[name='qty']").on(
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
			});
</script>
</head>
<body>
	<div class="card-header">購物明細</div>
	<div>
		<table style="background-color: #99FF99; width: 100%;">
			<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content}">
				<tr>
					<td>${cart.value.pName}</td>
					<td>數量:</td>
					<td><input style="width: 40px;" id="${cart.value.pId}" name="qty" type="number"
							value="${cart.value.iQty}" min="1" /></td>
					<td>單價:</td>
					<td>${cart.value.pPrice}</td>
					<td>小計:</td>
					<td style="width: 80px;">$${cart.value.iQty * cart.value.pPrice}</td>
					<td><button onclick="DelCart(this.id)" id="${cart.value.pId}">刪除</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>金額總計:</td>
				<td>$${shoppingCart.total}</td>
				<td></td>
			</tr>
		</table>
		<!--end of 購物明細 -->
	</div>
</body>
</html>
