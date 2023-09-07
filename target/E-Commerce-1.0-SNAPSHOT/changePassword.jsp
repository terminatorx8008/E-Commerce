<%-- 
    Document   : changePassword
    Created on : 24 Aug, 2023, 12:50:31 PM
    Author     : Vasu
--%>
<%@page import="Data.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        session.setAttribute("message", "First verify your email");
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
