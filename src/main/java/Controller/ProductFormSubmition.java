/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entities.Category;
import Entities.Products;
import Dto.CategoryDto;
import Dto.ProductDto;
import com.mycompany.Helper.FactoryProvider;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Vasu
 */
@WebServlet(name = "ProductFormSubmition", urlPatterns = {"/ProductFormSubmition"})
@MultipartConfig
public class ProductFormSubmition extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ha bhai me aagaya");
        PrintWriter out = response.getWriter();
        String operation = request.getParameter("operation");
        if (operation.trim().equals("addCategory")) {
            String categoryTitle = request.getParameter("category-title");
            String categoryDescription = request.getParameter("category-description");
            Category category = new Category(categoryTitle, categoryDescription);
            CategoryDto categoryDto = new CategoryDto(FactoryProvider.getFactory());
            int catId = categoryDto.saveCategory(category);
//            out.print("ha bhai ho gai save"+catId);
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Successfully Added The Category");
            response.sendRedirect("admin.jsp");
            return;
        } else if (operation.trim().equals("addProduct")) {
            String productTitle = request.getParameter("product-title");
            String productDesciption = request.getParameter("product-description");
            Part part = request.getPart("product-photo");
            int productPrize = Integer.parseInt(request.getParameter("product-prize"));
            int productDiscount = Integer.parseInt(request.getParameter("product-discount"));
            int productQuantity = Integer.parseInt(request.getParameter("product-quantity"));
            int categoryId = Integer.parseInt(request.getParameter("catId"));

            CategoryDto catDto = new CategoryDto(FactoryProvider.getFactory());
            Category category = catDto.getCategoryById(categoryId);

            Products product = new Products(productTitle, productDesciption, part.getSubmittedFileName(), productPrize, productDiscount, productQuantity, category);

            ProductDto pDto = new ProductDto(FactoryProvider.getFactory());
            pDto.savePraduct(product);

            if (part != null) {
                // Rest of your existing code for saving the image
                String path = request.getRealPath("Images") + File.separator + "productsImg" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                try (InputStream inputStream = part.getInputStream()) {
                    BufferedImage image = ImageIO.read(inputStream);

                    File outputFile = new File(path);
                    ImageIO.write(image, "jpg", outputFile);

                    System.out.println("Image saved successfully.");
                } catch (IOException e) {
                    e.printStackTrace();
                }

            } else {
                // Handle the case where no file was uploaded
                System.out.println("No file uploaded");
                // You can also set an error message in the session and redirect to an error page
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("errorMessage", "No file uploaded");
                response.sendRedirect("error.jsp");
            }

            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Successfully Added The Product");
            response.sendRedirect("admin.jsp");
        }
    }
}
