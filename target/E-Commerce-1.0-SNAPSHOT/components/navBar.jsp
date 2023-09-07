<%@page import="Entities.User"%>
<%
    User current_User = (User) session.getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg z-3 mt-2 md-3 px-5 fixed-top rounded-5 mx-auto navbar-dark custom-nav  opacity-80 " style="width: 80%">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">E-Com</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Category
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <%if (current_User == null) {%>
        <div class="navbar-text">
            <button class="btn btn-outline-info me-2" type="button" onclick="window.location.href = 'login.jsp';">Login</button>
            <button class="btn btn-outline-primary me-2" type="button"onclick="window.location.href = 'register.jsp';">Register</button>
        </div>
        <%}else{%>
            <a class="navbar-brand" href="#" data-bs-toggle="modal" data-bs-target="#cart">
                <div class="image-container me-2">
                <img src="Images/logos/bag.png" width="35" height="35"class=" d-inline-block align-text-top">
                <span class="red-dot cart-item fs-6">0</span>
                </div>
            </a>
        <span class="navbar-text">
            <button class="btn btn-outline-info me-2" type="button"onclick="window.location.href = '<%= current_User.getUserType().equals("admin")? "admin.jsp": "normal.jsp" %>';"><%=current_User.getUserName()%></button>
            <button class="btn btn-outline-danger me-2" type="button"onclick="window.location.href = 'logout.jsp';">Logout</button>
        </span>
        <%

            }
        %>
    </div>
</nav>