<%@page import="db.DBoperation"%>
<%@ page errorPage="../error.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="../admin/footer.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title>My Cart</title>
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

<link rel="stylesheet" type="text/css" href="../../css/style5.css" />

</head>

<body>



	<div class="card">
		<div class="row">
			<div class="col-md-8 cart">
				<div class="title">
					<div class="row">
						<div class="col">
							<h4>
								<b>Shopping Cart</b>
							</h4>
						</div>
						<div class="col align-self-center text-right text-muted">
							items</div>
					</div>
				</div>

				<%
				String name = "";
				String img = "";
				int quantity = 1;
				int total = 0;
				int p_id = 0;
				try {

					DBoperation db = new DBoperation();
					db.connection = db.getconnection();
					db.preparedStatement = db.connection.prepareStatement(
					" select * from product p inner join cart c where p.id = c.p_id and c.email=? and c.address is null  ;");
					db.preparedStatement.setString(1, email);
					db.resultSet = db.preparedStatement.executeQuery();

					while (db.resultSet.next()) {
						name = db.resultSet.getString(2);
						quantity = db.resultSet.getInt(11);
						total = db.resultSet.getInt(10);
						img = db.resultSet.getString(5);
						p_id = db.resultSet.getInt(1);
				%>


				<div class="row border-top border-bottom">
					<div class="row main align-items-center">
						<div class="col-2">
							<img class="img-fluid" src="../img/<%=img%>">
						</div>
						<div class="col">
							<div class="row text-muted"><%=name%></div>
						</div>
						<div class="col">
							<%
							if (quantity > 1) {
							%>
							<a href="../action/product_dic.jsp?id=<%=p_id%>">-</a>
							<%
							} else {
							%>
							<a href="../action/product_remove.jsp?id=<%=p_id%>">-</a>
							<%
							}
							%>
							<a href="#" class="border"><%=quantity%></a> <a
								href="../action/product_inc.jsp?id=<%=p_id%>">+</a>
						</div>
						<div class="col">
							&euro;
							<%=total%>

							<a href="../action/product_remove.jsp?id=<%=p_id%>"
								class="close">&#10005;</a>
						</div>
					</div>
				</div>


				<%
				}

				} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("home.jsp?msg=wrong");
				}
				%>



				<div class="back-to-shop">
					<a href="home.jsp">&leftarrow;</a><span class="text-muted">Back
						to shop</span> 
				</div>


			</div>


<% 
int quantity1 = 0;
int total1 = 0;
try {

	
	DBoperation db = new DBoperation();
	db.connection = db.getconnection();
	// first query to get the sum of the quantity and total of all products in same customer cart 
	db.preparedStatement = db.connection.prepareStatement(
	"select sum(quantity) , sum(total) from product p inner join cart c where p.id = c.p_id and c.email=? and c.address is null  ;");
	db.preparedStatement.setString(1, email);
	db.resultSet = db.preparedStatement.executeQuery();
	while (db.resultSet.next()) {
		quantity1 = db.resultSet.getInt(1);
		total1 = db.resultSet.getInt(2);

	}

} catch (Exception e) {
	e.printStackTrace();
}
%>







			<!--      check out part  -->
			<div class="col-md-4 summary">
				<div>
					<h5>
						<b>Summary</b>
					</h5>
				</div>
				<hr>
				<div class="row">
					<div class="col" style="padding-left: 0;">ITEMS <%=quantity1 %></div>
					<div class="col text-right">&euro; <%=total1 %></div>
				</div>
				<form action="../action/placeorder.jsp">
					<p>SHIPPING</p>
					<select id="payment"  name="payment">
						<option class="text-muted" value="Cash">Cash
						</option>
						<option class="text-muted" value="Card">Card</option>
					</select>
					
					<p>Card Details </p>
					<input id="#" placeholder="Enter your Card Number">
					<input id="#" placeholder="Enter Expiry date">
					<input id="#" placeholder="Enter CCV">
					
					<p>Address Details </p>
					<input id="address" name="address" placeholder="Enter your address">
					<input id="city"  name="city" placeholder="Enter your city">
					<input id="building"  name="building" placeholder="Enter your building">
					<input id="phone"  name="phone" placeholder="Enter your phone">
					
					<div class="row"
					style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col">TOTAL PRICE</div>
					<div class="col text-right">&euro;<%=total1 %></div>
				</div>
				<button class="btn">CHECKOUT</button>
			  
					
					
				</form>
				 </div>
			
		</div>

	</div>



</body>

</html>

























