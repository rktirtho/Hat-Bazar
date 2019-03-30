<%-- 
    Document   : all-product
    Created on : Mar 22, 2019, 2:57:28 AM
    Author     : Siam
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
        String cat = request.getParameter("cat");

        List<Product> productList = ProductDBHelper.getSameCategory(cat);
        List<String> type = ProductDBHelper.getType();

        request.setAttribute("product", productList);
        request.setAttribute("t", type);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= cat%></title>
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
                                    <c:forEach items="${t}" var="t">
                                        <a href="type?type=${t}" class="list-group-item">${t}</a>
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
