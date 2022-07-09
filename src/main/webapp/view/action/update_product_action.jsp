<%@page import="java.util.logging.Logger"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>


<%
String p_id = request.getParameter("pid");
int id =Integer.parseInt(p_id);
String name = request.getParameter("pname");
String price = request.getParameter("price");
String active = request.getParameter("active");
String img =request.getParameter("img");

	try {

		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("update product set name=?,price=?,active=?,img=? where id=?");
		db.preparedStatement.setString(1, name);
		db.preparedStatement.setString(2, price);
		db.preparedStatement.setString(3, active);
		db.preparedStatement.setString(4, img);
		db.preparedStatement.setInt(5, id);
		db.preparedStatement.executeUpdate();
	    response.sendRedirect("../admin/newproduct.jsp?msg=valid");
		

	} catch (Exception e) {
		e.printStackTrace();
		System.out.print("gggggggggggggggggggggg"+id);
		response.sendRedirect("../admin/newproduct.jsp?msg=invalid");
	}

%>