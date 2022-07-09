<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>



    <head>
        <meta charset="UTF-8" />
       
        <title>Login and Registration </title>
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
		
    </head>
    <body>
        <div class="container">
           
            <header>
                <h1>Login and Registration </h1>
                
                <!--    confirmation messages  -->
						
						
						<% 
						    String msg = request.getParameter("msg");
						    if("valid".equals(msg))
						    {
						%>  
						   <h1>Successfully Registered  </h1>
						<% }else if("invalid".equals(msg)){ %> 
						 
						   <h1>Error Occured   </h1>
						 <% } %> 
						 
						 <% 
						    String msg2 = request.getParameter("msg1");
						    if("invalid".equals(msg2))
						    {
						%>  
						   <h1>Wrong email or password   </h1>
						<% } %> 
				
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="view/log.jsp" autocomplete="on"> 
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" > Your email </label>
                                    <input id="username" name="username" required="required" type="text" placeholder="Enter Your Email "/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd"> Your password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="Enter Your password " /> 
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                 <p class="signin button"> 
									<input type="submit" value="Log in"/> 
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="view/sign_action.jsp" autocomplete="on"> 
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" >Your username</label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="Enter user name" />
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail"  > Your email</label>
                                    <input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="Enter user Email "/> 
                                </p>
                                 <p> 
                                    <label for="emailsignup" class="youmail"  > Your Phone</label>
                                    <input id="phonesignup" name="phonesignup" required="required" type="text" placeholder="Enter user phone "/> 
                                </p>
                                
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" >Your password </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="Enter user password"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" >Please confirm your password </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="ReEnter user password"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
						
						
                    </div>
                </div>  
              
                
            </section>
        </div>
       
    </body>
 
    
    
</html>