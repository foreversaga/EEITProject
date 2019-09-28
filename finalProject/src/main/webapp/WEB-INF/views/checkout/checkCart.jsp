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
</script>
<style>
</style>
</head>
<body>
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
<%-- 		<p><c:if test="${!empty shoppingCart.content }"> --%>
<%-- 			<a href="<c:url value='/CheckOut'/>">結帳</a> --%>
<%-- 		</c:if></p> --%>
</body>
</html>