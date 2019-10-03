<%-- 
    Document   : logout
    Created on : Nov 2, 2018, 10:08:35 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
           session.invalidate();
            response.sendRedirect("home.html");
        %>
       
    </body>
</html>
