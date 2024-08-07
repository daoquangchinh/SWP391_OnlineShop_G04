/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.DAO;
import dao.DetailDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import modal.Cart_Item;
import modal.Img;
import modal.ProductJoin;
import modal.Shoe;
import modal.User;

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int shoeId = Integer.parseInt(request.getParameter("shoeId"));
        int sizeId = Integer.parseInt(request.getParameter("sizeId"));
        int colorId = Integer.parseInt(request.getParameter("colorId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String err = "";

        DAO dao = new DAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");
        int productId = dao.findProduct(shoeId, colorId, sizeId);

        // Kiểm tra xem sản phẩm còn hàng hay không
        int availableQuantity = dao.getAvailableQuantity(productId);
        if (availableQuantity <= 0) {
            err = "Sản phẩm này đã hết hàng.";
            sendJsonResponse(response, err);
            return;
        }

        if (user == null) {
            // Xử lý giỏ hàng cho người dùng không đăng nhập
            List<Cart_Item> cart = (List<Cart_Item>) session.getAttribute("listCart");
            if (cart != null) {
                List<Cart_Item> updatedCart = new ArrayList<>();
                for (Cart_Item cartItem : cart) {
                    Cart_Item updatedCartItem = dao.setCartSession(dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize()), cartItem.getIdCartItem(), cartItem.getQuatityCart());
                    updatedCart.add(updatedCartItem);               
                }                
                cart = updatedCart;
                //session.setAttribute("listCart", cart);
            }
            boolean isNewProduct = true;

            if (cart == null) {
                cart = new ArrayList<>();
            }

            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            for (Cart_Item cartItem : cart) {
                if (dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize()) == productId) {
                    int newQuantity = cartItem.getQuatityCart() + quantity;
                    if (newQuantity > cartItem.getQuatityProduct()) {
                        newQuantity = cartItem.getQuatityProduct();
                        err = "Sản phẩm này trong giỏ hàng đã đạt tối đa";
                    } else {
                        err = "Sản phẩm này đã tồn tại và được thêm lại vào giỏ hàng.";
                    }
                    cartItem.setQuatityCart(newQuantity);
                    isNewProduct = false;
                    break;
                }
            }

            // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới vào giỏ hàng
            if (isNewProduct) {
                int cartid = cart.isEmpty() ? 1 : cart.get(cart.size() - 1).getIdCartItem() + 1;
                Cart_Item newCartItem = dao.setCartSession(productId, cartid, quantity);
                cart.add(newCartItem);
                err = "Sản phẩm đã được thêm vào giỏ hàng. ID: " + newCartItem.getIdCartItem();
            }

            // Cập nhật lại giỏ hàng trong session
            session.setAttribute("listCart", cart);
            session.setAttribute("quantityCartItem", cart.size());
            sendJsonResponse(response, err);
        } else {
            // Xử lý giỏ hàng cho người dùng đã đăng nhập
            Cart_Item cartitem = dao.CartItemByProductID(productId, user.getId());

            if (cartitem != null) {
                quantity = quantity + cartitem.getQuatityCart();
                if (quantity > cartitem.getQuatityProduct()) {
                    quantity = cartitem.getQuatityProduct();
                    err = "Sản phẩm này trong giỏ hàng đã đạt tối đa";
                } else {
                    err = "Sản phẩm đã được thêm vào giỏ hàng.";
                }
                dao.updateQuantity(cartitem.getIdCartItem(), quantity);
            } else {
                err = "Sản phẩm mới đã được thêm vào giỏ hàng.";
                dao.insertCartItem(user.getId(), productId, quantity);
            }

            // Cập nhật số lượng sản phẩm trong giỏ hàng của người dùng
            session.setAttribute("quantityCartItem", dao.getCart(user.getId()).size());
            sendJsonResponse(response, err);
        }
    }

    private void sendJsonResponse(HttpServletResponse response, String message) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("{\"strErr\": \"" + message + "\"}");
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        System.out.println(dao.findProductByStr(1, "White", 40));
    }
}
