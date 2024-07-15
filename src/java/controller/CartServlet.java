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
            cartItems = (List<Cart_Item>) session.getAttribute("listCart");
            if (cartItems != null) {
                List<Cart_Item> updatedCart = new ArrayList<>();
                for (Cart_Item cartItem : cartItems) {
                    Cart_Item updatedCartItem = dao.setCartSession(dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize()), cartItem.getIdCartItem(), cartItem.getQuatityCart());
                    updatedCart.add(updatedCartItem);
                }
                cartItems = updatedCart;
                session.setAttribute("listCart", cartItems);
            }
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
        List<Cart_Item> cartItems = (List<Cart_Item>) session.getAttribute("listCart");
        if (cartItems != null) {
            List<Cart_Item> updatedCart = new ArrayList<>();
            for (Cart_Item cartItem : cartItems) {
                Cart_Item updatedCartItem = dao.setCartSession(dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize()), cartItem.getIdCartItem(), cartItem.getQuatityCart());
                updatedCart.add(updatedCartItem);
            }
            cartItems = updatedCart;
            session.setAttribute("listCart", cartItems);
        }
        session.setAttribute("listCart", cartItems);
        User user = (User) session.getAttribute("acc");

        boolean isLoggedIn = user != null;

        if (!isLoggedIn && cartItems != null) {
            for (Cart_Item cartItem : cartItems) {
                if (cartItemId == cartItem.getIdCartItem()) {
                    ci = cartItem;
                    break;
                }
            }
        }

        switch (action) {
            case "fetchQuantity":
                handleFetchQuantity(request, response, ci);
                break;
            case "updateQuantity":
                handleUpdateQuantity(request, response, ci, cartItemId, dao, cartItems, isLoggedIn, session);
                break;
            case "deleteCartItem":
                handleDeleteCartItem(request, response, cartItemId, dao, cartItems, isLoggedIn, session, user);
                break;
            case "updatecart":
                handleUpdateCart(request, response, ci, dao, cartItems, isLoggedIn, session, cartItemId);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                break;
        }
    }

    private void handleFetchQuantity(HttpServletRequest request, HttpServletResponse response, Cart_Item ci) throws IOException {
        String strQuantity = request.getParameter("quantity");
        int quantity = (strQuantity == null || strQuantity.isEmpty()) ? ci.getQuatityCart() : Integer.parseInt(strQuantity);

        String strErr = "";
        if (quantity > ci.getQuatityProduct()) {
            quantity = ci.getQuatityProduct();
            strErr = "Unfortunately, you can only purchase a maximum of " + ci.getQuatityProduct() + " products" + ci.getShoe_name() + ".";
        }

        ci.setQuatityCart(quantity);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.println("{ \"strErr\": \"" + strErr + "\", \"quantity\": " + ci.getQuatityCart() + " }");
        out.close();
    }

    private void handleUpdateQuantity(HttpServletRequest request, HttpServletResponse response, Cart_Item ci, int cartItemId, DAO dao, List<Cart_Item> cartItems, boolean isLoggedIn, HttpSession session) throws IOException {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String strErr = "";

        if (quantity > ci.getQuatityProduct()) {
            quantity = ci.getQuatityProduct();
            strErr = "Unfortunately, you can only purchase a maximum of " + ci.getQuatityProduct() + " products.";
        }

        if (isLoggedIn) {
            dao.updateQuantity(cartItemId, quantity);
        } else {
            for (Cart_Item cartItem : cartItems) {
                if (cartItemId == cartItem.getIdCartItem()) {
                    cartItem.setQuatityCart(quantity);
                    break;
                }
            }
            if (cartItems != null) {
                List<Cart_Item> updatedCart = new ArrayList<>();
                for (Cart_Item cartItem : cartItems) {
                    Cart_Item updatedCartItem = dao.setCartSession(dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize()), cartItem.getIdCartItem(), cartItem.getQuatityCart());
                    updatedCart.add(updatedCartItem);
                }
                cartItems = updatedCart;
                session.setAttribute("listCart", cartItems);
            }
            session.setAttribute("listCart", cartItems);
        }

        response.setContentType("application/json");

        PrintWriter out = response.getWriter();
        out.print("{ \"price\": " + ci.getPrice() + ", ");
        out.print("\"quantity\": " + quantity + ", ");
        out.print("\"strErr\": \"" + strErr + "\" }");
        out.close();
    }

    private void handleDeleteCartItem(HttpServletRequest request, HttpServletResponse response, int cartItemId, DAO dao, List<Cart_Item> cartItems, boolean isLoggedIn, HttpSession session, User user) throws IOException {
        if (isLoggedIn) {
            dao.delete(cartItemId);
            session.setAttribute("quantityCartItem", dao.getCart(user.getId()).size());
        } else {
            cartItems.removeIf(cartItem -> cartItem.getIdCartItem() == cartItemId);
            if (cartItems != null) {
                List<Cart_Item> updatedCart = new ArrayList<>();
                for (Cart_Item cartItem : cartItems) {
                    Cart_Item updatedCartItem = dao.setCartSession(dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize()), cartItem.getIdCartItem(), cartItem.getQuatityCart());
                    updatedCart.add(updatedCartItem);
                }
                cartItems = updatedCart;
                session.setAttribute("listCart", cartItems);
            }
            session.setAttribute("listCart", cartItems);
            session.setAttribute("quantityCartItem", cartItems.size());
        }
    }

    private void handleUpdateCart(HttpServletRequest request, HttpServletResponse response, Cart_Item ci, DAO dao, List<Cart_Item> cartItems, boolean isLoggedIn, HttpSession session, int cartItemId) throws IOException {
        int shoeId = Integer.parseInt(request.getParameter("shoeId"));
        int colorId = Integer.parseInt(request.getParameter("colorId"));
        int sizeId = Integer.parseInt(request.getParameter("sizeId"));

        int productId = dao.findProduct(shoeId, colorId, sizeId);
        Cart_Item cart = isLoggedIn ? dao.getCartItemByProductID(productId, cartItemId) : findCartItemInSession(cartItems, productId, dao, cartItemId);

        int cartId = (cart != null) ? cart.getIdCartItem() : cartItemId;
        int quantity = (cart != null) ? cart.getQuatityCart() + ci.getQuatityCart() : ci.getQuatityCart();
        System.out.println(quantity);

        if (isLoggedIn) {
            dao.updateProductId(cartItemId, productId);
        } else {
            updateCartItemInSession(cartItems, cartItemId, productId, quantity, dao, session);
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println("{");
        out.println("\"cartId\": " + cartId + ",");
        out.println("\"quantity\": " + quantity + ",");
        out.println("\"message\": \"Product classification updated successfully!\"");
        out.println("}");
        out.close();
    }

    private Cart_Item findCartItemInSession(List<Cart_Item> cartItems, int productId, DAO dao, int cartItemId) {
        if (cartItems != null) {
            for (Cart_Item cartItem : cartItems) {
                if (productId == dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize()) && cartItem.getIdCartItem() != cartItemId) {
                    return cartItem;
                }
            }
        }
        return null;
    }

    private void updateCartItemInSession(List<Cart_Item> cartItems, int cartItemId, int productId, int quantity, DAO dao, HttpSession session) {
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
        if (cartItems != null) {
            List<Cart_Item> updatedCart = new ArrayList<>();
            for (Cart_Item cartItem : cartItems) {
                Cart_Item updatedCartItem = dao.setCartSession(dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize()), cartItem.getIdCartItem(), cartItem.getQuatityCart());
                updatedCart.add(updatedCartItem);
            }
            cartItems = updatedCart;
            session.setAttribute("listCart", cartItems);
        }
        session.setAttribute("listCart", cartItems);
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        Cart_Item cartItem = dao.setCartSession(1, 10, 3);
        System.out.println(cartItem.toString());
    }
}
