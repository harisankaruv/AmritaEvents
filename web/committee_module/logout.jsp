<%-- 
    Document   : logout
    Created on : Sep 19, 2017, 11:26:06 PM
    Author     : haris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Please Wait...</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("../index.jsp");
        %>
    </body>
</html>
