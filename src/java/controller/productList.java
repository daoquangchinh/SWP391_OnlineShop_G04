/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import DAO.ShoeDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import modal.Shoe;

/**
 *
 * @author Dell
 */
public class productList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchText = request.getParameter("query");
        ShoeDAO pd = new ShoeDAO();
        if (searchText == null) {
            ArrayList<Shoe> list_menu = null;
            list_menu = pd.getAllShoes();
            request.setAttribute("MenuChose", list_menu);
            request.getRequestDispatcher("view/productList.jsp").forward(request, response);
            return;
        }
        ArrayList<Shoe> list_search = null;
        try {
            list_search = pd.searchShoeByName(searchText);
            request.setAttribute("MenuChose", list_search);
            request.getRequestDispatcher("view/productList.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the exception or provide feedback to the user
            e.printStackTrace(); // Logging the exception to the console
            request.setAttribute("errorMessage", "Error retrieving shoe data."); // Set an error message attribute
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                    request.getRequestDispatcher("view/productList.jsp").forward(request, response);
    }

}
