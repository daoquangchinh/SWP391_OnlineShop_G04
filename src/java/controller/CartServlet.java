package controller;

import DAO.DAO;
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
import modal.ShoeColor;
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
        } else {
            // If user is not logged in, you might want to redirect to a login page or handle it differently
            // For testing purposes, default to user ID 1
            cartItems = (List<Cart_Item>) session.getAttribute("cart");
        }

        request.setAttribute("mess", "quan");
        request.setAttribute("cart_item", cartItems);
        request.getRequestDispatcher("view/cartPage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();

        // Get parameters from request
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

        // Update quantity in the database (replace userId with actual user ID)
        dao.updateQuantity(cartItemId, quantity);
        Cart_Item ci = new Cart_Item();
        ci = dao.getCartItem(cartItemId);

        // Prepare JSON response
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.println("{ \"price\":" + ci.getPrice() + "}"); // Replace 100 with actual calculated price
        out.close();
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Cart_Item> i = dao.getCart(1);
            List<ShoeColor> cartItems = dao.getColorByShoeId(1);
        for (Cart_Item c : i) {
            System.out.println(c.toString());
            System.out.println(i.size());
        }

    }
}
