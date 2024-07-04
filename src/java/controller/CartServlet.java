package controller;

import dao.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import modal.Cart_Item;
import modal.User;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        User user = (User) session.getAttribute("acc");
        List<Cart_Item> cartItems = new ArrayList<>();
        if (user != null) {
            int userId = user.getId();
            cartItems = dao.getCart(userId);
            session.setAttribute("quantityCartItem", dao.getCart(user.getId()).size());
        } else {
            // If user is not logged in, you might want to redirect to a login page or handle it differently
            // For testing purposes, default to user ID 1
            //cartItems = (List<Cart_Item>) session.getAttribute("cart");
            cartItems = (List<Cart_Item>) session.getAttribute("listCart");
            int quantityCartItem = (cartItems != null) ? cartItems.size() : 0;
            session.setAttribute("quantityCartItem", quantityCartItem);
        }

        request.setAttribute("mess", "quan");
        request.setAttribute("cart_item", cartItems);
        System.out.println(session.getAttribute("quantityCartItem"));
        request.getRequestDispatcher("view/cartPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
        DAO dao = new DAO();
        Cart_Item ci = dao.getCartItem(cartItemId);
        HttpSession session = request.getSession();
        List<Cart_Item> cartItems = new ArrayList<>();
        cartItems = (List<Cart_Item>) session.getAttribute("listCart");
        User user = (User) session.getAttribute("acc");
        boolean checklogin = true;
        if (user == null) {
            checklogin = false;
            for (Cart_Item cartItem : cartItems) {
                if (cartItemId == cartItem.getIdCartItem()) {
                    ci = cartItem;
                }
            }
        }

        if ("fetchQuantity".equals(action)) {
            String strquantity = request.getParameter("quantity");
            int quantity;
            PrintWriter out = response.getWriter();

            if (strquantity == null || strquantity.isEmpty()) {
                quantity = ci.getQuatityCart();
            } else {
                quantity = Integer.parseInt(strquantity);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            String strErr = "";
            if (quantity > ci.getQuatityProduct()) {
                ci.setQuatityCart(ci.getQuatityProduct());
                strErr = "Unfortunately, you can only purchase a maximum of " + ci.getQuatityProduct() + " products"+ci.getShoe_name()+".";
            } else {
                ci.setQuatityCart(quantity);
            }

            // Create a JSON response
            out.println("{ \"strErr\": \"" + strErr + "\", \"quantity\": " + ci.getQuatityCart() + " }");
            out.close();
        } else if ("updateQuantity".equals(action)) {
            // Handle update quantity request
            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            quantity=1;
            String strErr = "";
            if (quantity > ci.getQuatityProduct()) {
                quantity = ci.getQuatityProduct();
                strErr = "Unfortunately, you can only purchase a maximum of " + ci.getQuatityProduct() + " products.";
            }
            if (checklogin == true) {
                dao.updateQuantity(cartItemId, quantity);
            } else {
                for (Cart_Item cartItem : cartItems) {
                    if (cartItemId == cartItem.getIdCartItem()) {
                        cartItem.setQuatityCart(quantity);
                    }
                }
                session.setAttribute("listCart", cartItems);

            }

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{ \"price\": " + ci.getPrice() + ", ");
            out.print("\"quantity\": " + quantity + ", ");
            out.print("\"strErr\": \"" + strErr + "\" }");
            out.close();
        } else if ("deleteCartItem".equals(action)) {
            // Update quantity in the database (replace userId with actual user ID)
            if (checklogin == true) {
                dao.delete(cartItemId);
                session.setAttribute("quantityCartItem", dao.getCart(user.getId()).size());
            } else {
                cartItems.remove(ci);
                session.setAttribute("listCart", cartItems);
                session.setAttribute("quantityCartItem", cartItems.size());
            }

        } else if ("updatecart".equals(action)) {
            // Handle update color and size request
            int shoeId = Integer.parseInt(request.getParameter("shoeId"));
            int colorId = Integer.parseInt(request.getParameter("colorId"));
            int sizeId = Integer.parseInt(request.getParameter("sizeId"));
            int quantity;
            int cartId;
            Cart_Item cart = null; // Sửa Cart_Item từ new Cart_Item() thành null

            // Update product classification in the cart item
            int productId = dao.findProduct(shoeId, colorId, sizeId);
            if (checklogin) {
                cart = dao.getCartItemByProductID(productId, cartItemId);
            } else {
                //List<Cart_Item> cartItems = (List<Cart_Item>) session.getAttribute("listCart");
                if (cartItems != null) {
                    for (Cart_Item cartItem : cartItems) {
                        if (productId == dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize())) {
                            cart = cartItem;
                            break;
                        }
                    }
                }
            }

            if (cart != null) {
                cartId = cart.getIdCartItem();
                quantity = cart.getQuatityCart() + ci.getQuatityCart();
            } else {
                quantity = ci.getQuatityCart();
                cartId = cartItemId;
                if (checklogin) {
                    dao.updateProductId(cartItemId, productId);
                } else {
                    // List<Cart_Item> cartItems = (List<Cart_Item>) session.getAttribute("listCart");
                    if (cartItems == null) {
                        cartItems = new ArrayList<>();
                    }
                    boolean found = false;
                    for (int i = 0; i < cartItems.size(); i++) {
                        if (cartItems.get(i).getIdCartItem() == cartItemId) {
                            cartItems.set(i, dao.setCartSession(productId, cartItemId, quantity));
                            found = true;
                            break;
                        }
                    }
                    if (!found) {
                        cartItems.add(dao.setCartSession(productId, cartItemId, quantity));
                    }
                    session.setAttribute("listCart", cartItems);
                }
            }

            // Prepare JSON response
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println("{");
            out.println("\"cartId\": " + cartId + ",");
            out.println("\"quantity\": " + quantity + ",");
            out.println("\"message\": \"Product classification updated successfully!\"");
            out.println("}");
            out.close();
        }

    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        Cart_Item cartItem = dao.setCartSession(1, 10, 3);
        System.out.println(cartItem.toString());
    }
}
