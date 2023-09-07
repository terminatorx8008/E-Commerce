<%
    session.removeAttribute("currentUser");
    response.sendRedirect("login.jsp");
%>