<%-- 
    Document   : nav_bar
    Created on : Mar 21, 2019, 11:56:40 PM
    Author     : Siam
--%>

<%@page import="com.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <link rel="stylesheet" type="text/css" href="../css/style.css">
    </head>
    <body>
        <%
            User currentUser = new User();
            if ((User) session.getAttribute("currentUser")!=null) {
                    currentUser = (User) session.getAttribute("currentUser");
                }

        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <a class="navbar-brand"  href="index.jsp">Hat <span class="text-danger">Bazar</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               
                <form class="form-inline mx-auto" action="search-result" method="GET">
                    <input class="form-control mr-sm-2" style="width: 400px" type="search" placeholder="Search" name="q" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                <ul class="navbar-nav">
                    <%                        if (currentUser.getName() != null) {
                    %>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <%= currentUser.getName()%>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="profile">Profile</a>
                            <a class="dropdown-item" href="clearLog">Logout</a>
                        </div>
                    </li><%
                    } else {
                    %>
                    <li>
                        <a class="btn btn-outline-success" href="login">Login</a>
                    </li>
                    <li class="ml-2">
                        <a class="btn btn-success" href="login">Sign up</a>
                    </li>
                    <%
                        }
                    %>

                </ul>
            </div>

        </nav>



        <script>
            (function ($) {

                $('#search-button').on('click', function (e) {
                    if ($('#search-input-container').hasClass('hdn')) {
                        e.preventDefault();
                        $('#search-input-container').removeClass('hdn')
                        return false;
                    }
                });

                $('#hide-search-input-container').on('click', function (e) {
                    e.preventDefault();
                    $('#search-input-container').addClass('hdn')
                    return false;
                });

            })(jQuery);
        </script>
    </body>
</html>
