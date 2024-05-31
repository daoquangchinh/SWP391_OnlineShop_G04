/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modal.User;

/**
 *
 * @author ViQuan
 */
public class EdProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");

        String fullname = request.getParameter("fullname");
        String email = u.getEmail();
        String phone = request.getParameter("phone");
        String img = request.getParameter("img");
        String password = u.getPassword();
        String gender = request.getParameter("gender");
        if (phone.equals(u.getPhone()) == false) {
            if (dao.getUserbyPhone(phone)) {
                request.setAttribute("phone", phone);
                request.setAttribute("messPhone", "Số điện thoại đã tồn tại!!");
                request.setAttribute("empty", "Vui lòng nhập thông tin");
               request.getRequestDispatcher("view/editProfile.jsp").forward(request, response);
            }
            else{
                u = new User(0, email, password, fullname, gender, phone, email, img, 2, 0);
                session.setAttribute("acc", u);
                dao.updateUser(u);
                response.sendRedirect("view/homePage.jsp");
            }

        }else{
             u = new User(0, email, password, fullname, gender, phone, email, img, 2, 0);
                dao.updateUser(u);
                session.setAttribute("acc", u);
                response.sendRedirect("view/profilePage.jsp");
            
        }
        

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
