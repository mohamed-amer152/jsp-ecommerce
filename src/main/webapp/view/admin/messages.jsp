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
				<th scope="col">Customer Name</th>
				<th scope="col">Customer Email</th>
				<th scope="col">Message</th>
				
				
			</tr>
		</thead>

<%

	String name="";
	String mail="";
	String message="";

	try {
		
		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("select * from contact");
		db.resultSet = db.preparedStatement.executeQuery();

		
		while (db.resultSet.next()) {
			
			mail = db.resultSet.getString(2);
			name = db.resultSet.getString(3);
			message = db.resultSet.getString(4);
			

  %>
		<tbody>
			<tr>
				<td><%=name %></td>
				<td><%=mail %></td>
				<td><%=message %></td>
				
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