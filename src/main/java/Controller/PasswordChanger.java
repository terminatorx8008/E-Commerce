/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Dto.OtpData;
import Dto.UserDto;
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

/**
 *
 * @author Vasu
 */
@WebServlet(name = "PasswordChanger", urlPatterns = {"/PasswordChanger"})
public class PasswordChanger extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String confirmPassword = request.getParameter("confirm_Password");
        OtpData otpdata = (OtpData) session.getAttribute("user1");
        String email = otpdata.getEmail();
        
        UserDto userDto = new UserDto(FactoryProvider.getFactory());
        if (userDto.changePassword(email, confirmPassword)) {
            session.setAttribute("message", "Password Reset Successfully Login Now");
            response.sendRedirect("login.jsp");
            return;
        }else{
            session.setAttribute("message", "Error");
            response.sendRedirect("changePassword.jsp");
            return;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp); //To change body of generated methods, choose Tools | Templates.
    }

}
