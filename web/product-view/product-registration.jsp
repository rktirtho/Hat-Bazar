<%-- 
    Document   : product-registration
    Created on : Mar 22, 2019, 12:27:24 PM
    Author     : Siam
--%>

<%@page import="com.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            User currentUser = new User();
            if ((User) session.getAttribute("currentUser") != null) {
                currentUser = (User) session.getAttribute("currentUser");
            }
            if (currentUser.getName() == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="seller-page/style.css">
        <title>Post new ad | Hat Bazar</title>
        <link rel="icon" href="images/fav.png" type="image/gif" sizes="16x16">

    </head>
    <body >
        <div id="wrapper">
            <nav class="navbar header-top fixed-top navbar-expand-lg  navbar-dark bg-dark">
                <a class="navbar-brand"  href="index.jsp">Hat <span class="text-danger">Bazar</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">

                    <ul class="navbar-nav side-nav">
                        <div class="card mx-auto my-4" style="height: 200px; width: 180px">
                            <img src="https://www.searchpng.com/wp-content/uploads/2019/02/Men-Profile-Image-715x657.png"
                                 style="height: 200px; width: 180px">
                            <h3 class="text-white card-title"><%= currentUser.getName()%></h3>
                        </div>

                        <li class="nav-item">
                            
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="profile">My Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="favorite">Favorite</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-md-auto d-md-flex">
                        
                        <li class="nav-item">
                            <a class="nav-link" href="#">কৃষি বাতায়ন</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12 col-md-10 col-md-offset-1">
                        <form class="form-horizontal" action="ProductRegistation" role="form" method="post" enctype="multipart/form-data" 
     accept-charset="utf-8">
                            <div class="form-group">
                                        <%
                                            String sts=request.getParameter("sts");
                                            if(sts !=null && sts.equals("1")) {
                                                    %>
                                                    <span class="text-success py-3">Successfully post</span>
                                        <%
                                                }
                                        
                                            if(sts !=null && sts.equals("0")) {
                                                    %>
                                                    <span class="text-danger py-3">Something is wrong</span>
                                        <%
                                                }
                                        %>
                                    </div>
                            <h2 class="text-center">Registration</h2>
                            <div class="form-group">
                                <div class="col-sm-9 col-sm-offset-3">
                                    <span class="help-block text-danger">*Required fields</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="col-sm-3 control-label">পন্যের নাম</label>
                                <div class="col-sm-9">
                                    <input type="text" id="name" name="name" placeholder="আলু/ রসুন/ ইলিস..." class="form-control" autofocus>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="category" class="col-sm-3 control-label">পন্যের ধরন</label>
                                <div class="col-sm-9">
                                    <input type="text" name="category" id="category" placeholder="শাকসবজি/মসলা/মাংস..." class="form-control" autofocus>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="type" class="col-sm-3 control-label">পণ্যের প্রকার</label>
                                <div class="col-sm-9">
                                    <input type="text" id="type" placeholder="আলু/ রসুন/ পুঁইশাক" class="form-control" name= "type">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="unitSize" class="col-sm-3 control-label">Unit Size</label>
                                <div class="col-sm-9">
                                    <input type="text" id="unitSize"  placeholder="1KG/ 50 KG/ 100L/ ১ আঁটি" name="unit_size" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="unitPrice" class="col-sm-3 control-label">Unit Price*</label>
                                <div class="col-sm-9">
                                    <input type="number" id="password" placeholder="1000" name="unit_price" class="form-control">
                                </div>
                            </div>
                            <input type="hidden" name="author_id" value="<%= currentUser.getId()%>">
                            <div class="form-group">
                                <label for="unit" class="col-sm-3 control-label">Unit </label>
                                <div class="col-sm-9">
                                    <input type="number" id="unit" name="unit" placeholder="300" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="location" class="col-sm-3 control-label">Location</label>
                                <div class="col-sm-9">
                                    <input type="text" id="location" name="location" placeholder="Dhaka" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="productDescription" class="col-sm-3 control-label">পন্যের বিবরণ*</label>
                                <div class="col-sm-9">
                                    <textarea type="text" name="description" id="productDescription" rows="4" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="location" class="col-sm-3 control-label">Location</label>
                                <div class="col-sm-9">
                                    <input type="file" name="filename" id="location" placeholder="Dhaka" accept="image/*" class="form-control">
                                </div>
                            </div>


                            <!-- /.form-group -->

                            
                            <div class="row justify-content-center">
                                <button type="submit" class="btn btn-warning ">Publish ad</button>
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>
