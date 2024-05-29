/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author Dell
 */
public class newPasswordUpdate extends HttpServlet{
    private static final long serialVersionUID = 1L;



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        // Get the current session
        HttpSession session = request.getSession();

        // Retrieve the new password and confirm password from the request
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");

        // Check if new password and confirm password are not null and match
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            // Get the user's email from the session
            String email = (String) session.getAttribute("email");

            // Attempt to update the user's password
            boolean success = userDAO.updatePassword(email, newPassword);

            if (success) {
                request.setAttribute("status", "Đã đổi mật khẩu thành công !");
            } else {
                request.setAttribute("status", "Đổi mật khẩu thất bại!");
            }
        } else {
            // Passwords do not match
            request.setAttribute("status", "Mật khẩu không khớp!");
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
}
