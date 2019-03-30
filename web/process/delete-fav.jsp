<%-- 
    Document   : delete-fav
    Created on : Mar 30, 2019, 5:13:44 AM
    Author     : DELL
--%>

<%@page import="com.dao.FavouriteDBHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String ids = request.getParameter("id");
            int id=Integer.parseInt(ids);
            
            FavouriteDBHelper.delete(id);
            response.sendRedirect("favorite");
            
        %>
    </body>
</html>
