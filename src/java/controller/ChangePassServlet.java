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
import modal.MaHoa;
import modal.User;

/**
 *
 * @author ViQuan
 */
public class ChangePassServlet extends HttpServlet {
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/changePass.jsp").forward(request, response);
    }

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        MaHoa ma =new MaHoa();
        // Get the current session
        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("acc");

        // Retrieve the new password and confirm password from the request
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        boolean check = false;

        if (!newPassword.matches("^(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{8,}$")) {
            request.setAttribute("status", "Password must be at least 8 characters long and contain at least one special character.");

            check = true;
        }

        if (!newPassword.equals(confPassword)) {
            request.setAttribute("status", "Passwords do not match.");
            check = true;
        }
        if (check) {
            request.setAttribute("confPassword", confPassword);
            request.setAttribute("password", newPassword);
            request.getRequestDispatcher("view/changePass.jsp").forward(request, response);
            return;
        }

        // Check if new password and confirm password are not null and match
        newPassword= ma.toSHA1(newPassword);
        userDAO.updatePassword(u.getEmail(), newPassword);
        request.getRequestDispatcher("view/profilePage.jsp").forward(request, response);
    }

}
