<%@page import="db.DBoperation"%>
<%@ page errorPage="../error.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="../admin/footer.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title>Your Orders</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="../../css/style7.css" />

</head>
<body>


	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">Items Quantity</th>
				<th scope="col">Order Date</th>
				<th scope="col">Delivery Date</th>
				<th scope="col">Payment Method</th>
				<th scope="col">Order Status</th>
				<th scope="col">Total price Status</th>
			</tr>
		</thead>

<%
  
  int quantity =0 ;
  int total =0;
	String odate="";
	String ddate="";
	String status="";
  String payment="";
	try {
		
		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("select * from orders where email=?");
		db.preparedStatement.setString(1, email);
		db.resultSet = db.preparedStatement.executeQuery();

		while (db.resultSet.next()) {
			quantity= db.resultSet.getInt(3);
			total= db.resultSet.getInt(6);
			odate = db.resultSet.getString(4);
			ddate = db.resultSet.getString(5);
			status = db.resultSet.getString(8);
			payment = db.resultSet.getString(9);

  %>

		<tbody>
			<tr>
				<td><%=quantity %> Items</td>
				<td><%=odate %></td>
				<td><%=ddate %></td>
				<td><%=payment %></td>
				<td><%=status %></td>
				<td><%=total %></td>
			</tr>

<%
		}
	}catch(Exception e)
	{
		e.printStackTrace();
	}
%>
		</tbody>
	</table>








</body>
</html>