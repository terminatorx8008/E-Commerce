<%-- 
    Document   : index
    Created on : 13 Aug, 2023, 4:12:58 PM
    Author     : Vasu
--%>

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
    <body style="overflow: auto" >
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

        <div class="row mt-5 mx-auto px-0 py-2">
            <div class="col-md-2 px-0">
                <div class="list-group">
                    <div class="snowy-card">
                        <a href="index.jsp?catagory=4" class="list-group-item fw-bold text-center list-group-item-action px-4 custom-card  active" aria-current="true">
                            All Categories
                        </a>
                        <%  int i = 1;
                            try {
                                for (Category c : clist) {%>
                        <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item bg-transparent fw-bold text-center list-group-item-action" style="background-color: #979DAC ; border-color: #000000 "><%=i++%>&#44;<%=c.getCategoryTitle()%></a>
                        <%}
                                if (plist.isEmpty()) {
                                    out.print("NO Iteams");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }%> 
                    </div>
                </div>
            </div>
            <div class="col-md-10 " data-bs-spy="scroll">
                <div class="row row-cols-3 row-cols-md-4 g-4">
                    <%try {
                            for (Products p : plist) {%>
                    <div class="col">
                        <div class="card product-card snowy-card d-flex flex-column h-100" style="max-height: 500px; overflow: hidden;">
                            <div class="container text-center rounded-5 px-4 py-2 bg-light"> 
                                <img src="Images/productsImg/<%= p.getProdectPhoto()%>" style="height: 250px; width: auto;" class="card-img-top img-fluid" alt="...">
                            </div>
                            <div class="card-body px-1 py-1 flex-fill">
                                <h5 class="card-title"><%= DescriptionShortenner.minimiseDescription(p.getProdectname())%></h5>
                                <p class="card-text text-truncate"><%= DescriptionShortenner.minimiseDescription(p.getProdectDescription())%></p>
                            </div>
                            <div class="d-flex justify-content-between align-items-center text-center custom-card px-3 prize-tag rounded-pill">
                                <button onclick="addToCart(<%=p.getProductId()%>, '<%=DescriptionShortenner.minimiseDescription(p.getProdectname())%>',<%=p.pxAfterDiscount()%>)" class="btn px-3 text-light">Buy Now</button>
                                <button  class="btn text-decoration-none text-light">&#8377;&nbsp;<%= p.pxAfterDiscount()%>/-<br/>&nbsp<span style="font-size: 13px!important;" class="text-secondary text-decoration-line-through fst-italic fs-6" >&#8377;<%=p.getProdectPrice()%></span>&nbsp;&nbsp;&nbsp<span style="font-size: 13px!important;" class="text-danger fst-italic fs-6" ><%=p.getProdectDiscount()%>&percnt;off</span></button>
                            </div>
                        </div>
                    </div>
                    <% }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }%>
                </div>

            </div>

            <%@include file="components/common_modal.jsp" %>
    </body>
</html>
