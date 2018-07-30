<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books of Java, C# and more! Book Store</title>
</head>
<body>
	<form action="/book-store-spring-mvc/products" method="POST">
		<div>
			<label>Title</label> 
			<input type="text" name="title"/>
		</div>
		<div>
			<label>Description</label>
			<textarea rows="10" cols="20" name="description"></textarea>
		</div>
		<div>
			<label>Pages</label> <input type="text" name="pages" />
		</div>
		<c:forEach items="${types}" var="priceType" varStatus="status">
			<div>
				<label>${priceType}</label> 
				<input type="text" name="prices[${status.index}].value"/>
				<input type="hidden" name="prices[${status.index}].type" value="${priceType}"/>
			</div>
		</c:forEach>
		<button type="submit">Register</button>
	</form>
</body>
</html>