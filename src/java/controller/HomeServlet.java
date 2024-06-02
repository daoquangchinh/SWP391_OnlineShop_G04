/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.BrandDAO;
import DAO.ShoeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import modal.Brand;
import modal.Shoe;

/**
 *
 * @author DELL
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/Home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BrandDAO brandDAO = new BrandDAO();
        ShoeDAO shoeDAO = new ShoeDAO();

        int brandId = 0;

        if (request.getParameter("BrandId") != null) {
            try {
                brandId = Integer.parseInt(request.getParameter("brandId"));
                if (brandId < 0) {
                    brandId = 0;
                }
            } catch (Exception e) {
            }
        }

        ArrayList<Brand> listBrands = brandDAO.getBrands();
        ArrayList<Shoe> listShoes = shoeDAO.getShoes(brandId);

        request.setAttribute("listBrands", listBrands);
        request.setAttribute("listShoes", listShoes);

        request.getRequestDispatcher("view/homePage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
