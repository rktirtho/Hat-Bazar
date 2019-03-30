<%-- 
    Document   : fav-mkr
    Created on : Mar 30, 2019, 4:51:48 AM
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
            String pids = request.getParameter("pid");
            String uids = request.getParameter("uid");
            if (uids.equals("0")) {
                response.sendRedirect("login");
            } else {
                int pid = Integer.parseInt(pids);
                int uid = Integer.parseInt(uids);
                FavouriteDBHelper.save(pid, uid);
                response.sendRedirect("view?pid=" + pids);
            }

        %>
    </body>
</html>
