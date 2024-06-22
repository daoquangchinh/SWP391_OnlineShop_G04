/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import modal.MaHoa;

/**
 *
 * @author ViQuan
 */
public class NewPasswordUpdateServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        MaHoa ma = new MaHoa();
        // Get the current session
        HttpSession session = request.getSession();

        // Retrieve the new password and confirm password from the request
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");

        // Check if new password and confirm password are not null and match
        if (!newPassword.equals("") && !confPassword.equals("") && newPassword.equals(confPassword)) {

            // Get the user's email from the session
            String email = (String) session.getAttribute("email");

            // Attempt to update the user's password
            newPassword= ma.toSHA1(newPassword);
            boolean success = userDAO.updatePassword(email, newPassword);

            if (success) {
                request.setAttribute("status", "Password changed successfully !");
                
            } else {
                request.setAttribute("status", "Password change failed!");
                request.getRequestDispatcher("view/newPassword.jsp").forward(request, response);
            }
        } else {
            // Passwords do not match
            request.setAttribute("status", "password incorrect!");
            request.getRequestDispatcher("view/newPassword.jsp").forward(request, response);
        }
        request.getRequestDispatcher("view/homePage.jsp").forward(request, response);
    }
    
}
