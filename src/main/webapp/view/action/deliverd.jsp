<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>


<%
int tid =Integer.parseInt(request.getParameter("tid"));
	try {

		// case 1 - the product already in the customer cart and will increment one more 
		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("update orders set status='Delivered' where transaction_id =?");
		db.preparedStatement.setInt(1, tid);
		db.preparedStatement.executeUpdate();

		response.sendRedirect("../admin/OrderRecived.jsp");
       

	} catch (Exception e) {
		e.printStackTrace();
	}

%>