<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html>
<head>


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

<% 
  String email = session.getAttribute("email").toString();
%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
		<a class="navbar-brand ml-2 mr-1" href="#" ><%out.print(email); %></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" 
			data-target="#navbarTogglerDemo02"
			aria-controls="navbarTogglerDemo02" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
			<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
				<li class="nav-item active "><a class="nav-link" href="home.jsp">Home</a></li>		
				<li class="nav-item active "><a class="nav-link" href="newproduct.jsp">ADD Product</a></li>		
				<li class="nav-item active"><a class="nav-link" href="all_products.jsp">Update Products</a></li>
				<li class="nav-item active"><a class="nav-link" href="OrderRecived.jsp">Orders Recived </a></li>
				<li class="nav-item active"><a class="nav-link" href="DeliveredOrders.jsp">Orders Delivered </a></li>
				<li class="nav-item active"><a class="nav-link" href="CancelledOrder.jsp">Orders Cancelled </a></li>
				<li class="nav-item active"><a class="nav-link" href="messages.jsp">Messages  </a></li>
				<li class="nav-item active"><a class="nav-link" href="../../index.jsp">Log out  </a></li>

			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2 ml-1 px-2" type="search" size="5px"
					placeholder="Search">
				<button class="btn btn-outline-success my-2 my-sm-0 ml-1" type="submit">Search</button>
			</form>
		</div>
	</nav>


</body>
</html>

