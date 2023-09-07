<%@page import="com.mycompany.Helper.DescriptionShortenner"%>
<%@page import="Dto.CategoryDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.ProductDto"%>
<%@page import="Entities.Products"%>
<%@page import="Entities.Category"%>
<%@page import="com.mycompany.Helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Ecommerce Website</title>
        <%@include file="components/Common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navBar.jsp" %>
        <%                String catId = request.getParameter("category");
//                out.println(catId);
            ProductDto pDto = new ProductDto(FactoryProvider.getFactory());
            List<Products> plist = pDto.getAllProducts();
            if (catId != null) {
                if (catId.trim().equals("4")) {
                    plist = pDto.getAllProducts();
                } else {
                    int id = Integer.parseInt(catId);
                    plist = pDto.getAllProductsById(id);
                }
            }

            CategoryDto cDto = new CategoryDto(FactoryProvider.getFactory());
            List<Category> clist = cDto.getCategories();
        %>
        <div class="container-fluid" style="margin-top:90px;">
            <div class="row">
                <div class="col-2 px-1">
                    <div class="snowy-card">
                        <ol class="list-group list-group-horizontal-xxl">
                            <a href="index.jsp?catagory=4" class="list-group-item bottom-0 fw-bold text-center custom-nav text-light" aria-current="true">
                                All Categories
                            </a>
                            <%  int i = 1;
                                try {
                                    for (Category c : clist) {%>
                            <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item bg-transparent fw-bold text-center list-group-item-action"><%=i++%>&#44;<%=c.getCategoryTitle()%></a>
                            <%}
                                    if (plist.isEmpty()) {
//                                        out.print("NO Items");
                                        session.setAttribute("message", "sale kuch add kar pahale");
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }%> 
                        </ol>
                    </div>
                </div>
                <div class="col px-2">
                    <%@include file="components/errorMessage.jsp" %>
                    <!-- Product display area -->
                    <div class="row row-cols-1 row-cols-md-3 g-1" style="max-height: calc(100vh - 105px); overflow-y: auto;">
                        <!-- Add product cards here -->
                        <%try {
                                for (Products p : plist) {%>
                        <div class="col">
                            <div class="card product-card snowy-card" style="max-height: 500px; overflow: hidden;">
                                <div class="container text-center rounded-5 px-4 py-2 bg-light"> 
                                    <img src="Images/productsImg/<%= p.getProdectPhoto()%>" style="height: 250px; width: auto;" class="card-img-top img-fluid" alt="...">
                                </div>
                                <div class="card-body px-1 py-1 flex-fill">
                                    <h5 class="card-title"><%= DescriptionShortenner.minimiseDescription(p.getProdectname())%></h5>
                                    <p class="card-text text-truncate"><%= DescriptionShortenner.minimiseDescription(p.getProdectDescription())%></p>
                                </div>
                                <div class="d-flex justify-content-between align-items-center text-center px-3 prize-tag rounded-pill" style="    background-color:#051923!important;
                                     border-color: #000000!important;">
                                    <button onclick="addToCart(<%=p.getProductId()%>, '<%=DescriptionShortenner.minimiseDescription(p.getProdectname())%>',<%=p.pxAfterDiscount()%>)" class="btn px-3 text-light">Buy Now</button>
                                    <button  class="btn text-decoration-none text-light">&#8377;&nbsp;<%= p.pxAfterDiscount()%>/-<br/>&nbsp<span style="font-size: 13px!important;" class="text-secondary text-decoration-line-through fst-italic fs-6" >&#8377;<%=p.getProdectPrice()%></span>&nbsp;&nbsp;&nbsp<span style="font-size: 13px!important;" class="text-danger fst-italic fs-6" ><%=p.getProdectDiscount()%>&percnt;off</span></button>
                                </div>
                            </div>
                        </div>
                        <% }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }%>
                        <!-- Repeat for more product cards -->
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/common_modal.jsp" %>

    </body>
</html>
