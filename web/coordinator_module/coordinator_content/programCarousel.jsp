<%-- 
    Document   : programCarousel
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
        String programName=request.getParameter("program_name");
        String programLoc=request.getParameter("program_loc");
        Date programDate=Date.valueOf(request.getParameter("program_date"));
        String programDesc=request.getParameter("program_desc");
        String programPhone=request.getParameter("program_ph");
        String programEmail=request.getParameter("program_em");
        
        //program Functions
        String url="jdbc:mysql://localhost:3306/amritaeventms";
        String user="root";
        String password="";
        try{
            Connection con=DriverManager.getConnection(url, user, password);
            String type=(String)session.getAttribute("programFn");
            if(type=="addProgram"){
                int eventId=Integer.parseInt(request.getParameter("event_id"));
                String query="insert into program_details(program_id, event_id, program_name, program_location, program_time, program_desc, program_email, program_phone) values(NULL,?,?,?,?,?,?,?)";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setInt(1, eventId);
                ps.setString(2, programName);
                ps.setString(3, programLoc);
                ps.setDate(4, programDate);
                ps.setString(5, programDesc);
                ps.setString(7, programEmail);
                ps.setString(6, programPhone);
                ps.executeUpdate();
                session.setAttribute("processDone", "yes");
                response.sendRedirect("./done.jsp");
            }
            else if(type=="upProgram"){
                int programId=Integer.parseInt(request.getParameter("program_id"));
                String query="UPDATE `program_details` SET `program_name` = ?, `program_location` = ?, `program_time` = ?, `program_desc` = ?, `program_email` = ?, `program_phone` = ? WHERE `program_details`.`program_id` = ?";
                PreparedStatement ps=con.prepareStatement(query);
                ps.setString(1, programName);
                ps.setString(2, programLoc);
                ps.setDate(3, programDate);
                ps.setString(4, programDesc);
                ps.setString(5, programEmail);
                ps.setString(6, programPhone);
                ps.setInt(7, programId);
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
