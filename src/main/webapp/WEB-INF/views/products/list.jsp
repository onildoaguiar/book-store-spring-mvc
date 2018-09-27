<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books of Java, C# and more! Book Store</title>
</head>
<body>
	<h1>Book List</h1>
	<div>${success}</div>
	<table>
		<tr>
			<td>Title</td>
			<td>Description</td>
			<td>Pages</td>
		</tr>
		<c:forEach items="${products}" var="product" varStatus="">
			<tr>
				<td><a href="${s:mvcUrl('PC#detail').arg(0, product.id).build()}">${product.title}</a</td>
				<td>${product.description}</td>
				<td>${product.pages}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>