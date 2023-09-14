<%-- 
    Document   : changePassword
    Created on : 24 Aug, 2023, 12:50:31 PM
    Author     : Vasu
--%>
<%@page import="Dto.OtpData"%>
<%
    OtpData user = (OtpData) session.getAttribute("user1");
    if (user == null) {
        session.setAttribute("message", "First verify your email");
        response.sendRedirect("forgetPassword.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <%@include file="components/Common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navBar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 offset-md-4 snowy-card" style="margin-top:150px">
                        <header class="signup-header">
                            <h1 class="text-center">Change Password</h1>
                        </header>
                        <main class="signup-body">
                            <%@include file="components/errorMessage.jsp" %>
                            <form action="PasswordChanger" method="post">
                                <p>
                                    <label for="Password">Password</label>
                                    <input onkeyup="checkPassword()" type="password" id="password" name="userEmail" placeholder="Enter Password here" required>
                                </p>
                                <p>
                                    <label for="password">Confirm Password:</label>
                                    <input onkeyup="checkconfirmPassword()"  type="password" id="confirm_Password" name="confirm_Password" placeholder="Confirm password here" required>
                                </p>
                                <div class="container text-center text-danger" id="message2"></div>
                                <div class="container text-center text-danger" id="message1"></div>
                                <p>
                                    <input id="submit" type="submit" value="Submit">
                                </p>
                            </form>
                        </main>
                </div>
            </div>
        </div>
    </body>
</html>
