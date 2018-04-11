<%-- 
    Document   : index
    Created on : Sep 18, 2017, 2:22:05 PM
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
        <title>Amrita Events</title>
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
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="./index.jsp">Home</a>
            <a href="./coordinator_module/login_verifications/coordinator_login.jsp">Coordinator Login</a>
            <a href="#">Contact</a>
            <a href="./about_page/index.html">About</a>
        </div>
        <%
            String present, past, future, url, user, psd;
            url="jdbc:mysql://localhost:3306/amritaeventms";
            user="root";
            psd="";
            present="select * from event_details where event_date=CURDATE() order by event_name";
            past="select * from event_details where event_date<CURDATE() order by event_date DESC";
            future="select * from event_details where event_date>CURDATE() order by event_date";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(url, user, psd);
                Statement st=con.createStatement();
                ResultSet prsnt=st.executeQuery(present);
        %>
        <div id="main">
            <span style="font-size:30px;cursor:pointer;font-family: Calibri" onclick="openNav()">&#9776; Amrita <b>Events</b>|Home</span>
            
            <div class="w3-container w3-white">
                <h1>Present Events</h1>
                <%
                    int i=0;
                    while(prsnt.next()&&(i<2)){%>
                        <div class="w3-container">
                            <h2></h2>
                            <div class="w3-card-4" style="width:70%">
                                <header class="w3-container w3-light-grey">
                                    <h3><%=prsnt.getString(3)%></h3>
                                </header>
                                <div class="w3-container">
                                    <p><%=prsnt.getDate(6)%></p>
                                    <hr>
                                    <p><%
                                        String desc=(String)prsnt.getString(7);
                                        %>
                                        <%=desc.substring(0, 200)%>...
                                        <br><br>
                                        Click below to know more...
                                    </p><br>
                                </div>
                                <form action="event_details/index.jsp">
                                    <input type="submit" value="<%=prsnt.getInt(1)%>" name="evbutton" class="w3-button w3-hover-dark-grey w3-hover-text-dark-grey w3-block w3-text-dark-grey w3-dark-grey">
                                </form>
                            </div>
                        </div>
                    <%
                        i++;
                    }
                    prsnt.close();
                %>
                <a href="present.jsp">View all...</a>
            </div>
            <div class="w3-container w3-white">
                <h1>Past Events</h1><%
                    i=0;
                    ResultSet pst=st.executeQuery(past);
                    while(pst.next()&&(i<2)){%>
                        <div class="w3-container">
                            <h2></h2>
                            <div class="w3-card-4" style="width:70%">
                                <header class="w3-container w3-light-grey">
                                    <h3><%=pst.getString(3)%></h3>
                                </header>
                                <div class="w3-container">
                                    <p><%=pst.getDate(6)%></p>
                                    <hr>
                                    <p><%
                                        String desc=(String)pst.getString(7);
                                        %>
                                        <%=desc.substring(0, 200)%>...
                                        <br><br>
                                        Click below to know more...
                                    </p><br>
                                </div>
                                <form action="event_details/index.jsp">
                                    <input type="submit" value="<%=pst.getInt(1)%>" name="evbutton" class="w3-button w3-hover-dark-grey w3-hover-text-dark-grey w3-block w3-text-dark-grey w3-dark-grey">
                                </form>
                            </div>
                        </div>
                    <%
                        i++;
                    }
                    pst.close();
                %>
                <a href="past.jsp">View all...</a>
            </div>
            <div class="w3-container w3-white">
                <h1>Upcoming Events</h1>
                <%
                    i=0;
                    ResultSet ftr=st.executeQuery(future);
                    while(ftr.next()&&(i<2)){%>
                        <div class="w3-container">
                            <h2></h2>
                            <div class="w3-card-4" style="width:70%">
                                <header class="w3-container w3-light-grey">
                                    <h3><%=ftr.getString(3)%></h3>
                                </header>
                                <div class="w3-container">
                                    <p><%=ftr.getDate(6)%></p>
                                    <hr>
                                    <p><%
                                        String desc=(String)ftr.getString(7);
                                        %>
                                        <%=desc.substring(0, 200)%>...
                                        <br><br>
                                        Click below to know more...
                                    </p><br>
                                </div>
                                <form action="event_details/index.jsp">
                                    <input type="submit" value="<%=ftr.getInt(1)%>" name="evbutton" class="w3-button w3-hover-dark-grey w3-hover-text-dark-grey w3-block w3-text-dark-grey w3-dark-grey">
                                </form>
                            </div>
                        </div>
                    <%
                        i++;
                    }
                %>
                <a href="future">View all...</a>
            </div>
            <a href="volunteer_register.jsp">Here's a glimpse of how <b>Become a volunteer</b> works...</a>
        </div>
        <%
            }
            catch(Exception exp){%>
                <%=exp.getMessage()%>
            <%}
        %>
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
