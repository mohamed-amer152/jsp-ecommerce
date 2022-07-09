<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>


<%
String email = session.getAttribute("email").toString();
int pid =Integer.parseInt(request.getParameter("id"));
int price =0;
int quantity = 1 ;
int total = 0 ;
	try {
 
		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement(" select * from product p inner join cart c where p.id = c.p_id  and c.email=? and c.address is null and p.id=?");
		db.preparedStatement.setString(1, email);
		db.preparedStatement.setInt(2, pid);
		db.resultSet = db.preparedStatement.executeQuery();
        while(db.resultSet.next())
        {
        	price = db.resultSet.getInt(3);
        	total = db.resultSet.getInt(10);
        	total = total - price ;
        	quantity = db.resultSet.getInt(11);
        	quantity = quantity - 1 ;
        	db.preparedStatement = db.connection.prepareStatement("update cart set total=? , quantity =? where  email=? and p_id=? and address is null ");
        	db.preparedStatement.setInt(1, total);
        	db.preparedStatement.setInt(2, quantity);
        	db.preparedStatement.setString(3, email);
        	db.preparedStatement.setInt(4, pid);
        	db.preparedStatement.executeUpdate();
        	response.sendRedirect("../customer/Mycart.jsp?msg=yes");
        }
      

	} catch (Exception e) {
		e.printStackTrace();
    	response.sendRedirect("../customer/Mycart.jsp?msg=no");
	}

%>