/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.DetailDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import modal.Img;
import modal.ProductJoin;
import modal.Shoe;

/**
 *
 * @author Dell
 */
public class productDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String shoeIdParam = request.getParameter("shoeid");
        String imgChose = request.getParameter("img");
        String color = request.getParameter("color");
        DetailDao dd = new DetailDao();
        Shoe shoe = null;
        ArrayList<ProductJoin> productJoin = null;
        ArrayList<Img> imgAll = null;
        ArrayList<Img> imgColor = null;
        Img imgMain = null;
        if (imgChose == null && color == null) {
            try {
                int shoeId = Integer.parseInt(shoeIdParam);
                shoe = dd.getShoeById(shoeId);

                imgColor = dd.getImgMain(shoeId);
                imgMain = dd.getImgByImg(shoe.getImage());
                productJoin = dd.getProductByShoeIdAndColor(shoeId, imgMain.getShoe_color_id());
                imgAll = dd.getImgByShoeIdAndColor(shoeId, imgMain.getShoe_color_id());
                request.setAttribute("shoe", shoe);
                request.setAttribute("imgMain", imgMain);
                request.setAttribute("imgColor", imgColor);
                request.setAttribute("productJoin", productJoin);
                request.setAttribute("imgAll", imgAll);
                request.getRequestDispatcher("view/productDetail.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                // Handle case where shoe ID parameter is not a valid integer
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid shoe ID parameter");
                return;
            }
        }
        if (imgChose != null) {
            int shoeId = Integer.parseInt(shoeIdParam);
            shoe = dd.getShoeById(shoeId);
            imgColor = dd.getImgMain(shoeId);
            imgMain = dd.getImgByImg(imgChose);
            productJoin = dd.getProductByShoeIdAndColor(shoeId, imgMain.getShoe_color_id());
            imgAll = dd.getImgByShoeIdAndColor(shoeId, imgMain.getShoe_color_id());
            request.setAttribute("shoe", shoe);
            request.setAttribute("imgMain", imgMain);
            request.setAttribute("imgColor", imgColor);
            request.setAttribute("productJoin", productJoin);
            request.setAttribute("imgAll", imgAll);
            request.getRequestDispatcher("view/productDetail.jsp").forward(request, response);
        }
        if (color != null) {
            int shoeId = Integer.parseInt(shoeIdParam);
            int colorId = Integer.parseInt(color);
            shoe = dd.getShoeById(shoeId);
            imgColor = dd.getImgMain(shoeId);
            productJoin = dd.getProductByShoeIdAndColor(shoeId, colorId);
            imgAll = dd.getImgByShoeIdAndColor(shoeId, colorId);
            imgMain = dd.getImgMainByShoeIdAndColor(shoeId, colorId);
            request.setAttribute("shoe", shoe);
            request.setAttribute("imgMain", imgMain);
            request.setAttribute("imgColor", imgColor);
            request.setAttribute("productJoin", productJoin);
            request.setAttribute("imgAll", imgAll);
            request.getRequestDispatcher("view/productDetail.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

}
