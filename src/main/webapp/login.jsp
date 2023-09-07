<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <%@include file="components/Common_css_js.jsp" %>
    </head>

    <body style="overflow:hidden ">
        <%@include file="components/navBar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 offset-md-4 snowy-card" style="margin-top:150px">
                        <header class="signup-header">
                            <h1 class="text-center">Sign In</h1>
                        </header>
                        <main class="signup-body">
                            <%@include file="components/errorMessage.jsp" %>
                            <form action="LoginChecker" method="post">
                                <p>
                                    <label for="Email">Email</label>
                                    <input type="email" id="Email" name="userEmail" placeholder="Enter Email here" required>
                                </p>
                                <p>
                                    <label for="password">Password:</label>
                                    <input onkeyup="checkPassword()" type="password" id="password" name="password" placeholder="Enter password here" required>
                                </p>
                                <div class="container text-center text-danger" id="message1"></div>
                                <p>
                                    <input id="submit" type="submit" value="Login">
                                </p>
                            </form>
                        </main>
                        <footer class="signup-footer">
                            <p><a href="forgetPassword.jsp">Forgot Passwsord ??</a></p>
                        </footer>
                </div>
            </div>
        </div>
    </body>
</html>