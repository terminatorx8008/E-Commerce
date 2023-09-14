<%
    session.removeAttribute("currentUser");
    session.invalidate();
    response.sendRedirect("login.jsp");
%>