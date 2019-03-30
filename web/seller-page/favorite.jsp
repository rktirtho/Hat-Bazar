<%-- 
    Document   : favorite
    Created on : Mar 30, 2019, 1:05:44 AM
    Author     : DELL
--%>

<%@page import="com.dao.FavouriteDBHelper"%>
<%@page import="com.dao.ProductDBHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.Product"%>
<%@page import="com.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            ArrayList<Product> products = FavouriteDBHelper.getById(currentUser.getId());
            request.setAttribute("product", products);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="seller-page/style.css">
        <title><%= currentUser.getName()%></title>
        <link rel="icon" href="images/fav.png" type="image/gif" sizes="16x16">

    </head>
    <body>

        <!------ Include the above in your HEAD tag ---------->

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
                            <a class="nav-link" href="profile">My Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="favorite">Favorite</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-md-auto d-md-flex">
                        <li class="nav-item">
                            <a class="btn btn-warning font-weight-bold" href="post-ad">Post your ad</a>
                        </li>
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

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Total</th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${product}" var="p">
                                    <tr>
                                        <td class="col-sm-8 col-md-6">
                                            <div class="media">
                                                <a class="thumbnail pull-left" href="#"> <img class="media-object" src="images/productModel/${p.getImage()}" style="width: 72px; height: 72px;"> </a>
                                                <div class="media-body">
                                                    <h4 class="media-heading"><a href="view?pid=${p.getId()}">${p.getName()}</a></h4>
                                                </div>
                                            </div></td>
                                        <td class="col-sm-2 col-md-2" style="text-align: center">
                                            <input type="email" class="form-control" id="exampleInputEmail1" value="${p.getUnit()}">
                                        </td>
                                        <td class="col-sm-1 col-md-1 text-center"><strong>${p.getUnitPrize()} টাকা</strong></td>
                                        <td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
                                        <td class="col-sm-1 col-md-1">
                                            <a href="delete-fav?id=${p.getAuthorId()}" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-remove"></span> Remove
                                            </a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
        <script src="../js/jquery-3.3.1.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/bootstrap.bundle.js"></script>
    </body>
</html>
