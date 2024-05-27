/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dell
 */
public class RolesDAO extends DBContext {

    // tim id roles tu roles_name 
    public int getRoleIdByRole_Name(String roles_name) {
        try {
            String sql = "select id from roles where roles_name = ?";
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, roles_name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    // tim namerole tu id 
    public String getRoleNameByID(int id_roles) {
        try {
            String sql = "select * from roles where id = ?";
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setInt(1, id_roles);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(2);
            }
        } catch (Exception e) {
        }
        return null;
    }

    // tra ve danh sach tat cac cac roles
    public List<String> getAllRoles() {
        List<String> list = new ArrayList<>();
        try {
            String sql = "select * from roles";
            PreparedStatement st = getConnection().prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(2));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
