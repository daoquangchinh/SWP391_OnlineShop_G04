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
}
