/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
@WebServlet(name = "LoginChecker", urlPatterns = {"/LoginChecker"})
public class LoginChecker extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String userEmail = request.getParameter("userEmail");
        String password = request.getParameter("password");

        UserDto userDto = new UserDto(FactoryProvider.getFactory());
        User user = userDto.getUserByEmailAndPassword(userEmail, password);
//        System.out.println(user);
        HttpSession httpSession = request.getSession();
        if (user == null) {
//            out.print("<h1>INVALID EMAIL OR PASSWORD</h1>");
              httpSession.setAttribute("message","INVALID EMAIL OR PASSWORD PLEASE TRY AGAIN !!");
              response.sendRedirect("login.jsp");
              return;

        } else {
            out.print("<h1>WELCOME USER "+ user.getUserName() +" </h1>");
            httpSession.setAttribute("currentUser",user);
            if(user.getUserType().equals("admin")){
                response.sendRedirect("admin.jsp");                
            }else if(user.getUserType().equals("normal")){
                response.sendRedirect("normal.jsp");
            }
        }
    }
}
