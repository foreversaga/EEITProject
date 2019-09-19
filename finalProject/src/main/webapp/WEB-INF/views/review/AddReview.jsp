<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>新增評價</title>
<body>
	<div style="width: 500px; margin: 10% auto;">
		<h1>新增評價</h1>
		<form:form action="${pageContext.request.contextPath}/ProcessNewReview" modelAttribute="reviewBean" method="POST">
			<h2><form:input type="hidden" path="mName" value="${LoginOK.mName}"></form:input>${LoginOK.mName}</h2>
			<h3>評分:</h3>
			<form:radiobutton path="rRating" value="1" label="1" />
			<form:radiobutton path="rRating" value="2" label="2" />
			<form:radiobutton path="rRating" value="3" label="3" />
			<form:radiobutton path="rRating" value="4" label="4" />
			<form:radiobutton path="rRating" value="5" label="5" />
			<h3>標題:</h3>
			<form:input type="text" size="20" path="rTitle"></form:input>
			<hr>
			<form:textarea path="rReview" rows="7" cols="60"></form:textarea>
			<hr>
			<form:input type="hidden" path="pId" value="${reviewBean.pId}"></form:input>
			<input type="submit" value="送出">
		</form:form>
	</div>

</body>
</html>