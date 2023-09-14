package Controller;

import Dto.OtpData;
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
@WebServlet(name = "otpChecker", urlPatterns = {"/otpChecker"})

public class otpChecker extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String otp = request.getParameter("userotp");
        HttpSession session = request.getSession();
        OtpData user = (OtpData) session.getAttribute("user1");
        if (otp.equals(user.getOtp())) {
            response.sendRedirect("changePassword.jsp");
        }
    }
}
