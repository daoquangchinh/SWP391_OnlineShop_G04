/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import modal.MaHoa;

/**
 *
 * @author Dell
 */
public class ValidatePasswordServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = request.getParameter("passValue");
        MaHoa ma = new MaHoa();
        
        // Get the current session
        HttpSession mysession = request.getSession();
        String newPass = (String) mysession.getAttribute("passGen");
//        newPass = ma.toSHA1(newPass);
        value = ma.toSHA1(value);
        RequestDispatcher dispatcher = null;
        
        // Check if user enter new password correct
        if (value.equals(newPass) ) {

            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("status", "success");
            dispatcher = request.getRequestDispatcher("view/newPassword.jsp");
            dispatcher.forward(request, response);

        } else {
            request.setAttribute("message", "wrong password");

            dispatcher = request.getRequestDispatcher("view/EnterNewPassword.jsp");
            dispatcher.forward(request, response);

        }

    }
}
