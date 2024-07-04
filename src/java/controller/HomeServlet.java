/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAO;
import dao.ShoeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import modal.Cart_Item;
import modal.Shoe;
import modal.User;

/**
 *
 * @author DELL
 */
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ShoeDAO shoeDAO = new ShoeDAO();
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        User user = (User) session.getAttribute("acc");
        List<Cart_Item> cartItems = new ArrayList<>();
        if (user != null) {
            session.setAttribute("quantityCartItem", dao.getCart(user.getId()).size());
        } else {
            cartItems = (List<Cart_Item>) session.getAttribute("listCart");
            int quantityCartItem = (cartItems != null) ? cartItems.size() : 0;
            session.setAttribute("quantityCartItem", quantityCartItem);
        }

        ArrayList<Shoe> listShoes = shoeDAO.getAllShoes();
        request.setAttribute("listShoes", listShoes);

        request.getRequestDispatcher("view/homePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
