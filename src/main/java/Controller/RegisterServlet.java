/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entities.User;
import com.mycompany.Helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Vasu
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String user_name = request.getParameter("user_name");
        String user_email = request.getParameter("user_email");
        String user_password = request.getParameter("user_password");
        String user_confirmPassword= request.getParameter("user_confirmPassword");
        String user_phone = request.getParameter("user_phone");
        String user_address = request.getParameter("user_address");
        User user = new User(user_name, user_email, user_password, user_phone, "default.jpg", user_address,"normal");
        Session hibernateSession = FactoryProvider.getFactory().openSession();
        Transaction tx = hibernateSession.beginTransaction();
        int user_Id = (int) hibernateSession.save(user);
//        out.print("Saved Successfully");
//        out.print("<br/>");
//        out.print("your user id is"+"<br/>"+user_Id);
        HttpSession httpsession = request.getSession();
        httpsession.setAttribute("message","Registration Sucessfull !! Login Now "+user_Id);
        response.sendRedirect("register.jsp");
        tx.commit();
        hibernateSession.close();
    }

}
