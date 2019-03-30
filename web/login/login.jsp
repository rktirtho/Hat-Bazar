<%-- 
    Document   : login
    Created on : Mar 22, 2019, 2:47:53 AM
    Author     : Siam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">


    <head>
        <title>Sign up facundo farm & resort</title>

        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link rel="icon" href="images/icon.png" type="image/x-icon" />
        <!---- Icon link local ----->

        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
        <!---- Font awesom link local ----->
    </head>
    <body>
        <%@include file="../static/nav_bar.jsp" %>
        <div class="container-fluid my-5">
            <div class="container">
                <h2 class="text-center" id="title">Create Free Account</h2>

                <hr>
                <div class="row">
                    <div class="col-md-5">
                        <div class="card">
                            <form role="form" method="post" action="signup-check">
                                <fieldset>							
                                    <h3 class="text-success ">SIGN UP</h3>	
                                    <div class="form-group">
                                        <input type="text" name="name" id="name" class="form-control input-lg" placeholder="Full Name">
                                    </div>

                                    <div class="form-group">
                                        <input type="number" name="phoneNumber" id="email" class="form-control input-lg" placeholder="Phone Number">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" name="password2" id="password2" class="form-control input-lg" placeholder="Confirm Password">
                                    </div>
                                    <div class="form-check">
                                        <input type="radio" name="accType" value="Seller" >Seller
                                        <input type="radio" name="accType" value="buyer" >Buyer

                                    </div>
                                    <div class="form-group">
                                        <%
                                            String sts=request.getParameter("sts");
                                            if(sts !=null && sts.equals("-1")) {
                                                    %>
                                                    <span class="text-danger py-3">Your phone number already registered.</span>
                                        <%
                                                }
                                        
                                            if(sts !=null && sts.equals("0")) {
                                                    %>
                                                    <span class="text-danger py-3">Something is wrong</span>
                                        <%
                                                }
                                        
                                        if(sts !=null && sts.equals("1")) {
                                                    %>
                                                    <span class="text-danger py-3">Your account created.  </span>
                                        <%
                                                }
                                        %>
                                    </div>

                                    <div>
                                        <input type="submit" class="btn btn-lg btn-primary my-3 mx-auto"   value = "Create Account">
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>

                    <div class="col-md-2">
                        <!-------null------>
                    </div>

                    <div class="col-md-5">
                        <form role="form" action="logcheck" method="POST">
                            <fieldset>							
                                <p class="text-uppercase"> Login</p>	

                                <div class="form-group">
                                    <input type="text" name="phoneNumber" id="username" class="form-control input-lg" placeholder="Phone Number">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
                                </div>
                                <div>
                                    <input type="submit" class="btn btn-md" value="Sign In">
                                </div>

                            </fieldset>
                        </form>	
                    </div>
                </div>
            </div>
            <p class="text-center">
                <small id="passwordHelpInline" class="text-muted"> Developer:<a href="http://www.psau.edu.ph/"> Pampanga state agricultural university ?</a> BS. Information and technology students @2017 Credits: <a href="https://v4-alpha.getbootstrap.com/">boostrap v4.</a></small>
            </p>
        </div>
        <%@include file="../static/footer.html" %>
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>


</html>