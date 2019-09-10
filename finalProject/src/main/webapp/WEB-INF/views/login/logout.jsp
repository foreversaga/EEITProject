<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="3;url=<c:url value='/'/>" />
<title>登出畫面</title>
<style>
div {
	width: 200px;
	margin: 100px auto;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<c:set var="memberName" value="${LoginOK.mName}" />
		<h2>用戶${memberName}已登出，接下來將回到首頁</h2>

		<c:remove var="LoginOK" scope="session" />
		<jsp:useBean id="logoutBean" class="login.model.logoutBean" scope="page" />
		<c:set target="${logoutBean}" property="session" value="${pageContext.session}" />
	<div style="display: none">	${logoutBean.logout}</div>
</div>
</body>
</html>