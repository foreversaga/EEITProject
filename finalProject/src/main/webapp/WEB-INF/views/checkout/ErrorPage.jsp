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
<style type="text/css">
* {
	font-family: Microsoft JhengHei;
}

body {
	background-image: url(<c:url value='/img/paidBG.jpg'/>);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<div style="width: 600px; margin: 10px auto;">
		<img width="600px" src="<c:url value='/img/Failed.jpg'/>">
	</div>
	<div style="width: 600px; margin: 1% auto;">
		<div style="width: 100%;" class="card">
			<div class="card-header">訂單資訊</div>
			<div class="card-body">
				<table>
					<tr>
						<td><h4 class="card-title">付款失敗，請洽客服人員。</h4></td>
					</tr>
					<tr>
						<td colspan="2"><a class="btn btn-outline-dark" href="<c:url value='/'/>">回到首頁</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>