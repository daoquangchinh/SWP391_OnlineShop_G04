/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import modal.Cart_Item;
import modal.User;

/**
 *
 * @author ViQuan
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
//Quannvhe172350: lay toan bo thong tin user

    public List<User> getAllUser() {
        String query = "SELECT * FROM users";
        List<User> listUser = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
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
        } catch (Exception e) {
            System.err.println(e);
        }
        return listUser;
    }
    //Quannvhe172350: kiem tra thông tin user theo  email 

    public boolean checkUserbyEmail(String email) {
        String query = "SELECT * FROM users where email =?";
        List<User> listUser = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
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
            if (listUser.isEmpty()) {
                return false;
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return true;
    }
    //Quannvhe172350: lay thông tin user theo  phone 

    public boolean getUserbyPhone(String phone) {
        String query = "SELECT * FROM users where phone =?";
        List<User> listUser = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, phone);
            rs = ps.executeQuery();
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
            if (listUser.isEmpty()) {
                return false;
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return true;
    }

    //Quannvhe172350: tìm kiếm phone khi có mail 
    public boolean checkPhone(String phone, String email) {
        String query = "SELECT *\n"
                + "FROM [dbo].[users]\n"
                + "WHERE phone = ? AND email <> ?;";
        List<User> listUser = new ArrayList<>();

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, phone);
            ps.setString(2, email);
            rs = ps.executeQuery();
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
            if (listUser.isEmpty()) {
                return false;
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return true;
    }

//Quannvhe172350: insert thông tin vao bang users
    public boolean setUser(User u) {
        String query = "INSERT INTO users (username, [password], fullname, gender, phone, email, img, role_id, Status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            conn = new DBContext().getConnection(); // mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullname());
            ps.setString(4, u.getGender());
            ps.setString(5, u.getPhone());
            ps.setString(6, u.getEmail());
            ps.setString(7, u.getImg());
            ps.setInt(8, u.getRole_id());
            ps.setInt(9, u.getStatus());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            // Đóng tài nguyên
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return false;
    }

    //Quannvhe172350: update thông tin vao bang users
    public boolean updateUser(User u) {
        String query = "UPDATE users\n"
                + "SET\n"
                + "    username = ?,\n"
                + "    [password] = ?,\n"
                + "    fullname = ?,\n"
                + "    gender = ?,\n"
                + "    phone = ?,\n"
                + "    img = ?,\n"
                + "    role_id = ?,\n"
                + "    Status = ?\n"
                + "WHERE\n"
                + "    email = ?;";
        try {
            conn = new DBContext().getConnection(); // mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getFullname());
            ps.setString(4, u.getGender());
            ps.setString(5, u.getPhone());
            ps.setString(9, u.getEmail());
            ps.setString(6, u.getImg());
            ps.setInt(7, u.getRole_id());
            ps.setInt(8, u.getStatus());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            // Đóng tài nguyên
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return false;
    }

//Quannvhe172350:lay thông tin user theo tài khoản và mật khẩu 
    public User getlogin(String name, String pass) {
        String query = "SELECT * FROM users where email= ? and password = ? ";
        User u = new User();

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            ps.setString(1, name); // Thiết lập tham số cho tên người dùng
            ps.setString(2, pass); // Thiết lập tham số cho mật khẩu 
            rs = ps.executeQuery();
            while (rs.next()) {
                u = new User(
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
        } catch (Exception e) {
            System.err.println(e);
        }
        return u;
    }

    //dao.cart 
    public List<Cart_Item> getCart(int userId) {
        String query = "SELECT \n"
                + "    ci.id AS idCartItem,\n"
                + "    img.img AS img,\n"
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
                + "JOIN \n"
                + "    img img ON img.shoe_id = s.id AND img.shoe_color_id = sc.id\n"
                + "WHERE \n"
                + "    ci.[user_id] = ?;";
        List<Cart_Item> listC = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            ps.setInt(1, userId); // Thiết lập tham số cho id người dùng
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Cart_Item(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9)));

            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return listC;
    }

    public Cart_Item getCartitem(int cartId) {
        String query = "SELECT \n"
                + "    ci.id AS idCartItem,\n"
                + "    img.img AS img,\n"
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
                + "JOIN \n"
                + "    img img ON img.shoe_id = s.id AND img.shoe_color_id = sc.id\n"
                + "WHERE \n"
                + "    ci.[id] = ?;";
        Cart_Item listC = new Cart_Item();
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);

            ps.setInt(1, cartId); // Thiết lập tham số cho id người dùng
            rs = ps.executeQuery();
            while (rs.next()) {
                listC = new Cart_Item(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9));

            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return listC;
    }
// update

    public boolean setCarItem(int id, String color, int size) {
        String query = "UPDATE cart_item\n"
                + "SET product_id = (\n"
                + "        SELECT p.id\n"
                + "        FROM product p\n"
                + "        JOIN shoe_color sc ON p.shoe_color_id = sc.id\n"
                + "        JOIN shoe_size ss ON p.shoe_size_id = ss.id\n"
                + "        WHERE sc.color = ? AND ss.size = ?\n"
                + "    ),\n"
                + "WHERE id = ?;";
        try {
            conn = new DBContext().getConnection(); // mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setString(1, color);
            ps.setInt(2, size);
            ps.setInt(3, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            // Đóng tài nguyên
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return false;
    }

    public boolean updateQuantity(int id, int quantity) {
        String query = "UPDATE cart_item\n"
                + "SET quantity = ?\n"
                + "WHERE id = ?;";
        try {
            conn = new DBContext().getConnection(); // mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            // Đóng tài nguyên
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return false;
    }

    public boolean delete(int id) {
        String query = "DELETE FROM cart_item\n"
                + "WHERE id = ?;";
        try {
            conn = new DBContext().getConnection(); // mở kết nối với SQL
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            // Đóng tài nguyên
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return false;
    }
//check input

    public boolean isValidEmail(String email) {
        String EMAIL_PATTERN = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        if (email == null) {
            return false;
        }
        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean checkPass(String pass) {
        return pass != null;
    }

    public boolean isValidPhoneNumber(String phoneNumber) {
        String PHONE_PATTERN = "^0\\d{9,10}$";
        if (phoneNumber == null) {
            return false;
        }

        Pattern pattern = Pattern.compile(PHONE_PATTERN);
        Matcher matcher = pattern.matcher(phoneNumber);
        return matcher.matches();
    }

}
