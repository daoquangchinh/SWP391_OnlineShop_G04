/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ViQuan
 */
import dal.DBContext;
import java.sql.*;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import modal.OrderDetails;
import modal.OrderView;

public class OrderDAO {

    // Method to fetch OrderDetails from database by orderId
    public List<OrderDetails> getOrderDetailsByOrderId2(int orderId) {
        List<OrderDetails> orderDetailsList = new ArrayList<>();
        String query = "SELECT p.id AS productId, od.price, od.quantity, s.shoe_name AS shoeName, sc.color AS shoeColor, ss.size, sh.img \n"
                + "FROM OrderDetails od\n"
                + "INNER JOIN product p ON od.product_id = p.id\n"
                + "INNER JOIN shoe_color sc ON p.shoe_color_id = sc.id\n"
                + "INNER JOIN shoe_size ss ON p.shoe_size_id = ss.id\n"
                + "INNER JOIN shoe s ON p.shoe_id = s.id\n"
                + "INNER JOIN shoe sh ON s.id = sh.id\n"
                + "WHERE od.order_id = ?;";

        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, orderId); // Thiết lập giá trị order_id trong câu truy vấn

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int productId = rs.getInt("productId");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String shoeName = rs.getString("shoeName");
                String shoeColor = rs.getString("shoeColor");
                int size = rs.getInt("size");
                String img = rs.getString("img");

                OrderDetails orderDetail = new OrderDetails(productId, price, quantity, shoeName, shoeColor, size, img );
                orderDetailsList.add(orderDetail);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching OrderDetails by order_id: " + e.getMessage());
        }

        return orderDetailsList;
    }

    public boolean updatePaymentIdByOrderId(int orderId, int newPaymentId,int status_id  ) {
        String query = "UPDATE OrderDetails SET payment_id = ?, status_id = ? WHERE order_id = ?;";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, newPaymentId); // Đặt giá trị mới cho payment_id
            ps.setInt(2, status_id);
            ps.setInt(3, orderId); // Đặt giá trị order_id của OrderDetails cần cập nhật

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0; // Trả về true nếu cập nhật thành công, ngược lại false
        } catch (SQLException e) {
            System.err.println("Error updating payment_id by order_id: " + e.getMessage());
        }
        return false; // Trả về false nếu có lỗi hoặc không thể cập nhật
    }

    public int insertOrder(int userId) {
        String query = "INSERT INTO orders (user_id, order_date) VALUES (?, CURRENT_TIMESTAMP);";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            if (userId == 0) {
                ps.setNull(1, Types.INTEGER); // Set NULL for user_id
            } else {
                ps.setInt(1, userId); // Set userId otherwise
            }

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                // Lấy giá trị ID tự sinh của đơn hàng vừa thêm vào
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Trả về giá trị ID
                }
            }
        } catch (SQLException e) {
            System.err.println("Error inserting order: " + e.getMessage());
        }
        return -1; // Trả về -1 nếu có lỗi hoặc không thể lấy được ID
    }

    public boolean insertOrderDetail(OrderDetails od) {
        String query = "INSERT INTO OrderDetails (order_id, shoe_id, product_id, price, quantity, total_money, status_id, payment_id) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, od.getOrderId());
            ps.setInt(2, od.getShoeId());
            ps.setInt(3, od.getProductId());
            ps.setDouble(4, od.getPrice());
            ps.setInt(5, od.getQuantity());
            ps.setDouble(6, od.getTotalMoney());
            ps.setInt(7, od.getStatusId());
            ps.setInt(8, od.getPaymentId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.err.println("Error inserting order detail: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteOrderById(int orderId) {
        String deleteOrderDetailsQuery = "DELETE FROM OrderDetails WHERE order_id = ?;";
        String deleteOrderQuery = "DELETE FROM orders WHERE id = ?;";
        try (
                Connection conn = new DBContext().getConnection()) {
            conn.setAutoCommit(false); // Bắt đầu transaction

            // Xóa các chi tiết đơn hàng liên quan
            try (PreparedStatement psOrderDetails = conn.prepareStatement(deleteOrderDetailsQuery)) {
                psOrderDetails.setInt(1, orderId);
                psOrderDetails.executeUpdate();
            }

            // Xóa đơn hàng
            try (PreparedStatement psOrder = conn.prepareStatement(deleteOrderQuery)) {
                psOrder.setInt(1, orderId);
                int rowsDeleted = psOrder.executeUpdate();

                if (rowsDeleted > 0) {
                    conn.commit(); // Commit transaction nếu không có lỗi
                    return true; // Trả về true nếu xóa thành công
                } else {
                    conn.rollback(); // Rollback transaction nếu không xóa được đơn hàng
                }
            }

        } catch (SQLException e) {
            System.err.println("Error deleting order: " + e.getMessage());
        }
        return false; // Trả về false nếu có lỗi hoặc không thể xóa đơn hàng
    }
// Phương thức lấy OrderDetails theo order_id

    public List<OrderDetails> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetails> orderDetails = new ArrayList<>();
        String query = "SELECT * FROM OrderDetails WHERE order_id = ?;";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, orderId); // Thiết lập giá trị order_id trong câu truy vấn

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int shoeId = rs.getInt("shoe_id");
                int productId = rs.getInt("product_id");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                double totalMoney = rs.getDouble("total_money");
                int statusId = rs.getInt("status_id");
                int paymentId = rs.getInt("payment_id");

                OrderDetails orderDetail = new OrderDetails();
                orderDetail.setId(id);
                orderDetail.setOrderId(orderId);
                orderDetail.setShoeId(shoeId);
                orderDetail.setProductId(productId);
                orderDetail.setPrice(price);
                orderDetail.setQuantity(quantity);
                orderDetail.setTotalMoney(totalMoney);
                orderDetail.setStatusId(statusId);
                orderDetail.setPaymentId(paymentId);

                orderDetails.add(orderDetail);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching OrderDetails by order_id: " + e.getMessage());
        }
        return orderDetails;
    }

    public List<OrderView> getOrderViewByUserId(int userId,int value) {
        List<OrderView> orderViews = new ArrayList<>();
        String query = "SELECT MIN(o.order_date) AS order_date, od.order_id, od.status_id, p.payment_method_id, p.status_id as payment_status, SUM(od.total_money) AS total "
                + "FROM OrderDetails od "
                + "JOIN payment p ON od.payment_id = p.id "
                + "JOIN orders o ON od.order_id = o.id "
                + "WHERE o.user_id = ? AND (od.status_id = ? OR ? = 0) "
                + "GROUP BY od.status_id, od.order_id, p.payment_method_id, p.status_id ORDER BY MIN(o.order_date) DESC;";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, userId); // Thiết lập giá trị user_id trong câu truy vấn
            ps.setInt(2, value);
            ps.setInt(3, value);
            ResultSet rs = ps.executeQuery();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
            currencyFormat.setMaximumFractionDigits(0);

            while (rs.next()) {
                Timestamp orderTimestamp = rs.getTimestamp("order_date");
                int orderId = rs.getInt("order_id");
                int statusId = rs.getInt("status_id");
                String status;
                switch (statusId) {
                    case 1:
                        status = "Active";
                        break;
                    case 2:
                        status = "Inactive";
                        break;
                    case 3:
                        status = "Pending";
                        break;
                    case 4:
                        status = "Order";
                        break;
                    case 5:
                        status = "Delivery";
                        break;
                    case 6:
                        status = "Receive";
                        break;
                    case 7:
                        status = "Cancel order";
                        break;
                    default:
                        status = "null";
                        break;
                }
                String paymentStatus;
                 switch (rs.getInt("payment_status")) {
                    case 8:
                        paymentStatus = "Paid";
                        break;
                    case 9:
                        paymentStatus = "Unpaid";
                        break;
                    default:
                        paymentStatus = "null";
                        break;
                }
                int paymentMethodId = rs.getInt("payment_method_id");
                String paymentMethod;
                switch (paymentMethodId) {
                    case 1:
                        paymentMethod = "COD";
                        break;
                    case 2:
                        paymentMethod = "VNPAY";
                        break;
                    default:
                        paymentMethod = "null";
                        break;
                }
                double total = rs.getDouble("total");
                List<OrderDetails> orderDetailsList = getOrderDetailsByOrderId2(orderId);
                OrderView orderView = new OrderView();
                orderView.setOrderDate(dateFormat.format(orderTimestamp));
                orderView.setOrderId(orderId);
                orderView.setStatusId(status);
                orderView.setPaymentMethodId(paymentMethod);
                orderView.setPaymentStatus(paymentStatus);
                orderView.setTotal(currencyFormat.format(total));
                orderView.setListOrderItem(orderDetailsList);
                orderViews.add(orderView);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching OrderView by user_id: " + e.getMessage());
        }
        return orderViews;
    }
    public List<OrderView> getOrderView(int userId,int value) {
        List<OrderView> orderViews = new ArrayList<>();
        String query = "SELECT MIN(o.order_date) AS order_date, od.order_id, od.status_id, p.payment_method_id, p.status_id as payment_status, SUM(od.total_money) AS total "
                + "FROM OrderDetails od "
                + "JOIN payment p ON od.payment_id = p.id "
                + "JOIN orders o ON od.order_id = o.id "
                + "WHERE o.user_id = ? AND ( p.status_id = ? OR ? = 0) "
                + "GROUP BY od.status_id, od.order_id, p.payment_method_id, p.status_id ORDER BY MIN(o.order_date) DESC;";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, userId); // Thiết lập giá trị user_id trong câu truy vấn
            ps.setInt(2, value);
            ps.setInt(3, value);
            ResultSet rs = ps.executeQuery();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
            currencyFormat.setMaximumFractionDigits(0);

            while (rs.next()) {
                Timestamp orderTimestamp = rs.getTimestamp("order_date");
                int orderId = rs.getInt("order_id");
                int statusId = rs.getInt("status_id");
                String status;
                switch (statusId) {
                    case 1:
                        status = "Active";
                        break;
                    case 2:
                        status = "Inactive";
                        break;
                    case 3:
                        status = "Pending";
                        break;
                    case 4:
                        status = "Order";
                        break;
                    case 5:
                        status = "Delivery";
                        break;
                    case 6:
                        status = "Receive";
                        break;
                    case 7:
                        status = "Cancel order";
                        break;
                    default:
                        status = "null";
                        break;
                }
                String paymentStatus;
                 switch (rs.getInt("payment_status")) {
                    case 8:
                        paymentStatus = "Paid";
                        break;
                    case 9:
                        paymentStatus = "Unpaid";
                        break;
                    default:
                        paymentStatus = "null";
                        break;
                }
                int paymentMethodId = rs.getInt("payment_method_id");
                String paymentMethod;
                switch (paymentMethodId) {
                    case 1:
                        paymentMethod = "COD";
                        break;
                    case 2:
                        paymentMethod = "VNPAY";
                        break;
                    default:
                        paymentMethod = "null";
                        break;
                }
                double total = rs.getDouble("total");
                List<OrderDetails> orderDetailsList = getOrderDetailsByOrderId2(orderId);
                OrderView orderView = new OrderView();
                orderView.setOrderDate(dateFormat.format(orderTimestamp));
                orderView.setOrderId(orderId);
                orderView.setStatusId(status);
                orderView.setPaymentMethodId(paymentMethod);
                orderView.setPaymentStatus(paymentStatus);
                orderView.setTotal(currencyFormat.format(total));
                orderView.setListOrderItem(orderDetailsList);
                orderViews.add(orderView);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching OrderView by user_id: " + e.getMessage());
        }
        return orderViews;
    }
  // Method to update the status of an order and adjust product quantities
    public boolean updateOrderStatus(int orderId, int newStatusId) {
        // Update query for changing status
        String updateStatusQuery = "UPDATE OrderDetails SET status_id = ? WHERE order_id = ?";
        // Query to get order details by orderId
        String selectOrderDetailsQuery = "SELECT product_id, quantity FROM OrderDetails WHERE order_id = ?";

        try (Connection conn = new DBContext().getConnection()) {
            // Start a transaction
            conn.setAutoCommit(false);

            // Update the status_id in OrderDetails
            try (PreparedStatement psUpdate = conn.prepareStatement(updateStatusQuery)) {
                psUpdate.setInt(1, newStatusId);
                psUpdate.setInt(2, orderId);
                int rowsAffected = psUpdate.executeUpdate();

                if (rowsAffected > 0) {
                    // Fetch order details
                    try (PreparedStatement psSelect = conn.prepareStatement(selectOrderDetailsQuery)) {
                        psSelect.setInt(1, orderId);
                        ResultSet rs = psSelect.executeQuery();

                        // Update product quantities based on OrderDetails
                        while (rs.next()) {
                            int productId = rs.getInt("product_id");
                            int quantity = rs.getInt("quantity");

                            // Update product quantity
                            updateProductQuantity( productId, quantity);
                        }
                    }
                    
                    // Commit the transaction
                    conn.commit();
                    return true;
                } else {
                    // Rollback the transaction if no rows were updated
                    conn.rollback();
                    return false;
                }
            } catch (SQLException e) {
                // Rollback the transaction on failure
                conn.rollback();
                System.err.println("Error updating status_id in OrderDetails: " + e.getMessage());
                return false;
            }

        } catch (SQLException e) {
            System.err.println("Error connecting to database: " + e.getMessage());
            return false;
        }
    }
   // Method to update the quantity of a product based on product_id
    public boolean updateProductQuantity(int productId, int quantityToAdd) {
        String updateQuery = "UPDATE product SET quantity = quantity + ? WHERE id = ?";
        boolean isUpdated = false;

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(updateQuery)) {

            // Set the parameters for the SQL query
            ps.setInt(1, quantityToAdd);
            ps.setInt(2, productId);

            // Execute the update
            int rowsAffected = ps.executeUpdate();
            isUpdated = (rowsAffected > 0);  // Return true if at least one row is updated

        } catch (SQLException e) {
            System.err.println("Error updating product quantity: " + e.getMessage());
        }

        return isUpdated;
    }
     public void BuyAgaim(int orderId, int userid) {
        String query = "SELECT * FROM OrderDetails WHERE order_id = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            // Set the orderId parameter
            ps.setInt(1, orderId);

            // Execute the query
            ResultSet resultSet = ps.executeQuery();

            // Process the result set
            while (resultSet.next()) {
                
                
                int productId = resultSet.getInt("product_id");
                
                int quantity = resultSet.getInt("quantity");
                addCartItem(userid, productId, quantity);
               
            }

        } catch (SQLException e) {
            System.err.println("Error fetching OrderDetails by orderId: " + e.getMessage());
        }

       
    }
     public void addCartItem(int userId, int productId, int quantity) {
        String insertQuery = "INSERT INTO cart_item (user_id, product_id, quantity) VALUES (?, ?, ?)";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(insertQuery)) {
            // Set the parameters
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);

            // Execute the insert
            int rowsAffected = ps.executeUpdate();

            // Check if the insertion was successful
        } catch (SQLException e) {
            System.err.println("Error adding item to cart: " + e.getMessage());
        }
    }
     
}

        
