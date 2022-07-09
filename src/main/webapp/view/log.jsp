<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>

<%
String email = request.getParameter("username");
String password = request.getParameter("password");

// i will hard code the admin  user 
if ("admin@uae".equals(email) && "123".equals(password)) {
	session.setAttribute("email", email);
	response.sendRedirect("admin/home.jsp");
} else {

	try {

		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("select * from   customer where email =?");
		db.preparedStatement.setString(1, email);
		db.resultSet = db.preparedStatement.executeQuery();

		int flag = 0;
		while (db.resultSet.next()) {
				session.setAttribute("email", email);
				response.sendRedirect("customer/home.jsp");
				flag = 1;
		}
		if (flag == 0) {
	      response.sendRedirect("../index.jsp?msg1=invalid");
		}

	} catch (Exception e) {
		e.printStackTrace();
	}

}
%>