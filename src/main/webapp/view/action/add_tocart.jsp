<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>


<%
String email = session.getAttribute("email").toString();
int pid =Integer.parseInt(request.getParameter("id"));
int price =Integer.parseInt(request.getParameter("price"));
int quantity = 1 ;
int total = 0 ;
	try {

		// case 1 - the product already in the customer cart and will increment one more 
		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("select * from cart where email=? and p_id=? and address is null");
		db.preparedStatement.setString(1, email);
		db.preparedStatement.setInt(2, pid);
		db.resultSet = db.preparedStatement.executeQuery();
        if(db.resultSet.next())
        {
        	total = db.resultSet.getInt(5);
        	quantity = db.resultSet.getInt(6);
        	total = total + price ;
        	quantity = quantity +1 ;
        	db.preparedStatement = db.connection.prepareStatement("update cart set total=? , quantity =? where  email=? and p_id=? and address is null ");
        	db.preparedStatement.setInt(1, total);
        	db.preparedStatement.setInt(2, quantity);
        	db.preparedStatement.setString(3, email);
        	db.preparedStatement.setInt(4, pid);
        	db.preparedStatement.executeUpdate();
        	response.sendRedirect("../customer/home.jsp?msg=exist");
        }
        else
        {
        	// case 2 - the product newly added to customer cart 
        	total = price ;
        	db.preparedStatement = db.connection.prepareStatement("insert into cart (email , p_id ,total ,quantity) values (?,?,?,?)");
        	db.preparedStatement.setString(1, email);
        	db.preparedStatement.setInt(2, pid);
        	db.preparedStatement.setInt(3, total);
        	db.preparedStatement.setInt(4, quantity);
        	db.preparedStatement.executeUpdate();
        	response.sendRedirect("../customer/home.jsp?msg=added");
        }

		
		
		
		

	} catch (Exception e) {
		e.printStackTrace();
    	response.sendRedirect("../customer/home.jsp?msg=wrong");
	}

%>