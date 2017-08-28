<%-- 
    Document   : login_verify
    Created on : Aug 28, 2017, 5:47:17 PM
    Author     : haris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirecting...</title>
    </head>
    <body>
        <h1>Please wait!</h1>
        <%
            session.setAttribute("user_string", "Sample User");
            request.getRequestDispatcher("../index.jsp").forward(request, response);
        %>
    </body>
</html>
