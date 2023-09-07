/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Data.User;
import com.mycompany.Helper.EmailService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Vasu
 */
@WebServlet(name = "Otpsender", urlPatterns = {"/Otpsender"})
public class Otpsender extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("forgetPassword.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String to = request.getParameter("userEmail");
        User user = new User();
        user.setEmail(to);
        EmailService ems = new EmailService();
        if (ems.sendEmail(user)) {
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            session.setAttribute("message", "OTP send successfuly check your mail");
            response.sendRedirect("changePassword.jsp");
            
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message", "OTP send nahi hua he bhai");
            response.sendRedirect("forgetPassword.jsp");

        }
    }
}
