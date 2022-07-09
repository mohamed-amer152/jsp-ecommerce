<%@page import="db.DBoperation"%>
<%@ page errorPage="../../error.jsp" %>
<%@ include file="../customer/header.jsp" %>
<%@ include file="../admin/footer.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>Customer Home</title>
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

<link rel="stylesheet" type="text/css" href="../../css/style3.css" />

</head>

<body>
<div class="container">
  
  <%
     String msg = request.getParameter("msg");
     if("added".equals(msg))
     {
  %>
<h2 class="h-o"> added to cart </h2>
<%
     }
%>
  
  <%
     if("exist".equals(msg))
     {
  %>
<h2 class="h-o"> same product incremented </h2><%
     }
%>
  <%
     if("wrong".equals(msg))
     {
  %>
<h2 class="h-o"> wrong  </h2>
<%
     }
%>

<% 
String key = request.getParameter("s");
	int pid ;
	String price;
	String active;
	String img_path;
    String status;
	try {
		
		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("select * from product where active='y' and name like'%"+key+"%'");
		db.resultSet = db.preparedStatement.executeQuery();

		while (db.resultSet.next()) {
			pid= db.resultSet.getInt(1);
			price = db.resultSet.getString(3);
			active = db.resultSet.getString(4);
			img_path = db.resultSet.getString(5);
			if("y".equals(active))
			{
				status= "Active";
			}
			else
			{
				status= "Not Active";
			}
			
			
	%>

	    
		<label class="l-1"> <img src="../img/<%=img_path%>"
			class="img-thumbnail" width="300px" ><br>
			<a
			href="../action/add_tocart.jsp?id=<%=pid %>" class="btn btn-outline-dark">add to cart</a>
			 <span
			class="label label-default"> <%=price%>$</span> <span
			class="label label-info"><%=status %></span>
		</label>

	

	<%
	}

	} catch (Exception e) {

	e.printStackTrace();
	
	}
	%>
</div>
</body>


</html>