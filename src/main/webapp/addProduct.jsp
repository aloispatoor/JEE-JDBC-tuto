<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Add Product</title>
	</head>
	<body>
		<h1>Add a product</h1>
		
		<% if (request.getAttribute("msg") != null) { %>
			<h4>${msg}</h4>
		<% } %>
		
		<form method="POST">
			<label for="txtTitle">Name:</label>
			<input type="text" name="txtTitle" placeholder="ex: citrouille">
			
			<label for="txtDesc">Description:</label>
			<input type="text" name="txtDesc" placeholder="ex: legume">
			
			<label for="txtPrice">Price:</label>
			<input type="text" name="txtPrice" placeholder="ex: citrouille">
			
			<input type="submit">
		</form>
	
	</body>
</html>