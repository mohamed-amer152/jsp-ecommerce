<%@page import="db.DBoperation"%>
<%@ page errorPage="../../error.jsp" %>
<%@ include file="header.jsp" %>
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

<link rel="stylesheet" type="text/css" href="../../css/style6.css" />

</head>

<body>
<div class="container-fluid rounded">
    <div class="row px-5">
        <div class="col-sm-6">
            <div>
                <h3 class="text-white">hI There</h3>
                <p class="text-secondary">Fill up the form and our Team will get back to you within in 24 hours</p>
            </div>
            <div class="links" id="bordering"> <a href="#" class="btn rounded text-white p-3"><i class="fa fa-phone icon text-primary pr-3"></i>+971586339720</a> <a href="#" class="btn rounded text-white p-3"><i class="fa fa-envelope icon text-primary pr-3"></i>amer2050.mohamed@gmail.com</a> <a href="#" class="btn rounded text-white p-3"><i class="fa fa-map-marker icon text-primary pr-3"></i>UAE / DUBAI	</a> </div>
            <div class="pt-lg-4 d-flex flex-row justify-content-start">
                <div class="pad-icon"> <a class="fa fa-facebook text-white" href="#"></a> </div>
                <div class="pad-icon"> <a class="fa fa-twitter text-white" href="#"></a> </div>
                <div class="pad-icon"> <a class="fa fa-instagram text-white" href="#"></a> </div>
            </div>
        </div>
        <div class="col-sm-6 pad">
            <form class="rounded msg-form" action="../action/contact.jsp">
                <div class="form-group"> <label for="name" class="h6">Your Name</label>
                    <div class="input-group border rounded">
                        <div class="input-group-addon px-2 pt-1">
                            <p class="fa fa-user-o text-primary"></p>
                        </div> <input type="text" class="form-control border-0" id="name" name="name">
                    </div>
                </div>
              

                <div class="form-group"> <label for="msg" class="h6">Message</label> <textarea name="message" id="msgus" cols="10" rows="5" class="form-control bg-light" placeholder="Message"></textarea> </div>
                <div class="form-group d-flex justify-content-end"> <input type="submit" class="btn btn-primary text-white" value="send message"> </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>