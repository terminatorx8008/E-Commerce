<%-- 
    Document   : checkout
    Created on : 20 Aug, 2023, 7:20:43 PM
    Author     : Vasu
--%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        session.setAttribute("message", "YOU HAVE NOT LOGGED IN LOGIN FIRST!!");
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
        <%@include file="components/Common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navBar.jsp" %>
        <div class="row me-5 ms-5 " >
            <div class="col-md-6"style="margin-top: 120px">
                <div class="card">
                    <div class="card-body snowy-card bg-light overflow-auto" style="max-height:550px; height: 450px">
                        <h3 class="text-center mb-3">YOUR SELECTED ITEMS</h3>
                        <div class="cart-body"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6"style="margin-top: 120px">
                <div class="card">
                    <div class="card-body snowy-card overflow-auto" style="max-height:550px;height: 450px">
                        <form class="">
                            <h3 class="text-center">Delivery Details</h3>
                            <div class="mb-2">
                                <label for="exampleInputEmail1" class="form-label">Email address</label>
                                <input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                            </div>
                            <div class="mb-2">
                                <label for="exampleInputPassword1" class="form-label">User Name</label>
                                <input value="<%=user.getUserName()%>" type="text" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="mb-2">
                                <label for="exampleInputPassword1" class="form-label">Contact Number</label>
                                <input value="<%=user.getUserPhone()%>" type="text" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="mb-2">
                                <label for="exampleInputPassword1" class="form-label">Delivery Address</label>
                                <textarea  class="form-control" id="exampleInputPassword1"><%=user.getUserAddress()%></textarea>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modal.jsp" %>
    </body>
</html>
