<%-- 
    Document   : index
    Created on : Aug 28, 2017, 5:58:57 PM
    Author     : haris
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
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
        </style>
    </head>
    <body>
        <%
            session.setAttribute("accFn", "addTrans");
            String user=(String)request.getSession(true).getAttribute("username");
            int eventId=(Integer)session.getAttribute("eventId");
            String query="select * from event_details where event_id="+eventId+"";
            String url="jdbc:mysql://localhost:3306/amritaeventms";
            String usr="root";
            String password="";
            try{
                Connection con=DriverManager.getConnection(url, usr, password);
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery(query);
                rs.next();
        %>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="./accHome.jsp">Home</a>
        </div>

        <div id="main" class="w3-black">
            <span style="font-size:30px;cursor:pointer;font-family: Calibri" onclick="openNav()">&#9776; Amrita <b>Events</b>|
                <%=user%>
            </span>
            <div class="w3-right">
                <form method="get" action="logout.jsp">
                    <input type="submit" value="Log Out" class="w3-button w3-hover-white w3-black"/>
                </form>
            </div>
            <div class="w3-card w3-white w3-padding-32">
                <center>
                <div class="w3-container">
                    <form method="post" action="accCarousel.jsp">
                        <label for="">Event Name</label>
                        <input type="text" value="<%=rs.getString(3)%>" placeholder="" style="width: 50%" class="w3-disabled w3-input w3-animate-input w3-hover-gray w3-center" name="event_name"/>
                        <br>
                        <label for="">Transaction Name</label>
                        <input type="text" placeholder="Enter Name" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="trans_name"/>
                        <br>
                        <label for="">Transaction Amount</label>
                        <input type="text" placeholder="Enter Amount" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="trans_amt"/>
                        <input type="submit" value="Submit" class="w3-button"/>
                    </form>
                </div>
                </center>
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
        <%
            }
            catch(Exception exp){
        %>
            <%=exp.getMessage()%>
        <%
            }
        %>
    </body>
</html>
