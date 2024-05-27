/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import helper.VariabeStatic;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modal.Users;

/**
 *
 * @author dell
 */
public class UsersDAO extends DBContext {

    // tim kiem user theo full name , email , mobie : neu lay tat thi tat ca optinal deu la null
    public List<Users> GetUserByOptional(String username, String fullname, String email, String mobile, String role, int status, int pagenumber, int numberOnePage) {
        List<Users> list = new ArrayList<>();
        int index = 0;
        try {
            String sql = "select * from users join roles \n"
                    + "on users.role_id = roles.id where 1 = 1";

            if (username != null && !username.isEmpty() && !VariabeStatic.checkStringFullSpace(username)) {

                sql += " and users.username like ? ";
            }
            if (fullname != null && !fullname.isEmpty() && !VariabeStatic.checkStringFullSpace(fullname)) {

                sql += " and users.fullname like ? ";
            }
            if (email != null && !email.isEmpty() && !VariabeStatic.checkStringFullSpace(email)) {

                sql += " and users.email  like ? ";
            }
            if (mobile != null && !mobile.isEmpty() && !VariabeStatic.checkStringFullSpace(mobile)) {

                sql += " and users.phone  like ?";
            }
            if (role != null) {

                sql += " and roles.roles_name = ? ";
            }
            if (status == 1 || status == 0) {

                sql += " and users.Status = ? ";
            }
            sql += " order by users.id offset ? rows fetch next ? rows only";

            PreparedStatement st = getConnection().prepareStatement(sql);
            if (username != null && !username.isEmpty() && !VariabeStatic.checkStringFullSpace(username)) {
                st.setString(++index, "%" + username.trim() + "%");
            }
            if (fullname != null && !fullname.isEmpty() && !VariabeStatic.checkStringFullSpace(fullname)) {
                st.setString(++index, "%" + fullname.trim() + "%");
            }
            if (email != null && !email.isEmpty() && !VariabeStatic.checkStringFullSpace(email)) {
                st.setString(++index, "%" + email.trim() + "%");
            }
            if (mobile != null && !mobile.isEmpty() && !VariabeStatic.checkStringFullSpace(mobile)) {
                st.setString(++index, "%" + mobile.trim() + "%");
            }
            if (role != null) {

                st.setString(++index, role);
            }
            if (status == 1 || status == 0) {

                st.setInt(++index, status);
            }
            int missBanGhi = (pagenumber - 1) * numberOnePage;
            st.setInt(++index, missBanGhi);
            st.setInt(++index, numberOnePage);

            ResultSet rs = st.executeQuery();

            /*public Users(int id, String username, String password, String fullname, String gender, String phone, String email, String img, int roleId, int status)*/
            while (rs.next()) {
                list.add(new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getString(12)));
            }

        } catch (Exception e) {
            System.out.println("loi");
        }
        return list;
    }

    // check xem name user co ton tai hay khong
    public boolean checkUserName(String username) {
        try {

            String sql = "select * from users where username = ?";
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            //neu co ton tai
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
        }
        // neu khong ton tai
        return false;
    }

    // them moi mot user
    public boolean AddUser(String username, String roles_name) {
        // neu username da ton tai trong danh sach
        boolean check = checkUserName(username);
        if (check) {
            return false;
        }
        try {
            String sql = "insert into users values\n"
                    + "(?,?,null,null,null,null,null,?,1)";
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, VariabeStatic.stringPassword);
            RolesDAO x = new RolesDAO();
            st.setInt(3, x.getRoleIdByRole_Name(roles_name));
            st.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    // cai dat password mac dinh khi cap tai khaon cho user
    public void ChangePassDefault(String s) {
        VariabeStatic.stringPassword = s;
    }

    // tim kiem 1 user bang id user
    public Users getUserByIDUser(int id) {
        try {
            String sql = "select * from users join roles\n"
                    + "on users.role_id = roles.id where users.id = ?";
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getString(12));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    // thay doi trang thai
    public void ChangeStatusUser(int id) {
        try {
            String sql = "update users set Status = ? where id = ?";
            PreparedStatement st = getConnection().prepareStatement(sql);
            // tim kiem user
            Users user = getUserByIDUser(id);
            if (user.getStatus() == 1) {
                st.setInt(1, 0);
            } else {
                st.setInt(1, 1);
            }

            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
