<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料</title>
<style>
div {
	width: 400px;
	text-align: center;
	margin: 100px auto;
}

table {
	border-collapse: collapse;
}

td {
	border: 1px solid black;
	width: 200px;
}
</style>
</head>
<body>
	<div>
		<table>
			<tr>
				<td colspan="2">
					<h2>會員資料</h2>
				</td>
			</tr>
			<tr>
				<td>會員姓名:</td>
				<td>${MemberInfo.mName}</td>
			</tr>
			<tr>
				<td>會員電話:</td>
				<td>${MemberInfo.mPhone}</td>
			</tr>
			<tr>
				<td>會員信箱:</td>
				<td>${MemberInfo.mEmail}</td>
			</tr>
			<tr>
				<td>會員地址:</td>
				<td>${MemberInfo.mAddress}</td>
			</tr>

		</table>
<p><a href="../index.jsp">回首頁</a></p>
	</div>

</body>
</html>