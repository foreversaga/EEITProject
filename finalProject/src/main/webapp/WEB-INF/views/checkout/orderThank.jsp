<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="3;url=<c:url value='/'/>" />
<title>購買完成</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<div style="margin: 1% 27%;">
<img src="<c:url value='/img/success.jpg'/>">
</div>
<h3 style="text-align: center;">結帳完成，感謝您的購買！</h3>
<h3 style="text-align: center;">即將自動回到首頁，或按<a href="<c:url value='/'/>">這裡</a>回到首頁</h3>
</body>
</html>