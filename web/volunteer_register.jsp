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
        </style>
        <script>
        </script>
    </head>
    <body onload="gainfocus()">
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="./index.jsp">Home</a>
            <a href="./coordinator_module/login_verifications/coordinator_login.jsp">Coordinator Login</a>
            <a href="./committee_module/login_verifications/committee_login.jsp">Committee Login</a>
            <a href="#">Contact</a>
            <a href="./about_page/index.html">About</a>
        </div>

        <div id="main" class="w3-container w3-black">
            <span style="font-size:30px;cursor:pointer;font-family: Calibri" onclick="openNav()">&#9776;|<b>Amrita</b> Events</span>
            <div class="w3-card w3-white w3-padding-32" style="margin-top: 5%; height: 100%; ">
                <center>
                <div class="w3-container" style="width: 50%">
                    <form method="post" action="submit_request.jsp">
                        <label for="">Event Name</label>
                        <input type="text" placeholder="Enter Name" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center"/>
                        <br>
                        <label for="">Student ID</label>
                        <input type="text" placeholder="Enter Name" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center"/>
                        <br>
                        <label for="">Student Password</label>
                        <input type="password" placeholder="Enter Password" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center"/>
                        <br>
                        <label for="">Volunteer Area</label><br>
                        <input list="volarea">
                        <datalist id="volarea">
                            <option value="regsitration">
                            <option value="travel">
                            <option value="accomodation">
                            <option value="finance">
                            <option value="food">
                        </datalist>
                        <br>
                        <input type="submit" value="Submit" class="w3-button" id="sub"/>
                    </form>
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
