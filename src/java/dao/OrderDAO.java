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

    public boolean updatePaymentIdByOrderId(int orderId, int newPaymentId) {
        String query = "UPDATE OrderDetails SET payment_id = ? WHERE order_id = ?;";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, newPaymentId); // Đặt giá trị mới cho payment_id
            ps.setInt(2, orderId); // Đặt giá trị order_id của OrderDetails cần cập nhật

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

    public List<OrderView> getOrderViewByUserId(int userId) {
        List<OrderView> orderViews = new ArrayList<>();
        String query = "SELECT MIN(o.order_date) AS order_date, od.order_id, od.status_id, p.payment_method_id, p.payment_status, SUM(od.total_money) AS total "
                + "FROM OrderDetails od "
                + "JOIN payment p ON od.payment_id = p.id "
                + "JOIN orders o ON od.order_id = o.id "
                + "WHERE o.user_id = ? "
                + "GROUP BY od.status_id, od.order_id, p.payment_method_id, p.payment_status;";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, userId); // Thiết lập giá trị user_id trong câu truy vấn

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
                String paymentStatus = rs.getString("payment_status");
                double total = rs.getDouble("total");

                OrderView orderView = new OrderView();
                orderView.setOrderDate(dateFormat.format(orderTimestamp));
                orderView.setOrderId(orderId);
                orderView.setStatusId(status);
                orderView.setPaymentMethodId(paymentMethod);
                orderView.setPaymentStatus(paymentStatus);
                orderView.setTotal(currencyFormat.format(total));

                orderViews.add(orderView);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching OrderView by user_id: " + e.getMessage());
        }
        return orderViews;
    }
}
