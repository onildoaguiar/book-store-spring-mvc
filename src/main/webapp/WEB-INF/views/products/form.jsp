<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
			<label>Pages</label>
			<input type="text" name="pages"/>
		</div>
		<button type="submit">Register</button>
	</form>
</body>
</html>