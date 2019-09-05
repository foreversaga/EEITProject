<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車清單</title>
<script type="text/javascript">
function DeleteItem(clicked_id) {
	var url = "<c:url value='/DeleteCartProduct?pId="+clicked_id+"'/>";
	$.ajax({
		url : url,
		type : "get",
		success : function(data) {
			$("#showcart").html(data);
		}
	});
};
</script>
<style>
.cartdiv {
	width: 300px;
	height:423px;
}

</style>
</head>
<body>
<div class="cartdiv">
<table>
<c:if test="${empty shoppingCart.content }">
<p style="text-align: center;">購物車內已無商品。<p>
</c:if>
<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content }">
<hr>
<img style="width:50px;height:50px;float: left;" src="<c:url value='/showPic/${cart.value.pId}'/>">
<p style="line-height: 10px">${cart.value.pName}</p>
<span style="line-height: 5px">數量:${cart.value.iQty} 價格:${cart.value.pPrice}</span>
<span><input id="${cart.value.pId}" type="button" onclick="DeleteItem(this.id)" value="刪除" />
</span>
<c:if test="${vs.last}"><hr></c:if>
</c:forEach>
</table>
<c:if test="${!empty shoppingCart.content }"><a href="<c:url value='/CheckOut'/>">結帳</a></c:if>
</div>



</body>
</html>