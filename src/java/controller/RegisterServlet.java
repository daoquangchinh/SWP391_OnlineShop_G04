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
import modal.user;

/**
 *
 * @author ViQuan
 */
public class RegisterServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String img = request.getParameter("img");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        user u = new user(0, email, password, fullname, gender, phone, email, img, 2, 0);
        DAO dao = new DAO();
        if (dao.getUserbyName(email)) {
            request.setAttribute("messEmail", "Email này đã tồn tại!!");
            if (dao.getUserbyPhone(phone)) {
                request.setAttribute("messPhone", "Số điện thoại đã tồn tại!!");
                request.setAttribute("empty", "Vui lòng nhập thông tin");
                request.setAttribute("u", u);
            }
            request.getRequestDispatcher("view/registerPage.jsp").forward(request, response);

        }
        dao.setUser(u);
        response.sendRedirect("view/loginPage.jsp");
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

    public static void main(String[] args) {
        DAO dao = new DAO();
        if (dao.getUserbyName("quanc@fpt") == true) {
            System.out.println("dfghj");
        }
        dao.setUser(new user(0, "quannc@fpt", "123", "quannguyenvi", "male", "123456789", "quagbhj", "vbhnj", 2, 1));
    }
}
