<%-- 
    Document   : login-check
    Created on : Mar 28, 2019, 10:00:33 AM
    Author     : DELL
--%>

<%@page import="com.beans.User"%>
<%@page import="com.dao.UserDBHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String phoneNumber = request.getParameter("phoneNumber");
            String password = request.getParameter("password");

            int loginStatus = UserDBHelper.login(phoneNumber, password);
            if (loginStatus == 1) {
                User user = UserDBHelper.getByPhoneNumber(phoneNumber);
                session.setAttribute("currentUser", user);
                response.sendRedirect("profile");
            } else {
                response.sendRedirect("login");
            }


        %>
    </body>
</html>
