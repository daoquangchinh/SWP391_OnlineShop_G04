/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import modal.User;

/**
 *
 * @author ViQuan
 */
public class ChangePassServlet extends HttpServlet{
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
        if (!newPassword.equals("") && !confPassword.equals("") && newPassword.equals(confPassword)) {

            // Get the user's email from the session
            User u = (User) session.getAttribute("acc");
            String email = u.getEmail();

            // Attempt to update the user's password
            boolean success = userDAO.updatePassword(email, newPassword);

            if (success) {
                request.setAttribute("status", "Đã đổi mật khẩu thành công !");
            } else {
                request.setAttribute("status", "Đổi mật khẩu thất bại!");
                request.getRequestDispatcher("view/changePass.jsp").forward(request, response);
            }
        } else {
            // Passwords do not match
            request.setAttribute("status", "Mật khẩu không khớp!");
            request.getRequestDispatcher("view/changePass.jsp").forward(request, response);
        }
        request.getRequestDispatcher("view/profilePage.jsp").forward(request, response);
    }
    
}
