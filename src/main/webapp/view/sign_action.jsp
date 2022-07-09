<%@ page import="db.DBoperation" %>
<%@ page import="java.sql.*" %>

<%
  String name = request.getParameter("usernamesignup");
  String email = request.getParameter("emailsignup");
  String phone = request.getParameter("phonesignup");
  String password = request.getParameter("passwordsignup");
  String adress = "";
  String city = "";
  String building = "";
  
  try
  {
	  DBoperation db = new DBoperation();
	  db.connection = db.getconnection();
	  db.preparedStatement = db.connection.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
	  db.preparedStatement.setString(1, email);
	  db.preparedStatement.setString(2, name);
	  db.preparedStatement.setString(3, phone);
	  db.preparedStatement.setString(4, password);
	  db.preparedStatement.setString(5, adress);
	  db.preparedStatement.setString(6, city);
	  db.preparedStatement.setString(7, building);
	  db.preparedStatement.executeUpdate();
	  
	  response.sendRedirect("../index.jsp?msg=valid");
	 
  }
  catch(Exception e)
  {
	  
	  e.printStackTrace();
	  response.sendRedirect("../index.jsp?msg=invalid");  
  }
  
%>

