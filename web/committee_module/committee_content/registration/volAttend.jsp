<%-- 
    Document   : coordinator_login
    Created on : Aug 28, 2017, 5:46:28 PM
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
        <title>Coordinator Login</title>
        <link href="style/style.css" type="text/css" rel="stylesheet"/>
        <style>
            body {
                font-family: "Lato", sans-serif;
                transition: background-color .5s;
            }

            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }

            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
            }

            .sidenav a:hover {
                color: #f1f1f1;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 25px;
                font-size: 36px;
                margin-left: 50px;
            }

            #main {
                transition: margin-left .5s;
                padding: 16px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 18px;}
            }
            
            table{
                margin-left: -35%;
            }
            
            td{
                column-width: 200px;
                padding: 10px;
            }
        </style>
        <script>
            function gainfocus(){
                document.getElementById('staff_id').focus();
            }
        </script>
    </head>
    <body onload="gainfocus()">
        <%
            String user=(String)session.getAttribute("username");
            session.setAttribute("eventFn", "upEvent");
        %>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="./regHome.jsp">Home</a>
            <a href="./partReg.jsp">Add Participants</a>
            <a href="./volAttend.jsp">Volunteer Attendance</a>
        </div>

        <div id="main" class="w3-container w3-black">
            <span style="font-size:30px;cursor:pointer;font-family: Calibri" onclick="openNav()">&#9776; <%=user%>|<b>Committee</b> Management</span>
            <div class="w3-card w3-white w3-padding-32" style="margin-top: 5%; height: 100%; ">
                <center>
                <div class="w3-container" style="width: 50%">
                    <%
                        int sid=(Integer)session.getAttribute("userid");
                        String url="jdbc:mysql://localhost:3306/amritaeventms";
                        String usr="root";
                        String password="";
                        try{
                            Connection con=DriverManager.getConnection(url, usr, password);
                            String query = "select * from committee_details";
                            Statement st=con.createStatement();
                            ResultSet rs=st.executeQuery(query);
                    %>
                    <table class="w3-table-all w3-hoverable w3-card-4">
                        <tr class="w3-blue">
                            <th>Volunteer ID</th>
                            <th>Volunteer Name</th>
                            <th>Volunteer Field</th>
                            <th></th>
                            <th></th>
                        <tr>
                    <%
                            while(rs.next()){
                    %>
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><a href="./volIn.jsp" class="w3-text-blue">Sign In...</a></td>
                            <td><a href="./volOut.jsp" class="w3-text-blue">Sign Out...</a></td>
                        </tr>
                    <%
                            }
                    %>
                    </table>
                    <%
                        }
                        catch(Exception exp){
                            
                        }
                    %>
                </div>
                </center>
            </div>
            <div class="w3-card w3-black w3-padding-32 w3-center" style="margin-top: 10%">
                <p class="w3-text-white">Copyright &copy T3</p>
            </div>
        </div>

        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
                document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft= "0";
                document.body.style.backgroundColor = "white";
            }
        </script>
    </body>
</html>
