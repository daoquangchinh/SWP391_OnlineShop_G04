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
import modal.Brand;
import modal.User;

/**
 *
 * @author DELL
 */
public class BrandDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Brand> getBrands() {
        String sql = ""
                + "SELECT  [id]\n"
                + "      ,[Brand_name]\n"
                + "  FROM [Brand]";
        ArrayList<Brand> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                Brand brand = new Brand();
                brand.setId(rs.getInt("id"));
                brand.setName(rs.getString("Brand_name"));

                list.add(brand);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        System.out.println(new BrandDAO().getBrands().size());
    }
}
