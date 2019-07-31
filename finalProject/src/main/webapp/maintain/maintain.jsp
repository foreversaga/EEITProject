<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
<meta charset="UTF-8">
<title>維護商品</title>
<style>
div.main {
	width: 300px;
	margin: 100px auto;
	text-align: center;
}
table{
border-collapse: collapse;}
th{
border:1px solid black;}
td{
width:300px;
border:1px solid black;
text-align: left;}
</style>
</head>
<body>

<div class="main">
<form action="maintain.do" method="POST">
<table>
<tr><th>新增產品</th></tr>
<tr><td>產品編號</td><td><input name="pID" type="text" size="10" value="${param.pID}">
<font size="-1" color="red">${msgMap.idError}</font></td>
<tr><td>產品名稱</td><td><input name="pName" type="text" size="10" value="${param.pName}">
<font size="-1" color="red">${msgMap.nameError}</font></td>
<tr><td>產品價格</td><td><input name="pPrice" type="text" size="10" value="${param.pPrice}">
<font size="-1" color="red">${msgMap.priceError}</font></td>
<tr><td>產品庫存量</td><td><input name="PinStock" type="text" size="10" value="${param.PinStock}">
<font size="-1" color="red">${msgMap.stockError}</font></td>
<tr><td>產品有效日期</td><td><input id="datepicker" name="pDateRange" type="text" size="10" value="${param.pDateRange}">
<font size="-1" color="red">${msgMap.dateError}</font></td>
<tr><td>產品說明</td><td><input name="pContent" type="text" size="20" value="${param.pContent}">
<font size="-1" color="red">${msgMap.countentError}</font></td></tr>
<tr><td colspan="2" style="text-align: center"><input type="submit" value="送出"></td></tr>

</table>
</form>
</div>
	<div class="main">
	<p><font size="-1" color="red">${msgOK.insertOK}${msgMap.insertError}</font></p>
		<a href="../index.jsp">回首頁</a>
	</div>
</body>
</html>