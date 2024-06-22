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
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import modal.Cart_Item;
import modal.ShoeColor;
import modal.ShoeSize;
import modal.User;

public class DAO {
 // 
    public Cart_Item getCartItemByProductID(int productId,int cartItemId ) {
        String query = "SELECT "
                + "ci.id AS idCartItem, "
                + "s.img AS img, "
                + "s.shoe_name, "
                + "ss.size, "
                + "sc.color, "
                + "s.price, "
                + "ci.quantity AS quantityCart, "
                + "p.quantity AS quantityProduct, "
                + "s.id AS shoe_id "
                + "FROM cart_item ci "
                + "JOIN product p ON ci.product_id = p.id "
                + "JOIN shoe s ON p.shoe_id = s.id "
                + "JOIN shoe_size ss ON p.shoe_size_id = ss.id "
                + "JOIN shoe_color sc ON p.shoe_color_id = sc.id "
                + "WHERE ci.product_id = ? AND ci.id <> ? ";

        Cart_Item cartItem = null;

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, productId);
            ps.setInt(2, cartItemId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int idCartItem = rs.getInt("idCartItem");
                    String img = rs.getString("img");
                    String shoeName = rs.getString("shoe_name");
                    int size = rs.getInt("size");
                    String color = rs.getString("color");
                    double price = rs.getDouble("price");
                    int quantityCart = rs.getInt("quantityCart");
                    int quantityProduct = rs.getInt("quantityProduct");
                    int shoeId = rs.getInt("shoe_id");

                    List<ShoeColor> colors = getColorByShoeId(shoeId);
                    cartItem = new Cart_Item(idCartItem, img, shoeName, size, color, price, quantityCart, quantityProduct, shoeId, colors);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting cart item with ProductId " + productId + ": " + e);
        }

        return cartItem;
    }
    //update sô lượng sản phẩm 
    public int findProduct(int shoeId, int colorId, int sizeId) {
        String query = "SELECT id \n"
                + "FROM product \n"
                + "WHERE shoe_id = ? \n"
                + "AND shoe_color_id = ? \n"
                + "AND shoe_size_id = ?;";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, shoeId);
            ps.setInt(2, colorId);
            ps.setInt(3, sizeId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id");
                } else {
                    return -1; // or throw an exception or handle it another way
                }
            }
        } catch (SQLException e) {
            System.err.println("Error finding product with shoeId " + shoeId + ", colorId " + colorId + ", sizeId " + sizeId + ": " + e);
            return -1; // or throw an exception or handle it another way
        }
    }

    //update ProductId sản phẩm cho giỏ hàng
    public boolean updateProductId(int cartItemId, int productId) {
        String query = "UPDATE cart_item SET product_id = ? WHERE id = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, productId);
            ps.setInt(2, cartItemId);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            System.err.println("Error updating product_id for cart item with ID " + cartItemId + ": " + e);
            return false;
        }
    }

    //update sô lượng sản phẩm 
    public boolean updateQuantity(int cartItemId, int quantity) {
        String query = "UPDATE cart_item SET quantity = ? WHERE id = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, quantity);
            ps.setInt(2, cartItemId);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            System.err.println("Error updating quantity for cart item with ID " + cartItemId + ": " + e);
            return false;
        }
    }

    //Xóa cart item trong giỏ 
    public boolean delete(int cartItemId) {
        String query = "DELETE FROM cart_item WHERE id = ?";

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, cartItemId);
            int rowsAffected = ps.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {
            System.err.println("Error deleting cart item: " + e.getMessage());
            return false;
        }
    }

    //Hàm lấy cart item 
    public Cart_Item getCartItem(int cartItemId) {
        String query = "SELECT "
                + "ci.id AS idCartItem, "
                + "s.img AS img, "
                + "s.shoe_name, "
                + "ss.size, "
                + "sc.color, "
                + "s.price, "
                + "ci.quantity AS quantityCart, "
                + "p.quantity AS quantityProduct, "
                + "s.id AS shoe_id "
                + "FROM cart_item ci "
                + "JOIN product p ON ci.product_id = p.id "
                + "JOIN shoe s ON p.shoe_id = s.id "
                + "JOIN shoe_size ss ON p.shoe_size_id = ss.id "
                + "JOIN shoe_color sc ON p.shoe_color_id = sc.id "
                + "WHERE ci.id = ?";

        Cart_Item cartItem = null;

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, cartItemId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int idCartItem = rs.getInt("idCartItem");
                    String img = rs.getString("img");
                    String shoeName = rs.getString("shoe_name");
                    int size = rs.getInt("size");
                    String color = rs.getString("color");
                    double price = rs.getDouble("price");
                    int quantityCart = rs.getInt("quantityCart");
                    int quantityProduct = rs.getInt("quantityProduct");
                    int shoeId = rs.getInt("shoe_id");

                    List<ShoeColor> colors = getColorByShoeId(shoeId);
                    cartItem = new Cart_Item(idCartItem, img, shoeName, size, color, price, quantityCart, quantityProduct, shoeId, colors);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error getting cart item with ID " + cartItemId + ": " + e);
        }

        return cartItem;
    }

    //  Hàm lấy danh sách các item trong giỏ hàng
    public List<Cart_Item> getCart(int userId) {
        String query = "SELECT \n"
                + "    ci.id AS idCartItem,\n"
                + "    s.img AS img,\n"
                + "    s.shoe_name,\n"
                + "    ss.size,\n"
                + "    sc.color,\n"
                + "    s.price,\n"
                + "    ci.quantity AS quatityCart,\n"
                + "    p.quantity AS quatityProduct,\n"
                + "    s.id AS shoe_id\n"
                + "FROM \n"
                + "    cart_item ci\n"
                + "JOIN \n"
                + "    product p ON ci.product_id = p.id\n"
                + "JOIN \n"
                + "    shoe s ON p.shoe_id = s.id\n"
                + "JOIN \n"
                + "    shoe_size ss ON p.shoe_size_id = ss.id\n"
                + "JOIN \n"
                + "    shoe_color sc ON p.shoe_color_id = sc.id\n"
                + "WHERE \n"
                + "    ci.user_id = ?;"; // Change to filter by ci.user_id = ?

        List<Cart_Item> listC = new ArrayList<>();
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId); // Set the userId parameter
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int idCartItem = rs.getInt("idCartItem");
                    String img = rs.getString("img");
                    String shoe_name = rs.getString("shoe_name");
                    int size = rs.getInt("size");
                    String color = rs.getString("color");
                    Double price = rs.getDouble("price");
                    int quatityCart = rs.getInt("quatityCart");
                    int quatityProduct = rs.getInt("quatityProduct");
                    int shoe_id = rs.getInt("shoe_id");

                    // Assuming you have methods getColorByShoeId and getSizeByShoeId defined
                    // Fetch colors and sizes
                    List<ShoeColor> colors = getColorByShoeId(shoe_id);

                    // Create a new Cart_Item object and add it to the list
                    listC.add(new Cart_Item(idCartItem, img, shoe_name, size, color, price, quatityCart, quatityProduct, shoe_id, colors));
                }
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return listC;
    }

    // Hàm lấy danh sách màu sắc của giày theo shoe_id
    public List<ShoeColor> getColorByShoeId(int shoe_id) {
        // Câu truy vấn SQL để lấy danh sách màu sắc của giày
        String query = "SELECT DISTINCT\n"
                + "    sc.id, \n"
                + "    sc.color\n"
                + "FROM \n"
                + "    shoe s\n"
                + "JOIN \n"
                + "    product p ON s.id = p.shoe_id\n"
                + "JOIN \n"
                + "    shoe_color sc ON p.shoe_color_id = sc.id\n"
                + "WHERE \n"
                + "    s.id = ?\n"
                + "    AND p.quantity > 0;";

        List<ShoeColor> listCl = new ArrayList<>();

        // Kết nối cơ sở dữ liệu và thực hiện truy vấn
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, shoe_id); // Thiết lập tham số cho shoe_id

            try (ResultSet rs = ps.executeQuery()) {
                // Duyệt qua kết quả truy vấn
                while (rs.next()) {
                    // Lấy danh sách các kích cỡ theo màu sắc
                    List<ShoeSize> sizes = getSizeByShoeId(shoe_id, rs.getInt("id"));

                    // Thêm màu sắc và các kích cỡ vào danh sách
                    listCl.add(new ShoeColor(rs.getInt("id"), rs.getString("color"), sizes));
                }
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return listCl;
    }

    // Hàm lấy danh sách các size của giày theo shoe_id và colorId
    public List<ShoeSize> getSizeByShoeId(int shoe_id, int colorId) {
        // Câu truy vấn SQL để lấy danh sách các kích cỡ của giày
        String query = "SELECT DISTINCT\n"
                + "    ss.id,\n"
                + "    ss.size\n"
                + "FROM \n"
                + "    product p\n"
                + "JOIN \n"
                + "    shoe_size ss ON p.shoe_size_id = ss.id\n"
                + "WHERE \n"
                + "    p.shoe_id = ?\n"
                + "    AND p.shoe_color_id = ?\n"
                + "    AND p.quantity > 0;";

        List<ShoeSize> listS = new ArrayList<>();

        // Kết nối cơ sở dữ liệu và thực hiện truy vấn
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, shoe_id); // Thiết lập tham số cho shoe_id
            ps.setInt(2, colorId); // Thiết lập tham số cho colorId

            try (ResultSet rs = ps.executeQuery()) {
                // Duyệt qua kết quả truy vấn
                while (rs.next()) {
                    // Thêm kích cỡ vào danh sách
                    listS.add(new ShoeSize(rs.getInt("id"), rs.getInt("size")));
                }
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return listS;
    }

    // Lấy thông tin user theo email và password
    public User getlogin(String email, String pass) {
        String query = "SELECT * FROM users WHERE email= ? AND password = ?";
        User user = null;
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email); // Thiết lập tham số cho email
            ps.setString(2, pass); // Thiết lập tham số cho mật khẩu
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("fullname"),
                            rs.getString("gender"),
                            rs.getString("phone"),
                            rs.getString("email"),
                            rs.getString("img"),
                            rs.getInt("role_id"),
                            rs.getInt("Status")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return user;
    }

    // Lấy toàn bộ thông tin user
    public List<User> getAllUser() {
        String query = "SELECT * FROM users";
        List<User> listUser = new ArrayList<>();
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                listUser.add(new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("fullname"),
                        rs.getString("gender"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("img"),
                        rs.getInt("role_id"),
                        rs.getInt("Status")
                ));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return listUser;
    }

    // Kiểm tra thông tin user theo email
    public boolean checkUserbyEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return false;
    }

    // Kiểm tra thông tin user theo phone
    public boolean getUserbyPhone(String phone) {
        String query = "SELECT * FROM users WHERE phone = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, phone);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return false;
    }

    // Tìm kiếm phone khi có email
    public boolean checkPhone(String phone, String email) {
        String query = "SELECT * FROM users WHERE phone = ? AND email <> ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, phone);
            ps.setString(2, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return false;
    }

    // Insert thông tin vào bảng users
    public boolean setUser(User u) {
        String query = "INSERT INTO users (username, [password], fullname, gender, phone, email, img, role_id, Status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullname());
            ps.setString(4, u.getGender());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getEmail());
            ps.setString(7, u.getImg());
            ps.setInt(8, u.getRole_id());
            ps.setInt(9, u.getStatus());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println(e);
        }
        return false;
    }

    // Update thông tin user
    public void updateUser(User u) {
        String query = "UPDATE users SET username=?, password=?, fullname=?, gender=?, phone=?, email=?, img=?, role_id=?, Status=? WHERE id = ?;";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullname());
            ps.setString(4, u.getGender());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getEmail());
            ps.setString(7, u.getImg());
            ps.setInt(8, u.getRole_id());
            ps.setInt(9, u.getStatus());
            ps.setInt(10, u.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    // Cập nhật trạng thái cho user
    public void updateStatus(int status, int id) {
        String query = "UPDATE users SET Status = ? WHERE id = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    // Lấy user theo id
    public User getUserByID(int id) {
        String query = "SELECT * FROM users WHERE id= ?";
        User user = null;
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id); // Thiết lập tham số cho id
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("fullname"),
                            rs.getString("gender"),
                            rs.getString("phone"),
                            rs.getString("email"),
                            rs.getString("img"),
                            rs.getInt("role_id"),
                            rs.getInt("Status")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return user;
    }

    // Method to validate phone number
    public boolean isValidPhoneNumber(String phone) {
        // Regular expression for a valid phone number
        String regex = "^\\+(?:[0-9] ?){6,14}[0-9]$";

        // Validate the phone number against the regex
        if (phone.matches(regex)) {
            return true;
        } else {
            return false;
        }
    }

    // Method to validate email address
    public boolean isValidEmail(String email) {
        // Regular expression for a valid email address
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

        // Compile the regex pattern
        Pattern pattern = Pattern.compile(emailRegex);

        // Validate the email against the pattern
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
    }
}
