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
        int staffId=(Integer)session.getAttribute("userid");
        String eventName=request.getParameter("event_name");
        String eventTag=request.getParameter("event_tag");
        String eventLoc=request.getParameter("event_loc");
        Date eventDate=Date.valueOf(request.getParameter("event_date"));
        String eventDesc=request.getParameter("event_desc");
        String eventPhone=request.getParameter("event_ph");
        String eventEmail=request.getParameter("event_em");
        
        //Event Functions
        String url="jdbc:mysql://localhost:3306/amritaeventms";
        String user="root";
        String password="";
        try{
            Connection con=DriverManager.getConnection(url, user, password);
            String type=(String)session.getAttribute("eventFn");
            if(type=="addEvent"){
                String query="insert into event_details(event_id, staff_id, event_name, event_tag, event_location, event_date, event_desc, event_email, event_phone) values(NULL,?,?,?,?,?,?,?,?)";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setInt(1, staffId);
                ps.setString(2, eventName);
                ps.setString(3, eventTag);
                ps.setString(4, eventLoc);
                ps.setDate(5, eventDate);
                ps.setString(6, eventDesc);
                ps.setString(7, eventEmail);
                ps.setString(8, eventPhone);
                ps.executeUpdate();
                session.setAttribute("processDone", "yes");
                response.sendRedirect("./addEvents.jsp");
            }
            else if(type=="upEvent"){
                int eventId=Integer.parseInt(request.getParameter("event_id"));
                String query="UPDATE `event_details` SET `event_name` = ?, `event_tag` = ?, `event_location` = ?, `event_date` = ?, `event_desc` = ?, `event_email` = ?, `event_phone` = ? WHERE `event_details`.`event_id` = ?";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1, eventName);
                ps.setString(2, eventTag);
                ps.setString(3, eventLoc);
                ps.setDate(4, eventDate);
                ps.setString(5, eventDesc);
                ps.setString(6, eventEmail);
                ps.setString(7, eventPhone);
                ps.setInt(8, eventId);
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
