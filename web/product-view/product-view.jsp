<%-- 
    Document   : product-view
    Created on : Mar 22, 2019, 11:52:33 AM
    Author     : Siam
--%>

<%@page import="com.dao.UserDBHelper"%>
<%@page import="com.beans.Product"%>
<%@page import="com.dao.ProductDBHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String pid = request.getParameter("pid");
    int id = 0;
    if (pid == null) {
        response.sendRedirect("index.jsp");
    } else {
        id = Integer.parseInt(pid);

    }
    Product p = ProductDBHelper.getById(id);
    User seller = UserDBHelper.getById(p.getAuthorId());
   

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getName()%> | Hatbazar</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="icon" href="images/icon.png" type="image/x-icon" />
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
        </style>
    </head>
    <body>
        <%@include file="../static/nav_bar.jsp" %>
        <div class="container py-3">
            <div class="card">
                <div class="row">
                    <aside class="col-sm-5 border-right">
                        <article class="gallery-wrap"> 
                            <div class="img-big-wrap">
                                <div> <a href="#"><img src="images/productModel/<%=p.getImage()%>" style="width: 100%"></a></div>
                            </div> <!-- slider-product.// -->
                            <!--                            <div class="img-small-wrap">
                                                            <div class="item-gallery"> <img src="http://lorempixel.com/400/200/food?2"> </div>
                                                            <div class="item-gallery"> <img src="http://lorempixel.com/400/200/food?3"> </div>
                                                            <div class="item-gallery"> <img src="http://lorempixel.com/400/200/food?4"> </div>
                                                            <div class="item-gallery"> <img src="http://lorempixel.com/400/200/food?5"> </div>
                                                        </div>  slider-nav.// -->
                        </article> <!-- gallery-wrap .end// -->
                    </aside>
                    <aside class="col-sm-7">
                        <article class="card-body p-5">
                            <h3 class="title mb-3"><%= p.getName()%></h3>

                            <p class="price-detail-wrap"> 
                                <span class="price "> 
                                    <span class="num">প্রতি <%= p.getUnitSize()%></span>
                                </span> 
                                <span class="currency text-danger"><%= p.getUnitPrize()%> টাকা</span> 
                            </p> <!-- price-detail-wrap .// -->

                            <dl class="param param-feature">
                                <dt>মোট পণ্যের পরিমান</dt>
                                <dd><%= p.getUnit()%></dd>
                            </dl>  <!-- item-property-hor .// -->
                            <dl class="param param-feature">
                                <dt>Author</dt>
                                <dd><%= seller.getName()%></dd>
                                <dd><%= seller.getPhoneNumber()%></dd>
                            </dl>  <!-- item-property-hor .// -->
                            <dl class="param param-feature">
                                <dt>Delivery</dt>
                                <dd><%= p.getLocation()%></dd>
                            </dl>  <!-- item-property-hor .// -->
                            <dl class="item-property">
                                <dt>Description</dt>
                                <dd><p><%= p.getDescription()%> </p></dd>
                            </dl>
                            <hr>
                            <div class="row">

                            </div> <!-- row.// -->
                            <hr>
                            <a href="fvmkr?pid=<%= p.getId()%>&uid=<%= currentUser.getId()%>" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                        </article> <!-- card-body.// -->
                    </aside> <!-- col.// -->
                </div> <!-- row.// -->
            </div> <!-- card.// -->


        </div>
        <!--container.//-->


        <br><br><br>
        <article class="bg-secondary mb-3">  
            <div class="card-body text-center">
                <h4 class="text-white">HTML UI KIT <br> Ready to use Bootstrap 4 components and templates </h4>
                <p class="h5 text-white"> for Ecommerce, marketplace, booking websites 
                    and product landing pages</p>   <br>
                <p><a class="btn btn-warning" target="_blank" href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com  
                        <i class="fa fa-window-restore "></i></a></p>
            </div>
            <br><br><br>
        </article>
        <%@include file="../static/footer.html" %>
        <script src="js/jquery-3.3.1.js"></script>
        <script src="js/bootstrap.bundle.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>
