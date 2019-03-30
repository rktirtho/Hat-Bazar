<%-- 
    Document   : type
    Created on : Mar 29, 2019, 3:11:16 PM
    Author     : DELL
--%>

<%@page import="com.dao.ProductDBHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.beans.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <%
        String type = request.getParameter("type");

        List<Product> productList = ProductDBHelper.getSameType(type);
        List<String> cat = ProductDBHelper.getCat();

        request.setAttribute("c", cat);
        request.setAttribute("product", productList);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= type %></title>
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
                                    <a href="all-products" class="list-group-item">All Product</a>
                                    <c:forEach items="${c}" var="c">
                                        <a href="all?cat=${c}" class="list-group-item">${c}</a>
                                    </c:forEach>
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

