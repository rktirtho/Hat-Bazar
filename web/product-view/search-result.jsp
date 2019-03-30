<%-- 
    Document   : search-result
    Created on : Mar 29, 2019, 11:43:10 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.ProductDBHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.beans.Product"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <%
        String q = request.getParameter("q");

        List<Product> productList = ProductDBHelper.search(q);

        request.setAttribute("product", productList);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search result for <%= q %></title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <%@include file="../static/nav_bar.jsp" %>
        <div class="container-fluid my-3">
            <div class="row">
                <div class="col-md-2">
                    <div class="position-fixed col-2">
                        <div class="">
                            <div class="">
                                <div class="list-group">
                                    <a href="all-products" class="list-group-item">Link One</a>
                                    <a href="" class="list-group-item">Link Two</a>
                                    <a href="" class="list-group-item">Link Three</a>
                                    <a href="" class="list-group-item">Link Four</a>
                                    <a href="" class="list-group-item">Link Five</a>
                                    <a href="" class="list-group-item">Link Six</a>
                                    <a href="add-product" class="list-group-item">Registration</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 " >
                    
                    <div class="row">
                        <c:forEach items="${product}" var="p">
                            <div class="col-xl-3 py-3">
                                <div class="card">
                                    <img class="card-img-top product-image" src="images/productModel/${p.getImage()}" alt="Card image cap">
                                    <div class="card-body">
                                        <a href="view?pid=${p.getId()}"><p class="card-title">${p.getName()}</p></a>
                                        <span>${p.getUnitSize()}</span><span class="text-danger"> ${p.getUnitPrize()} টাকা</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>



                    </div>



                </div>
            </div>
        </div>

        <%@include file="../static/footer.html" %>
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>


