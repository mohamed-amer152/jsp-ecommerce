<%@page import="java.util.Random"%>
<%@page import="java.util.spi.CalendarDataProvider"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="db.DBoperation"%>
<%@ page import="java.sql.*"%>


<%
String email = session.getAttribute("email").toString();
int quantity = 1;
int total = 0;
String status = "placed";
String odate = "";
String ddate = "";
int transation_id = 0;
String payment = request.getParameter("payment");
String adress = request.getParameter("address");
String city = request.getParameter("city");
String building = request.getParameter("building");
String phone = request.getParameter("phone");

// cyrrent date 
Date d = new Date();
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
LocalDateTime now = LocalDateTime.now();
odate = dtf.format(now).toString();
// delivery date 
try {
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	Calendar cal = Calendar.getInstance();
	cal.setTime(dateFormat.parse(odate));
	cal.add(Calendar.DATE, 1);
	ddate = cal.getTime().toString();
} catch (Exception e) {
	e.printStackTrace();
}

//////////////

// transaction id random number ///
Random rand = new Random(); //instance of random class
transation_id = rand.nextInt(10000);

// ------------------------------------------*****************************************************------------------------------------------------//

try {

	DBoperation db = new DBoperation();
	db.connection = db.getconnection();
	// first query to get the sum of the quantity and total of all products in same customer cart 
	db.preparedStatement = db.connection.prepareStatement(
	"select sum(quantity) , sum(total) from product p inner join cart c where p.id = c.p_id and c.email=? and c.address is null  ;");
	db.preparedStatement.setString(1, email);
	db.resultSet = db.preparedStatement.executeQuery();
	while (db.resultSet.next()) {
		quantity = db.resultSet.getInt(1);
		total = db.resultSet.getInt(2);

	}

	// inserting the data in the order table 
	db.preparedStatement = db.connection.prepareStatement("insert into orders (email, quantity, order_date, delivery_date, total, transaction_id, status, payment, address, building, city, phone) values (?,?,?,?,?,?,?,?,?,?,?,?)");
	db.preparedStatement.setString(1, email);
	db.preparedStatement.setInt(2, quantity);
	db.preparedStatement.setString(3, odate);
	db.preparedStatement.setString(4, ddate);
	db.preparedStatement.setInt(5, total);
	db.preparedStatement.setInt(6, transation_id);
	db.preparedStatement.setString(7, status);
	db.preparedStatement.setString(8, payment);
	db.preparedStatement.setString(9, adress);
	db.preparedStatement.setString(10, building);
	db.preparedStatement.setString(11, city);
	db.preparedStatement.setString(12, phone);
	db.preparedStatement.executeUpdate();

	// ------------------------------------ wiping this cart content for the same customer-----------------------//
	db.preparedStatement = db.connection.prepareStatement("delete from cart  where email=? and address is null");
	db.preparedStatement.setString(1, email);
	db.preparedStatement.executeUpdate();

	response.sendRedirect("confirm.jsp");

} catch (Exception e) {
	e.printStackTrace();
}
%>








