
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="orderInfo" class="cart.model.orderBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結帳頁面</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>
	<div style="margin: 10% 20%;">
		<form:form method="POST" action="${pageContext.request.contextPath }/ConfirmOrder"
			modelAttribute="orderInfo">
			<div style="margin: 2%; display: inline-block; width: 45%;" class="card">
				<div class="card-header">購買人資訊</div>
				<div class="card-body">
					<table>
						<tr>
							<td><h5 class="card-title">購買人姓名:</h5></td>
							<td><h5>${orderInfo.mAccount}</h5></td>
						</tr>
						<tr>
							<td><h5>收件人姓名:</h5></td>
							<td><form:input class="card-title" type="text" path="oReceiveName" /></td>
						</tr>
						<tr>
							<td><h5>收件人地址:</h5></td>
							<td><form:input class="card-title" type="text" path="oAddress" /></td>
						</tr>
						<tr>
							<td><h5>收件人電話:</h5></td>
							<td><form:input class="card-title" type="text" path="oReceivePhone" /></td>
						</tr>
						<tr>
							<td><h5>備註:</h5></td>
							<td><form:input class="card-title" type="text" path="oNote" /></td>
						</tr>
						<tr>
							<td><input type="submit" class="btn btn-primary" value="送出"></td>
						</tr>
					</table>

				</div>
			</div>
			<div style="margin: 2%; display: inline-block; width: 45%" class="card">
				<div class="card-header">購物明細</div>
				<div>
					<table style="background-color: #99FF99; width: 100%;">
						<c:forEach varStatus="vs" var="cart" items="${shoppingCart.content}">
							<tr>
								<td>${cart.value.pName}</td>
								<td>數量:${cart.value.iQty}</td>
								<td>單價:${cart.value.pPrice}</td>
								<td>小計:${cart.value.iQty * cart.value.pPrice}</td>
							</tr>
						</c:forEach>
						<tr>
							<td>金額總計:</td>
							<td><jsp:getProperty property="oTotalAmount" name="orderInfo" /></td>
						</tr>
					</table>
					<!--end of 購物明細 -->
				</div>

			</div>
			<form:input type="hidden" value="${orderInfo.mAccount}" path="mAccount" />
			<form:input type="hidden" value="${orderInfo.oTimestamp}" path="oTimestamp" />
			<form:input type="hidden" value="${orderInfo.oTotalAmount}" path="oTotalAmount" />
		</form:form>
	</div>
</body>
</html>