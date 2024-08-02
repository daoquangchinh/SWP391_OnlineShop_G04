/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dao.OrderDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import modal.OrderDetails;
import modal.OrderView;
import modal.User;

/**
 *
 * @author ViQuan
 */
public class OrderItemServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderItemServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderItemServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        // Lấy danh sách đơn hàng từ DAO
        OrderDAO orderDAO = new OrderDAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");
        List<OrderView> orders = orderDAO.getOrderViewByUserId(u.getId(), 0); // Thay 3 bằng ID người dùng thực tế
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("view/OrderItem.jsp").forward(request, response);

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
            throws ServletException, IOException {  // Lấy giá trị filter từ request
        String filterValue = request.getParameter("filter");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("acc");

        // Xử lý logic lấy dữ liệu dựa trên filterValue (ví dụ, lấy danh sách order mới từ DAO)
        OrderDAO orderDAO = new OrderDAO();
        List<OrderView> orders = new ArrayList<>();
        switch (filterValue) {
            case "All":
                orders = orderDAO.getOrderViewByUserId(u.getId(), 0);
                break;
            case "Order":
                orders = orderDAO.getOrderViewByUserId(u.getId(), 4);
                break;
            case "Delivery":
                orders = orderDAO.getOrderViewByUserId(u.getId(), 5);
                break;
            case "Receive":
                orders = orderDAO.getOrderViewByUserId(u.getId(), 6);
                break;
            case "Cancel_order":
                orders = orderDAO.getOrderViewByUserId(u.getId(), 7);
                break;
            case "Paid":
                orders = orderDAO.getOrderView(u.getId(), 8);
                break;
            case "Unpaid":
                orders = orderDAO.getOrderView(u.getId(), 9);
                break;
            default:
                orders = orderDAO.getOrderViewByUserId(u.getId(), 0);
                break;
        }

        // Chuyển tiếp dữ liệu mới đến OrderItem.jsp
        request.setAttribute("orders", orders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/orderContent.jsp");
        dispatcher.forward(request, response);
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
