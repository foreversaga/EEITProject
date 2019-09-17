<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車清單</title>
<script type="text/javascript">
	function DeleteItem(clicked_id) {
		var url = "<c:url value='/DeleteCartProduct?pId=" + clicked_id + "'/>";
		$.ajax({
			url : url,
			type : "get",
			success : function(data) {
				$("div.dropdown-menu").html(data);
			}
		});
	};
</script>
<style>
div#shoppingCartMenu {
	width: 280px;

}

</style>
</head>
<body>
	<div id="shoppingCartMenu">
		<table>
			<c:if test="${empty shoppingCart.content }">
				<p style="text-align: center;">購物車內已無商品。
				<p>
			</c:if>
			<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
				<hr>
				<table>
					<tr>
						<td rowspan="2"><img style="width: 80px; height: 80px;"
							src="<c:url value='/showPic/${cart.value.pId}'/>"></td>
						<td style="padding: 0 10px;">${cart.value.pName}</td>
					</tr>
					<tr>
						<td style="padding: 0 5px;">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</td> 
						<td><input style="margin-left: 10px;" id="${cart.value.pId}" type="button"
								onclick="DeleteItem(this.id)" value="刪除" /></td>
					</tr>
				</table>
				<c:if test="${vs.last}">
					<hr>
				</c:if>
			</c:forEach>
		</table>
		<c:if test="${!empty shoppingCart.content }">
			<a href="<c:url value='/CheckOut'/>">結帳</a>
		</c:if>
	</div>



</body>
</html>