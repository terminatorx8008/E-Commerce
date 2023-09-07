<%-- 
    Document   : forgetPassword
    Created on : 23 Aug, 2023, 12:48:41 PM
    Author     : Vasu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/Common_css_js.jsp" %>
    </head>

    <body>
        <%@include file="components/navBar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 offset-md-4 snowy-card" style="margin-top:150px">
                    <header class="signup-header">
                        <h1 class="text-center">Forgot Password</h1>
                    </header>
                    <main class="signup-body">
                        <%@include file="components/message.jsp" %>
                        <form  id="email-form" action="Otpsender" method="post">
                            <p>
                                <label for="Email">Email</label>
                                <input type="email" id="Email" name="userEmail" placeholder="Enter Email here" required>
                            </p>                          
                            <p>
                                <input id="otp" type="submit" value="Generate OTP">
                            </p> 
                        </form>
                        <form id="otp-form" action="otpChecker" method="post">
                            <p>
                                <label for="otp">OTP</label>
                                <input type="number" id="otp" name="userotp" placeholder="Enter Otp here" required>
                            </p>                          
                            <p>
                                <input id="otp" type="submit" value="Submit">
                            </p> 
                        </form>
                    </main>
                </div>
            </div>
        </div>
    </body>
</html>
