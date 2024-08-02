package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import dao.DAO;
import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modal.Cart_Item;
import modal.OrderDetails;
import modal.User;

/**
 *
 * @author ViQuan
 */
public class CheckOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean available = checkAvailabilityOfProducts(request);

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("available", available);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }

    private boolean checkAvailabilityOfProducts(HttpServletRequest request) {
        HttpSession session = request.getSession();
        DAO dao = new DAO();

        String bankCode = request.getParameter("bankCode");
        int PaymentId ; // Giả sử mặc định là PaymentId = 2 (VNPAY) và chưa thanh toán
        switch (bankCode) {
            case "COD": PaymentId=4;
                
                break;
                case "": PaymentId=2;
                
                break;
            default:
                throw new AssertionError();
        }
        List<Cart_Item> cartItems = (List<Cart_Item>) session.getAttribute("selectedItems");

        if (cartItems == null || cartItems.isEmpty()) {
            return false; // Handle empty or null cartItems case
        }

        for (Cart_Item cartItem : cartItems) {
            //  Cart_Item checkCartItem = dao.getCartItem(cartItem.getIdCartItem());
            int productId = dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize());
            int availableQuantity = dao.getAvailableQuantity(productId);

            if (cartItem.getQuatityCart() > availableQuantity || dao.checkStatusProduct(productId) == 2) {//|| checkCartItem.getStatus_id() == 2
                return false; // Product quantity not available
            }
        }
        OrderDAO odao = new OrderDAO();
        User u = (User) session.getAttribute("acc");
        int orderId = odao.insertOrder(u != null ? u.getId() : 0);
        session.setAttribute("orderId", orderId);

        for (Cart_Item cartItem : cartItems) {
            int productId = dao.findProductByStr(cartItem.getShoe_id(), cartItem.getColor(), cartItem.getSize());
            Double total = cartItem.getQuatityCart() * cartItem.getPrice();
            OrderDetails od = new OrderDetails(0, orderId, cartItem.getShoe_id(), productId, cartItem.getPrice(), cartItem.getQuatityCart(), total, 4, PaymentId);
            boolean CHECK = dao.updateProduct(productId, cartItem.getQuatityCart());
            odao.insertOrderDetail(od);
        }

        return true; // All products are available
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nhận dữ liệu từ AJAX
        String selectedItemsJson = request.getParameter("selectedItems");
        DAO dao = new DAO();
        Gson gson = new Gson();
        Type type = new TypeToken<List<Integer>>() {
        }.getType();
        List<Integer> selectedItemsIds = gson.fromJson(selectedItemsJson, type);

        List<Cart_Item> selectedItems = new ArrayList<>();

        // Lấy danh sách giỏ hàng đầy đủ từ session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acc");

        List<Cart_Item> cartItems;
        boolean isLoggedIn = user != null;

        if (isLoggedIn) {
            cartItems = dao.getCart(user.getId());
        } else {
            cartItems = (List<Cart_Item>) session.getAttribute("listCart");
            if (cartItems != null) {
                List<Cart_Item> updatedCart = new ArrayList<>();
                for (Cart_Item cartItem : cartItems) {
                    Cart_Item updatedCartItem = dao.setCartSession(dao.findProductByStr(cartItem.getIdCartItem(), cartItem.getColor(), cartItem.getSize()), cartItem.getIdCartItem(), cartItem.getQuatityCart());
                    updatedCart.add(updatedCartItem);
                }
                cartItems = updatedCart;
                session.setAttribute("listCart", cartItems);
            }
        }

        // Lọc các mục đã chọn
        if (selectedItemsIds != null && cartItems != null) {
            for (Integer id : selectedItemsIds) {
                for (Cart_Item item : cartItems) {
                    if (item.getIdCartItem() == id) {
                        selectedItems.add(item);
                    }
                }
            }
        }

        // Lưu danh sách các mục đã chọn vào session hoặc xử lý thêm tùy theo yêu cầu của bạn
        session.setAttribute("selectedItems", selectedItems);

        // Trả về phản hồi cho AJAX (nếu cần)
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(selectedItems));
        out.flush();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
//
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        User u = new User();
////        dao.updateProduct(cartItem.getIdCartItem(), cartItem.getQuatityCart());
//    }
}
