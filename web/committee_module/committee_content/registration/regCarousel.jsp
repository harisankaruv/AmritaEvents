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
        String pName=request.getParameter("part_name");
        int eventId=(Integer)session.getAttribute("eventId");
        int progId=Integer.parseInt(request.getParameter("program_id"));
        String pAddr=request.getParameter("part_addr");
        String pPhone=request.getParameter("part_ph");
        String pEmail=request.getParameter("part_em");
        
        //Event Functions
        String url="jdbc:mysql://localhost:3306/amritaeventms";
        String user="root";
        String password="";
        try{
            Connection con=DriverManager.getConnection(url, user, password);
            String type=(String)session.getAttribute("regFn");
            if(type=="addPart"){
                String query="INSERT INTO `program_attender` (`participant_id`, `participant_name`, `event_id`, `program_id`, `address`, `email`, `phone`) VALUES (NULL, ?, ?, ?, ?, ?, ?);";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1, pName);
                ps.setInt(2, eventId);
                ps.setInt(3, progId);
                ps.setString(4, pAddr);
                ps.setString(5, pEmail);
                ps.setString(6, pPhone);
                ps.executeUpdate();
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
