<%-- 
    Document   : addEvents
    Created on : Sep 20, 2017, 12:59:48 PM
    Author     : haris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hello</title>
    </head>
    <body>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="../../index.jsp">Home</a>
            <a href="./coordinator_module/login_verifications/coordinator_login.jsp">Coordinator Login</a>
            <a href="../../committee_module/login_verifications/committee_login.jsp">Committee Login</a>
            <a href="#">Contact</a>
            <a href="#">About</a>
        </div>

        <div id="main" class="w3-container w3-black">
            <span style="font-size:30px;cursor:pointer;font-family: Calibri" onclick="openNav()">&#9776; Amrita <b>Events</b>|Coordinator Login</span>
            <div class="w3-card w3-white w3-padding-32" style="margin-top: 10%; height: 100%; ">
                <center>
                <div class="w3-container" style="width: 50%">
                    <form method="post" action="login_verify.jsp">
                        <label for="">Event ID</label>
                        <input type="text" placeholder="Enter Staff ID" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="staff_id"/><br>
                        <label for="">Event Name</label>
                        <input type="password" placeholder="Enter Password" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="staff_psd"/>
                        <br>
                        <label for="">Event Tag-line (Optional)</label>
                        <input type="password" placeholder="Enter Password" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="staff_psd"/>
                        <br>
                        <label for="">Event Location</label>
                        <input type="password" placeholder="Enter Password" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="staff_psd"/>
                        <br>
                        <label for="">Event Timestamp</label>
                        <input type="password" placeholder="Enter Password" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="staff_psd"/>
                        <br>
                        <label for="">Event Description</label>
                        <input type="password" placeholder="Enter Password" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="staff_psd"/>
                        <br>
                        <label for="">Event Name</label>
                        <input type="password" placeholder="Enter Password" style="width: 50%" class="w3-input w3-animate-input w3-hover-gray w3-center" name="staff_psd"/>
                        <br>
                        <input type="submit" value="Login" class="w3-button"/>
                    </form>
                </div>
                </center>
            </div>
            <div class="w3-card w3-black w3-padding-32 w3-center" style="margin-top: 10%">
                <p class="w3-text-white">Copyright &copy T3</p>
            </div>
        </div>
    </body>
</html>
