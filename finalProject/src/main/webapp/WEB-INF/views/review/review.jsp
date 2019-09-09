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

<body>
<div> 
123
<c:forEach var='rw'  items=''${review}'>

<%-- <p>留言編號:${rw.rId }</p> --%>
<%-- <p>評價內容:${review.rMessage} }</p> --%>
<%-- <p>${review.mAccount }</p> --%>
<%-- <p>${review.rId }</p> --%>
<%-- <p>${review.pId }</p> --%>
<%-- <p>${review.rId }</p> --%>
<%-- <p>${review.rTimestamp}</p> --%>
<%-- <p>${review.rRating}</p> --%>


</c:forEach>

</div>


</body>
</html>