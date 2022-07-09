<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String name = request.getParameter("name");
String message =request.getParameter("message");

	try {
		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("insert into contact (name,email,message) values (?,?,?)");
		db.preparedStatement.setString(1, name);
		db.preparedStatement.setString(2, email);
		db.preparedStatement.setString(3, message);
		db.preparedStatement.executeUpdate();


        	response.sendRedirect("../customer/contact.jsp");
     
	} catch (Exception e) {
		e.printStackTrace();
	}

%>