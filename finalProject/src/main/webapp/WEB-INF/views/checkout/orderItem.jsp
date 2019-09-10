<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單明細</title>
</head>
<body>
	<c:forEach varStatus="vs" var="orderItem" items="${orderItemList}">
	<p>${orderItem.iDes} 
	</c:forEach>

</body>
</html>