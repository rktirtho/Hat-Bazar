<%-- 
    Document   : signing-check
    Created on : Mar 29, 2019, 2:20:54 AM
    Author     : DELL
--%>

<%@page import="com.dao.UserDBHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="com.beans.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"></jsp:setProperty>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int status = UserDBHelper.save(user);
           
                response.sendRedirect("login?sts="+status);

            
        %>
    </body>
</html>
