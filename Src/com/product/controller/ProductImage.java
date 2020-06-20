package com.product.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet(name = "img", urlPatterns = {"/Product_Image"})
public class ProductImage extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("image/png");
		ServletOutputStream out = res.getOutputStream();
		try {
			String product_id = req.getParameter("product_id");
			String image =req.getParameter("image");
			Statement stmt = con.createStatement();
			ResultSet rs = null;
//			rs = stmt.executeQuery("SELECT description ,image"+ image+" FROM product WHERE product_id = '" + product_id + "'");
			rs = stmt.executeQuery("SELECT * FROM product WHERE product_id = '" + product_id + "'");
			if(rs.next() && new Integer(image) == 0 && rs.getBytes("description") != null) {
					BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("description"));
					byte[] buf = new byte[4 * 1024]; // 4K buffer
					int len;
					while ((len = in.read(buf)) != -1) {
						out.write(buf, 0, len);
					}
					in.close();
			} else if (new Integer(image) != 0 && rs.getBytes("image"+image) != null) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("image"+image));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
				in.close();
			}  else {
				InputStream is = getServletContext().getResourceAsStream("/resources/images/ProductImage/NoResultProduct/NoResultProduct.jpg");
				byte[] buf = new byte[is.available()];
				is.read(buf);
				out.write(buf);
//				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				is.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			InputStream is = getServletContext().getResourceAsStream("/resources/images/ProductImage/NoResultProduct/NoResultProduct.jpg");	
			byte[] buf = new byte[is.available()];
			is.read(buf);
			out.write(buf);
			is.close();
		}
	}

	public void init() throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "PETBOX", "123456");
		} catch (ClassNotFoundException e) {
			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
		} catch (SQLException e) {
			throw new UnavailableException("Couldn't get db connection");
		}
	}

	public void destroy() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}