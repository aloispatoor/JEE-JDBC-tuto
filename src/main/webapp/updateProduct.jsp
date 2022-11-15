<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Update Product</title>
	</head>
	<body>
		<h1>Update a product</h1>
		
		<% if (request.getAttribute("msg") != null) { %>
			<h4>${msg}</h4>
		<% } %>
		
		<form method="POST">
			<label for="txtId">Id:</label>
			<input type="text" name="txtId" value="${id}">
			
			<label for="txtTitle">Name:</label>
			<input type="text" name="txtTitle" value="${title}">
			
			<label for="txtDesc">Description:</label>
			<input type="text" name="txtDesc" value="${descr}">
			
			<label for="txtPrice">Price:</label>
			<input type="text" name="txtPrice" value="${price}">
			
			<input type="submit">
		</form>
	</body>
</html>