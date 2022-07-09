<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>

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

<link rel="stylesheet" type="text/css" href="../../css/style4.css" />

</head>
<body>
	<br>

	<div class="wrapper">

		<%
		String message = request.getParameter("msg");
		if ("valid".equals(message)) {
		%>
		<h3>Successfully added</h3>
		<%
		}
		%>

		<%
		if ("invalid".equals(message)) {
		%>
		<h3>Wrong Data</h3>
		<%
		}
		%>
		<div class="logo">
			<img
				src="https://www.freepnglogos.com/uploads/snapchat-logo-icon-png-7.png"
				alt="">
		</div>
		<div class="text-center mt-4 name">New Product</div>
		<form class="p-3 mt-3" action="../action/addproduct.jsp">
			<div class="form-field d-flex align-items-center">
				<span class="far fa-user"></span> <input type="text" name="pname"
					id="pname" placeholder="Product Name ">
			</div>
			<div class="form-field d-flex align-items-center">
				<span class="far fa-user"></span> <input type="text" name="price"
					id="price" placeholder="Product Price">
			</div>
			<div class="form-field d-flex align-items-center">
				<span class="far fa-user"></span> <input type="text" name="active"
					id="active" placeholder="Product Active  y/n">
			</div>
			<div class="d-flex justify-content-center">
				<div class="btn btn-mdb-color btn-rounded float-left">
					<input type="file" id="img" name="img">
				</div>
			</div>
			

			<button class="btn mt-3">Save</button>
		</form>

	</div>

</body>
</html>


<%@ include file="footer.jsp"%>