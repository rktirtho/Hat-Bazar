<%-- 
    Document   : clearLog
    Created on : Mar 29, 2019, 12:30:16 AM
    Author     : DELL
--%>

<%@page import="com.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
       <%
           session.setAttribute("currentUser", null);
           response.sendRedirect("index.jsp");
       %>
    </body>
</html>
