<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>


<%
String email = session.getAttribute("email").toString();
int pid =Integer.parseInt(request.getParameter("id"));

	try {

		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("delete from cart where email=? and p_id=? and address is null");
		db.preparedStatement.setString(1, email);
		db.preparedStatement.setInt(2, pid);
		db.preparedStatement.executeUpdate();
		response.sendRedirect("../customer/Mycart.jsp?msg=delted");

	} catch (Exception e) {
		e.printStackTrace();
    	response.sendRedirect("../customer/Mycart.jsp?msg=wrong");
	}

%>