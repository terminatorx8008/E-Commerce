<%-- 
    Document   : admin
    Created on : 15 Aug, 2023, 6:49:05 PM
    Author     : Vasu
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Category"%>
<%@page import="com.mycompany.Helper.FactoryProvider"%>
<%@page import="com.mycompany.Helper.DescriptionShortenner"%>
<%@page import="Dto.CategoryDto"%>
<%@page import="Entities.User"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        session.setAttribute("message", "YOU HAVE NOT LOGGED IN LOGIN FIRST!!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (!user.getUserType().equals("admin")) {
            session.setAttribute("message", "YOU DO NOT HAVE THE ACCESS OF THIS PAGE!!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>  
<%  
    CategoryDto catdto = new CategoryDto(FactoryProvider.getFactory());
    List<Category> list = catdto.getCategories();
    Map<String,Long> map =DescriptionShortenner.getCount(FactoryProvider.getFactory());
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


        <div class ="container cardContainer" style="border: #000000">
            <div class="container-fluid" >
            </div>
            <!--first row-->
            <div class="row mt-4">
                <!--first col-->
                <div style="margin-top: 80px;">  
                    <%@include file="components/message.jsp" %>
                </div>
                <div class="col-md-4 md-2">
                    <div class="card">
                        <div class="card-body text-center  snowy-card text-muted text-uppercase">
                            <div class="container">
                                <img style="max-width: 150px;max-height: 150px" class="img-fluid px-3 " src="Images\logos\group.png" alt="Imnage Not Found"/>
                            </div>
                            <h1><%=map.get("userCount") %></h1>
                            <h1>USERS</h1>
                        </div>
                    </div>
                </div>
                <!--second col-->
                <div class="col-md-4 md-2">
                    <div class="card">
                        <div class="card-body text-center snowy-card text-muted text-uppercase">
                            <img style="max-width: 150px;max-height: 150px" class="img-fluid px-3 " src="Images\logos\products.png" alt="Imnage Not Found"/>
                            <h1><%=map.get("productCount") %></h1>
                            <h1>PRODUCTS</h1>
                        </div>
                    </div>                    
                </div>
                <!--third col-->
                <div class="col-md-4 md-2">
                    <div class="card">
                        <div class="card-body text-center text-muted snowy-card text-uppercase">     
                            <img style="max-width: 150px;max-height: 150px" class="img-fluid px-3 " src="Images\logos\categories.png" alt="Imnage Not Found"/>
                            <h1><%=list.size()%></h1>
                            <h1>CATEGORIES</h1>
                        </div>
                    </div>                    
                </div>
            </div>

            <!--end of first row-->
            <!--second row-->

            <div class="row mt-3">              
                <div class="col-md-6">
                    <div class="card">
                        <div data-bs-toggle="modal" data-bs-target="#categories-modal" class="card-body text-center text-muted snowy-card text-uppercase">     
                            <img style="max-width: 150px;max-height: 150px" class="img-fluid px-3 " src="Images\logos\innovation.png" alt="Imnage Not Found"/>
                            <h1></h1>
                            <h1>ADD CATEGORIES</h1>
                        </div>
                    </div>  
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div data-bs-toggle="modal" data-bs-target="#product-modal" class="card-body text-center text-muted snowy-card text-uppercase">     
                            <img style="max-width: 150px;max-height: 150px" class="img-fluid px-3 " src="Images\logos\add-package.png" alt="Imnage Not Found"/>
                            <h1></h1>
                            <h1>ADD PRODUCT</h1>
                        </div>
                    </div>  
                </div>
            </div>

            <!--end of second row-->
        </div>

        <!--categories modal start-->
        <div class="modal fade" id="categories-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-nav text-light">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Categories Details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductFormSubmition" method="post">
                            <input type="hidden" value="addCategory" name="operation"/>
                            <div class="form-group mt-2 md-2">
                                <label>Enter the title here : </label>
                                <input type="text" class="mt-2 form-control" name="category-title" placeholder="Enter the title of category" required="true"/>
                            </div>
                            <div class="form-group mt-2 md-2">
                                <label>Enter the description here : </label>
                                <textarea type="text" class=" mt-2 form-control" name="category-description" placeholder="Enter the description of category" required="true"></textarea>
                            </div>
                            <div class="container mt-3 md-0 text-center">
                                <button class="btn btn-success">Submit</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                            <br/>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--categories modal end-->

        <!--product modal start-->

        <div class="modal fade" id="product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-nav text-light">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Product Details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductFormSubmition" method="post" enctype="multipart/form-data">
                            <input type="hidden" value="addProduct" name="operation"/>
                            <div class="form-group mt-1 md-2">
                                <label>Enter name of product here : </label>
                                <input type="text" class="form-control" name="product-title" placeholder="Enter the name of product" required="true"/>
                            </div>
                            <div class="form-group mt-2 md-2">
                                <label>Enter the product description here : </label>
                                <textarea type="text" class="form-control" name="product-description" placeholder="Enter the description of product" required="true"></textarea>
                            </div>
                            <div class="form-group mt-2 md-2">
                                <label>Upload the product photo here : </label><br/>
                                <input type="file" class="form-control" name="product-photo"  required="true"></textarea>
                            </div>
                            <div class="form-group mt-2 md-2">
                                <label>Enter the prize of product here : </label>
                                <input type="number" class="form-control" name="product-prize" placeholder="Enter the prize of product" required="true"/>
                            </div>
                            <div class="form-group mt-2 md-2">
                                <label>Enter the discount on the product here : </label>
                                <input type="number" class="form-control" name="product-discount" placeholder="Enter the discount on the product" required="true"/>
                            </div>
                            <div class="form-group mt-2 md-2">
                                <label>Enter the quantity of product here : </label>
                                <input type="number" class="form-control" name="product-quantity" placeholder="Enter the quantity of product" required="true"/>
                            </div>

                            <div class="form-group mt-2 md-2">
                                <label>Select the category of product here : </label>
                                <select name="catId" class="form-control">
                                    <%for (Category c : list) {%>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class=" mt-2 container text-center">
                                <button class="btn btn-success" data-bs-dismiss="modal">Submit</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                            <br/>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!--product modal end-->
        <%@include file="components/common_modal.jsp" %>
    </body>
</html>
