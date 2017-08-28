<%-- 
    Document   : coordinator_login
    Created on : Aug 28, 2017, 5:46:28 PM
    Author     : haris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coordinator Login</title>
    </head>
    <body>
        <h1>Hello User!</h1>
        <div>
            <form action="login_verify.jsp">
                <label for="coordinator_id">Login ID</label>
                <input type="text" placeholder="Username" id="coordinator_id"/><br>
                <label for="coordinator_psd">Password</label>
                <input type="password" placeholder="Password" id="coordinator_psd"/><br>
                <input type="submit" value="Login"/>
            </form>
        </div>
    </body>
</html>
