package com.jee.ihm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jee.dao.UtilConnexion;


@WebServlet("/update")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = UtilConnexion.seConnecter();
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			String query = "SELECT * FROM product WHERE id='" + id + "'";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				request.setAttribute("id", rs.getInt(1));
				request.setAttribute("title", rs.getString(2));
				request.setAttribute("descr", rs.getString(3));
				request.setAttribute("price", rs.getFloat(4));
			}
			
			request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
			
			rs.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/getall").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = UtilConnexion.seConnecter();
			
			int id = Integer.parseInt(request.getParameter("txtId"));
			String title = request.getParameter("txtTitle");
			String descr = request.getParameter("txtDesc");
			float price = Float.valueOf(request.getParameter("txtPrice"));
			
			String query = "UPDATE product SET (title, descr, price) VALUE ('" + title + "','" + descr + "','" + price +"')'";
			PreparedStatement ps = con.prepareStatement(query);
			ps.executeUpdate();
			
			con.close();
			
			request.setAttribute("msg", "Product updated!");
			request.getRequestDispatcher("/getall").forward(request, response);
			
		} catch (Exception e) {
			request.setAttribute("msg", "Error at update");
			doGet(request, response);
		}
		
	}

}
