<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
//        out.print(message);
%>

<div class="alert text-center alert-danger alert-dismissible fade show" role="alert">
    <strong><%=message%></strong>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
        session.removeAttribute("message");
    }
%>