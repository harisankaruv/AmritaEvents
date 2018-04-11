<%-- 
    Document   : eventCarousel
    Created on : Oct 28, 2017, 12:20:51 PM
    Author     : haris
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Redirecting...</title>
    </head>
    <body>
    <%
        //Accessing data from input text boxes
        int eventId=(Integer)session.getAttribute("eventId");
        String tName=request.getParameter("trans_name");
        String tAmt=request.getParameter("trans_amt");
        
        //Event Functions
        String url="jdbc:mysql://localhost:3306/amritaeventms";
        String user="root";
        String password="";
        try{
            Connection con=DriverManager.getConnection(url, user, password);
            String type=(String)session.getAttribute("accFn");
            if(type=="addTrans"){
                String query="INSERT INTO `accounts` (`transaction_id`, `event_id`, `trans_name`, `trans_amount`) VALUES (NULL, ?, ?, ?);";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setInt(1, eventId);
                ps.setString(2, tName);
                ps.setString(3, tAmt);
                ps.executeUpdate();
                session.setAttribute("processDone", "yes");
                response.sendRedirect("./done.jsp");
            }
        }
        catch(Exception exp){
    %>
        <%=exp.getMessage()%>
    <%
        }
    %>
    </body>
</html>
