<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入畫面</title>
<style>
div.mainDiv {
	width: 300px;
	margin: 100px auto;
}

td {
	border: 1px solid black;
	height: 50px;
}

table {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div class="mainDiv">
		<form method="POST" action="<c:url value='/login.do'/>">
			<table>
				<tr>
					<td>帳號:</td>
					<td style="width: 150px;"><input name="mAccount" type="text"
						size="10" value="${requestScope.user }${param.mAccount}"></td>
				</tr>
				<tr>
					<td>密碼:</td>
					<td style="width: 150px;"><input name="mPassword"
						type="password" size="10" value="${requestScope.password }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><p>
							<input type="checkbox" name="rememberMe"
								<c:if test='${!empty requestScope.rememberMe}'>
							checked='checked'
							</c:if>
								value="true">記住密碼
						</p>
						<p>
							<font size="-1" color="red">${errorMsgKey.LoginError}</font>
						</p> <input type="submit" value="登入"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>