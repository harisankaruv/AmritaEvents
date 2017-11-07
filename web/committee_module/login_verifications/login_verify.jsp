<%-- 
    Document   : login_verify
    Created on : Aug 28, 2017, 5:47:17 PM
    Author     : haris
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
                String s_id=request.getParameter("stud_id");
                String s_psd=request.getParameter("stud_psd");
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url="jdbc:mysql://localhost:3306/amritaeventms";
                String user="root";
                String psd="";
                Connection con=DriverManager.getConnection(url, user, psd);
                Statement st=con.createStatement();
                String sql="SELECT * FROM `student_details` where STUDENT_ID='"+s_id+"' and STUDENT_PSD='"+s_psd+"'";
                ResultSet rs=st.executeQuery(sql);
                rs.next();
                if(rs!=null){
                    session.setAttribute("username", rs.getString(3));
                    response.sendRedirect("../index.jsp");
                    //RequestDispatcher rd=request.getRequestDispatcher("../index.jsp");
                    //rd.forward(request, response);
                }
            }
            catch(Exception exp){
            }
        %>
    </body>
</html>
