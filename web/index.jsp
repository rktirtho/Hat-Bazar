<%-- 
    Document   : index
    Created on : Mar 21, 2019, 11:01:52 PM
    Author     : Siam
--%>

<%@page import="com.beans.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDBHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | Hatbajar</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">

    </head>
    <body>
        <%@include file="static/nav_bar.jsp" %>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/slider/1.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Lorem Ipsum is simply dummy text of the printing and typesetting industry</h5>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/slider/2.jpg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Lorem Ipsum is simply dummy text of the printing and typesetting industry</h5>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                    </div>
                </div>

                <div class="carousel-item">
                    <img class="d-block w-100" src="images/slider/3.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Lorem Ipsum is simply dummy text of the printing and typesetting industry</h5>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/slider/4.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Lorem Ipsum is simply dummy text of the printing and typesetting industry</h5>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/slider/5.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Lorem Ipsum is simply dummy text of the printing and typesetting industry</h5>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/slider/6.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Lorem Ipsum is simply dummy text of the printing and typesetting industry</h5>
                        <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <%            List<Product> vegetables = ProductDBHelper.getByCategoryDist("শাঁকসবজি");
            List<Product> fruits = ProductDBHelper.getByCategoryDist("ফল");
            List<Product> fish = ProductDBHelper.getByCategoryDist("মাছ মাংস");
            List<Product> spicy = ProductDBHelper.getByCategoryDist("মশলা");
            List<Product> milk = ProductDBHelper.getByCategoryDist("দুল");
            request.setAttribute("veg", vegetables);
            request.setAttribute("fr", fruits);
            request.setAttribute("fi", fish);
            request.setAttribute("sp", spicy);
            request.setAttribute("mil", milk);
        %>

        

        <div class="my-4 category">
            <span class="badge badge-info">ফল</span> 
        </div>
        <div class="container-fluid my-3">
            <div class="row">

                <c:forEach items="${fr}" var="u">
                    <div class="col-xl-2">
                        <div class="card">
                            <img class="card-img-top product-image" src="images/productModel/${u.getImage()}" alt="Card image cap">
                            <div class="card-body">
                                <a href="type?type=${u.getType()}& cat=no" class="card-title">${u.getType()}</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
            <a class="all-product-button badge badge-info" href="all?cat=ফল">See More <i class="fas fa-arrow-circle-right"></i></a>

        </div>

        <div class="my-4 category">
            <span class="badge badge-info">মাছ মাংস</span> 
        </div>
        <div class="container-fluid my-3">
            <div class="row">

                <c:forEach items="${fi}" var="u">
                    <div class="col-xl-2">
                        <div class="card">
                            <img class="card-img-top product-image" src="images/productModel/${u.getImage()}" alt="Card image cap">
                            <div class="card-body">
                                <a href="type?type=${u.getType()}&cat=no" class="card-title">${u.getType()}</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
            <a class="all-product-button badge badge-info" href="all?cat=মাছ মাংস">See More <i class="fas fa-arrow-circle-right"></i></a>

        </div>
        
        <div class="my-4 category">
            <span class="badge badge-info p2">শাঁকসবজি</span> 
        </div>


        <div class="container-fluid my-3">
            <div class="row">
                <c:forEach items="${veg}" var="u">
                    <div class="col-xl-2">
                        <div class="card">
                            <img class="card-img-top product-image" src="images/productModel/${u.getImage()}" alt="Card image cap">
                            <div class="card-body">
                                <a href="type?type=${u.getType()}" class="card-title">${u.getType()}</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <a class="all-product-button badge badge-info" href="all?cat=শাঁকসবজি">See More <i class="fas fa-arrow-circle-right"></i></a>

        </div>


        <div class="my-4 category">
            <span class="badge badge-info p2">মশলা</span> 
        </div>
        <div class="container-fluid my-3">
            <div class="row">
                <c:forEach items="${sp}" var="u">
                    <div class="col-xl-2">
                        <div class="card">
                            <img class="card-img-top product-image" src="images/productModel/${u.getImage()}" alt="Card image cap">
                            <div class="card-body">
                                <a href="type?type=${u.getType()}& cat=no" class="card-title">${u.getType()}</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <a class="all-product-button badge badge-info" href="all?cat=মশলা">See More <i class="fas fa-arrow-circle-right"></i></a>

        </div>









        <%@include file="static/footer.html" %>

        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
        <script src="js/bootstrap.js"></script>

    </body>
</html>
