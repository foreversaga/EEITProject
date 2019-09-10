<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<meta charset="UTF-8">
<title>註冊畫面</title>

</head>
<body>

	<div class="wrapper">
		<form:form class="form-signup" method="POST" modelAttribute="MemberBean">
			<h2 class="form-signin-heading">Sign up</h2>
			<form:input id="mAccount" path="mAccount" type="text" class="form-control" placeholder="帳號" />
			<br>
			<form:input id="mPassword" path="mPassword" type="password" class="form-control" placeholder="密碼" />
			<br>

			<form:input id="mEmail" path="mEmail" class="form-control" type="text" placeholder="電子信箱" />
			<br>

			<form:input id="mName" path="mName" class="form-control" type="text" placeholder="姓名" />
			<br>
			<tr>
				<td>性別</td>
				<td><label> <form:radiobutton value="male" id="mGender" path="mGender" />男
				</label> <label><form:radiobutton value="female" id="mGender" path="mGender" />女</label></td>
			</tr>
			<form:input path="mDate" id="datepicker" class="form-control" type="text" placeholder="出身年-月-日" />
			<br>
			<form:input id="mPhone" path="mPhone" class="form-control" type="text" placeholder="電話號碼" />
			<br>

			<form:input id="mAddress" path="mAddress" class="form-control" type="text" placeholder="地址" />
			<br>

			<form:input id="mId" path="mId" type="text" class="form-control" placeholder="身分證" />
			<br>

			<button class="btn btn-lg btn-primary btn-block" type="submit">register</button>

		</form:form>
	</div>
</body>
</html>