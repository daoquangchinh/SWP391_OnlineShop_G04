/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dao.DAO;
import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import modal.Cart_Item;
import modal.Config;
import modal.OrderDetails;
import modal.User;

/**
 *
 * @author ViQuan
 */
public class payServlet extends HttpServlet {

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
            out.println("<title>Servlet payServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet payServlet at " + request.getContextPath() + "</h1>");
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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        List<Cart_Item> selectedItems = (List<Cart_Item>) session.getAttribute("selectedItems");
        User user = (User) session.getAttribute("acc");
        String action = request.getParameter("action");
        OrderDAO odao = new OrderDAO();
        int orderId = (Integer) session.getAttribute("orderId");
        switch (action) {
            case "Success":
                boolean checklogin = true;
                if (user == null) {
                    checklogin = false;
                }
//        DAO dao = new DAO();
                if (checklogin == true) {
                    for (Cart_Item selectedItem : selectedItems) {
                        dao.delete(selectedItem.getIdCartItem());
                    }
                } else {
                    List<Cart_Item> cartItems = (List<Cart_Item>) session.getAttribute("listCart");
                    for (Cart_Item selectedItem : selectedItems) {
                        cartItems.remove(selectedItem);
                    }
                    session.removeAttribute("selectedItems");
                    session.setAttribute("listCart", cartItems);
                }
                odao.updatePaymentIdByOrderId(orderId, 1,4);
                // Return a response to the AJAX call
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"status\":\"success\"}");
                break;
            case "Failed":
                List<OrderDetails> listOrderByOrderId = odao.getOrderDetailsByOrderId(orderId);
               
                for (OrderDetails orderDetails : listOrderByOrderId) {
                    odao.updatePaymentIdByOrderId(orderDetails.getId(), orderDetails.getPaymentId(), 7);
                    int quantity = 0 - orderDetails.getQuantity();
                    dao.updateProduct(orderDetails.getProductId(), quantity);
                }
                break;
            default:
                
                break;

        }

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO dao = new DAO();
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = Integer.parseInt(req.getParameter("amount")) * 100;
        String bankCode = req.getParameter("bankCode");

        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;
        if (!bankCode.equalsIgnoreCase("COD")) {
            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");

            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
            vnp_Params.put("vnp_OrderType", orderType);

            String locate = req.getParameter("language");
            if (locate != null && !locate.isEmpty()) {
                vnp_Params.put("vnp_Locale", locate);
            } else {
                vnp_Params.put("vnp_Locale", "vn");
            }
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            cld.add(Calendar.MINUTE, 15);
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

            List fieldNames = new ArrayList(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            Iterator itr = fieldNames.iterator();
            while (itr.hasNext()) {
                String fieldName = (String) itr.next();
                String fieldValue = (String) vnp_Params.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    //Build hash data
                    hashData.append(fieldName);
                    hashData.append('=');
                    hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    //Build query
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                    query.append('=');
                    query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                    if (itr.hasNext()) {
                        query.append('&');
                        hashData.append('&');
                    }
                }
            }
            String queryUrl = query.toString();
            String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
            queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
            String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
        } else {
            HttpSession session = req.getSession();
            User user = (User) session.getAttribute("acc");
            List<Cart_Item> selectedItems = (List<Cart_Item>) session.getAttribute("selectedItems");
            if (user != null) {
                for (Cart_Item selectedItem : selectedItems) {
                    dao.delete(selectedItem.getIdCartItem());
                }
            } else {
                List<Cart_Item> cartItems = (List<Cart_Item>) session.getAttribute("listCart");
                for (Cart_Item selectedItem : selectedItems) {
                    cartItems.remove(selectedItem);
                }
                session.removeAttribute("selectedItems");
                //lấy giá lại giá trị cart item từ database  
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
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", "Home");
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
        }
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
