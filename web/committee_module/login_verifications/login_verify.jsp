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
                String acc="accounts";
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String url="jdbc:mysql://localhost:3306/amritaeventms";
                String user="root";
                String psd="";
                Connection con=DriverManager.getConnection(url, user, psd);
                Statement st=con.createStatement();
                String sql="SELECT * FROM `committee_details` where login='"+s_id+"' and password='"+s_psd+"'";
                ResultSet rs=st.executeQuery(sql);
                rs.next();
                String type=rs.getString(4);
                session.setAttribute("eventId", rs.getInt(1));
                if(rs!=null&&(type.contains("registration"))){
                    session.setAttribute("username", rs.getString(3));
                    session.setAttribute("userfield", rs.getString(4));
                    response.sendRedirect("../committee_content/registration/regHome.jsp");
                }
                else if(rs!=null&&(type.contains("accounts"))){
                    session.setAttribute("username", rs.getString(3));
                    session.setAttribute("userfield", rs.getString(4));
                    response.sendRedirect("../committee_content/accounts/accHome.jsp");
                }
            }
            catch(Exception exp){
            }
        %>
    </body>
</html>
