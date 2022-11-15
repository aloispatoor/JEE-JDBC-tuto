<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jee.dao.UtilConnexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>List of all Products</title>
	</head>
	<body>
		<h1>List of all Products</h1>
		<% if (request.getAttribute("msg") != null) { %>
			<h4>${msg}</h4>
		<% } %>
		
		<%
			Connection con = UtilConnexion.seConnecter();
			ResultSet rs = con.createStatement().executeQuery("SELECT * from product");
		%>
		
		<table>
			<tr> 
				<th>IDP</th>
				<th>Title</th>
				<th>Description</th>
				<th>Price</th>
				<th>Delete</th>
				<th>Update</th>
			</tr>
			<% while (rs.next()) { %>
			<tr>
				<td> <%= rs.getInt(1) %> </td>
				<td> <%= rs.getString(2) %> </td>
				<td> <%= rs.getString(3) %> </td>
				<td> <%= rs.getFloat(4) %> </td>
				<td> <a href="/jdbc-example2/delete?id=<%= rs.getInt(1) %>">Delete</a> </td>
				<td> <a href="/jdbc-example2/update?id=<%= rs.getInt(1) %>">Update</a> </td>
			</tr>
			<% 
			} 
			con.close();
			rs.close();
			%>
		</table>
		
		<a href="/jdbc-example2/add">Add</a>
	</body>
</html>