<%-- 
    Document   : register
    Created on : 14 Aug, 2023, 1:04:21 PM
    Author     : Vasu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/Common_css_js.jsp" %>
        <script>
            <%@include file="Js/script.js" %>
        </script>

    </head>
    <body style="overflow: hidden">
        <%@include file="components/navBar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 offset-md-3 py-2 snowy-card" style="margin-top:100px;">
                    <%@include file="components/message.jsp" %>
                    <h1 class="text-center">Sign Up</h1>
                    <form action="RegisterServlet" method="post">
                        <div class="form-group md-1">
                            <label for="name" class="form-label ">User Name :</label>
                            <input type="text" name="user_name" id="name" class="form-control" placeholder="Enter your name here" required="true">
                        </div>
                        <div class="form-group md-1">
                            <label for="email" class="form-label ">User email :</label>
                            <input type="email" name="user_email" id="email" class="form-control" placeholder="Enter your email here" required="true">
                        </div>
                        <div class="form-group md-1">
                            <label for="password" class="form-label ">User Password :</label>
                            <input onkeyup="checkPassword()" type="password" name="user_password" id="password" class="form-control" placeholder="Enter your password here" required="true">
                        </div>
                        <div class="container text-center text-danger" id="message1"></div>
                        <div class="form-group md-1">
                            <label for="confirmPassword" class="form-label ">User confirm password :</label>
                            <input onkeyup="checkconfirmPassword()" type="password" name="user_confirmPassword" id="confirm_Password" class="form-control" placeholder="Confirm your password here" required="true">
                        </div>
                        <div class="container text-center text-danger" id="message2"></div>
                        <div class="form-group md-1">
                            <label for="phone" class="form-label ">User phone :</label>
                            <input onkeyup="checkPhoneNumber()" type="tel" name="user_phone" id="phone" class="form-control" placeholder="Enter your phone here" required="true">
                        </div>
                        <div class="container text-center text-danger" id="message3"></div>
                        <div class="form-group md-1">
                            <label for="address" class="form-label ">User address :</label>
                            <textarea name="user_address" class="form-control" placeholder="Enter your address here" required="true"></textarea>
                        </div>

                        <div class="container text-center mt-2">
                            <button type="submit" id="submit" class="btn btn-outline-success">Register</button>
                            <button type="reset" class="btn btn-outline-primary">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="circle c1"></div>
            <div class="circle c2"></div>
        </div>
    </body>
</html>
