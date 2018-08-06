<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books of Java, C# and more! Book Store</title>
</head>
<body>
	<form:form action="${s:mvcUrl('PC#add').build()}" method="POST" commandName="product">
		<div>
			<label>Title</label> 
			<form:input path="title" />
			<form:errors path="title" />
		</div>
		<div>
			<label>Description</label>
			<form:textarea rows="10" cols="20" path="description"/>
			<form:errors path="description" />
		</div>
		<div>
			<label>Pages</label> 
			<form:input path="pages" />
			<form:errors path="pages" />
		</div>
		<div>
			<label>Release Data</label> 
			<form:input path="releaseDate" />
			<form:errors path="releaseDate" />
		</div>
		<c:forEach items="${types}" var="priceType" varStatus="status">
			<div>
				<label>${priceType}</label> 
				<form:input path="prices[${status.index}].value" />
				<form:hidden path="prices[${status.index}].type" value="${priceType}" />
			</div>
		</c:forEach>
		<button type="submit">Register</button>
	</form:form>
</body>
</html>