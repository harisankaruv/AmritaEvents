<%-- 
    Document   : index
    Created on : Aug 28, 2017, 5:58:57 PM
    Author     : haris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <h1>Hello!</h1>
        <br>
        <%
            String u=request.getSession().getAttribute("user_string").toString();
        %>
        <p>Welcome <%=u%>!</p>
        <hr>
        
    </body>
</html>
