<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>登入畫面</title>
<style>
body {
	background: #eee !important;
}

.wrapper {
	    height: 200px;
    width: 400px;

 
    position: absolute;     /*絕對位置*/
    top: 50%;               /*從上面開始算，下推 50% (一半) 的位置*/
    left: 50%;              /*從左邊開始算，右推 50% (一半) 的位置*/
    margin-top: -100px;     /*高度的一半*/
    margin-left: -200px;
}

.form-signin {
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
		<form class="form-signin" method="POST"
			action="<c:url value='checklogin'/>">
			<h2 class="form-signin-heading">Login</h2>

			<input name="mAccount" type="text" class="form-control"
				placeholder="帳號" value="${requestScope.user }${param.mAccount}" /><br>


			<input name="mPassword" class="form-control" placeholder="密碼"
				type="password" value="${requestScope.password }" /> 
				<p><font size="-1" color="red">${errorMsgKey.LoginError}</font></p>
			<!-- 						</p> <input type="submit" value="登入"></td> -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>

	</div>
	<!-- 	<div class="wrapper"> -->
	<!-- 		<form class="form-signin"> -->
	<!-- 			<h2 class="form-signin-heading">Please login</h2> -->
	<!-- 			<input type="text" class="form-control" name="username" -->
	<!-- 				placeholder="Email Address" required="" autofocus="" /> -->
	<!-- 				 <input -->
	<!-- 				type="password" class="form-control" name="password" -->
	<!-- 				placeholder="Password" required="" /> -->
	<!-- 				 <label class="checkbox"> -->
	<!-- 				<input type="checkbox" value="remember-me" id="rememberMe" -->
	<!-- 				name="rememberMe"> Remember me -->
	<!-- 			</label> -->
	<!-- 			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button> -->
	<!-- 		</form> -->
	<!-- 	</div> -->
</body>
</html>