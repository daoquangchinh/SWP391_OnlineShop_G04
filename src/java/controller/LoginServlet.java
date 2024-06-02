/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modal.User;

/**
 *
 * @author ViQuan
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         request.getRequestDispatcher("view/loginPage.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        DAO dao = new DAO();
        User u = dao.getlogin(name, pass);
        if (u.getUsername() == null) {
            request.setAttribute("mess", "Vui long kiểm tra lại thông tin.");
            
            request.getRequestDispatcher("view/loginPage.jsp").forward(request, response);
        }  else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", u);
            session.setMaxInactiveInterval(1000);
            response.sendRedirect("Home");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
public static void main(String[] args) {
        DAO dao=new DAO();
        User u = dao.getlogin("quan@fpt.edu", "123");
        
        
        System.out.println(u.toString());
    }
}
