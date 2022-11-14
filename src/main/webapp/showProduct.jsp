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
			</tr>
			<% while (rs.next()) { %>
			<tr>
				<td> <%= rs.getInt(1) %> </td>
				<td> <%= rs.getString(2) %> </td>
				<td> <%= rs.getString(3) %> </td>
				<td> <%= rs.getFloat(4) %> </td>
			</tr>
			<% 
			} 
			con.close();
			rs.close();
			%>
		</table>
	</body>
</html>