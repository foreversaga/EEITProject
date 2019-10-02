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
<style type="text/css">
*{
font-family: Microsoft JhengHei;
}
p{
font-size: 25px;
}
span{font-size: 20px;
}
</style>
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
						<td style="width: 38%;"><p>${cart.value.pName}</p></td>
								<td><span>數量:</span></td>
								<td>
									<%-- 								<input style="width: 40px;" id="${cart.value.pId}" name="qty" type="number" --%>
									<%-- 										value="${cart.value.iQty}" min="1" /> --%> <select name="qty">
										<c:forEach var="stock" begin="1" end="${stockMap[cart.value.pId]}">
											<option value="${stock}">${stock}</option>
										</c:forEach>
								</select>
								</td>
								<td><span>單價:</span></td>
								<td id="unit${cart.value.pId}"><span>${cart.value.pPrice}</span></td>
								<td><span>小計:</span></td>
								<td style="width: 80px;" id="sub${cart.value.pId}"><span>$${cart.value.iQty *
										cart.value.pPrice}</span></td>
								<td><button class="btn btn-outline-danger" onclick="DelCart(this.id)"
										id="${cart.value.pId}">刪除</button></td>
							</tr>
			</c:forEach>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><p>金額總計:</td>
				<td><p>$${shoppingCart.total}</td>
				<td></td>
			</tr>
		</table>
		<!--end of 購物明細 -->
	</div>
</body>
</html>
