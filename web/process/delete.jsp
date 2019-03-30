<%-- 
    Document   : delete
    Created on : Mar 30, 2019, 12:11:11 AM
    Author     : DELL
--%>

<%@page import="com.dao.ProductDBHelper"%>
<%@page import="com.beans.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting</title>
    </head>
    <body>
        <%
            String ids = request.getParameter("pid");
            int id=Integer.parseInt(ids);
            
            ProductDBHelper.delete(id);
            response.sendRedirect("profile");
            
        %>
    </body>
</html>
