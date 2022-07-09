<%@page import="db.DBoperation"%>
<%@ page errorPage="../error.jsp"%>
<%@ include file="header.jsp"%>
<%@ include file="../admin/footer.jsp"%>
	
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

<link rel="stylesheet" type="text/css" href="../../css/style9.css" />

</head>
<body>



<div class="container d-flex justify-content-center mt-50 mb-50">
    <div class="row">
    
    
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
	
	int pid ;
	String price;
	String active;
	String img_path;
    String status;
    String pname ;
	try {
		
		DBoperation db = new DBoperation();
		db.connection = db.getconnection();
		db.preparedStatement = db.connection.prepareStatement("select * from product where active='y'");
		db.resultSet = db.preparedStatement.executeQuery();

		while (db.resultSet.next()) {
			pid= db.resultSet.getInt(1);
			price = db.resultSet.getString(3);
			active = db.resultSet.getString(4);
			img_path = db.resultSet.getString(5);
			pname = db.resultSet.getString(2);
			if("y".equals(active))
			{
				status= "Active";
			}
			else
			{
				status= "Not Active";
			}
			
			
	%>
    
    
    
        <div class="col-md-4 mt-2">
            <div class="card">
                <div class="card-body">
                    <div class="card-img-actions"> <img src="../img/<%=img_path %>" class="card-img img-fluid" width="96" height="350" alt=""> </div>
                </div>
                <div class="card-body bg-light text-center">
                    <div class="mb-2">
                        <h6 class="font-weight-semibold mb-2"> 
                        </h6> <a href="#" class="text-muted" data-abc="true"><%=pname %></a>
                    </div>
                    <h3 class="mb-0 font-weight-semibold">$<%=price %></h3>
                    <h3 class="mb-0 font-weight-semibold"><%=status %></h3>
                    <div> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> <i class="fa fa-star star"></i> </div>
                    <a  href="../action/add_tocart.jsp?id=<%=pid %>&price=<%=price %>"  class="btn bg-cart"><i class="fa fa-cart-plus mr-2"></i> Add to cart</a>
                </div>
            </div>
        </div>
        
    

	<%
	}

	} catch (Exception e) {

	e.printStackTrace();
	
	}
	%>    
       

    </div>
</div>





</body>
</html>

