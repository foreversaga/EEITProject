<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>會員資料更新</title>
<style>
body {
	background: #eee !important;
}

.wrapper {
	margin: 200px auto;
}

.form-signup {
	max-width: 380px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-signin-heading
	,
	.checkbox
	{
	margin-bottom
	:
	30px;
}

.checkbox {
	font-weight: normal;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
}

}
input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

radiobutton {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
}
</style>
</head>
<body>

	<div class="wrapper">
		<form:form class="form-signup" method="POST"
			modelAttribute="MemberBean">
			<h2 class="form-signin-heading">會員資料更新</h2>
			<form:input id="mAccount" path="mAccount" type="text"
				class="form-control" value="${LoginOK.mAccount}" placeholder="帳號" />
			<br>
			<form:input id="mPassword" path="mPassword" type="password"
				class="form-control" value="${LoginOK.mPassword}" placeholder="密碼" />
			<br>

			<form:input id="mEmail" path="mEmail" class="form-control"
				type="text" value="${LoginOK.mEmail}" placeholder="電子信箱" />
			<br>


			<form:input id="mPhone" path="mPhone" class="form-control"
				type="text" value="${LoginOK.mPhone}" placeholder="電話號碼" />
			<br>

			<form:input id="mAddress" path="mAddress" class="form-control"
				type="text" value="${LoginOK.mAddress}" placeholder="地址" />
			<br>

			<button class="btn btn-lg btn-primary btn-block" type="submit">送出更新</button>

		</form:form>
	</div>
</body>
</html>