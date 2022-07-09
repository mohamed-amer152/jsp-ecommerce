<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>


<%
String name = request.getParameter("pname");
String price = request.getParameter("price");
String active = request.getParameter("active");
String img =request.getParameter("img");

	try {

		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("insert into  product (name,price,active,img) values(?,?,?,?)");
		db.preparedStatement.setString(1, name);
		db.preparedStatement.setString(2, price);
		db.preparedStatement.setString(3, active);
		db.preparedStatement.setString(4, img);

		db.preparedStatement.executeUpdate();
	    response.sendRedirect("../admin/newproduct.jsp?msg=valid");
		

	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("../admin/newproduct.jsp?msg=invalid");
	}

%>