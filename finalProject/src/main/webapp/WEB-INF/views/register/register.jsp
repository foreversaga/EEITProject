<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth : true,
			changeYear : true
		});
	});
</script>
<style>
td {
	border: 2px solid black;
	width: 110px;
	height: 30px;
}

table {
	border-collapse: collapse;
}

div.divMain {
	width: 450px;
	margin: 100px auto;
}
</style>
<meta charset="UTF-8">
<title>註冊畫面</title>

</head>
<body>
	<div class="divMain">
		<form method="post" action="<c:url value='register.do'/>">
			<table>
				<tr>
					<td>帳號:</td>
					<td><input name="mAccount" type="text" size="10"
						value="${param.mAccount}"> <font size="-1" color="red">${msgMap.errorAccount}${msgMap.DuplicateID}</font>
					</td>
				</tr>
				<tr>
					<td>密碼:</td>
					<td><input name="mPassword" value="${param.mPassword}"
						type="password" size="10"> <font size="-1" color="red">${msgMap.errorPassword}</font>
					</td>
				</tr>
				<tr>
					<td>信箱:</td>
					<td><input name="mEmail" value="${param.mEmail}" type="text"
						size="30"> <font size="-1" color="red">${msgMap.errorEmail}</font>
					</td>
				</tr>
				<tr>
					<td>姓名:</td>
					<td><input name="mName" value="${param.mName}" type="text" size="5">
						<font size="-1" color="red">${msgMap.errorName}</font></td>
				</tr>
				<tr>
					<td>性別:</td>
					<td><label> <input type="radio" value="male" name="mGender">男
					</label> <label><input type="radio"
							value="female" name="mGender">女</label> <font size="-1"
						color="red">${msgMap.errorGender}</font></td>
				</tr>
				<tr>
					<td>生日:</td>
					<td><input name="mBirth" id="datepicker"
						value="${param.mBirth}" type="text" size="20"> <font
						size="-1" color="red">${msgMap.errorBirth}</font></td>
				</tr>
				<tr>
					<td>電話:</td>
					<td><input name="mPhone" value="${param.mPhone}" type="text"
						size="10"> <font size="-1" color="red">${msgMap.errorPhone}</font>
					</td>
				</tr>
				<tr>
					<td>地址:</td>
					<td><input name="mAddress" value="${param.mAddress}"
						type="text" size="50"> <font size="-1" color="red">${msgMap.errorAddress}</font>
					</td>
				</tr>
				<tr>
					<td>身分證:</td>
					<td><input name="mID" value="${param.mID}" type="text"
						size="10"> <font size="-1" color="red">${msgMap.errorID}</font>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center"><input
						type="submit" value="送出"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>