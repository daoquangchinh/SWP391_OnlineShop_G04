/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modal.Product_Color;
import modal.Shoe;
import modal.Shoe_Color;

/**
 *
 * @author Dell
 */
public class ProductDAO extends DBContext {

    

//    public List<Shoe_Color> getAllShoe_Color() {
//        String sql = "SELECT [id]\n"
//                + "      ,[shoe_id]\n"
//                + "      ,[product_color_id]\n"
//                + "      ,[quantity]\n"
//                + "  FROM [dbo].[shoe_color]";
//        List<Shoe_Color> list = new ArrayList<>();
//        try {
//            PreparedStatement st = getConnection().prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Shoe_Color c = new Shoe_Color(
//                        rs.getInt("id"),
//                        rs.getInt("shoe_id"),
//                        rs.getInt("product_color_id"),
//                        rs.getInt("quantity"));
//                list.add(c);
//            }
//            rs.close(); // close the ResultSet
//            st.close(); // close the PreparedStatement
//
//        } catch (SQLException ex) {
//            ex.printStackTrace(); // print the exception for debugging
//            return null;
//        }
//        return list;
//    }
//    public List<Product_Color> getAllProduct_Color() {
//        String sql = "SELECT [id]\n"
//                + "      ,[shoe_id]\n"
//                + "      ,[product_color_id]\n"
//                + "      ,[quantity]\n"
//                + "  FROM [dbo].[shoe_color]";
//        List<Product_Color> list = new ArrayList<>();
//        try {
//            PreparedStatement st = getConnection().prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Product_Color c = new Product_Color(
//                        rs.getInt("id"),
//                        rs.getString("color"),
//                        rs.getString("img")
//                );
//                list.add(c);
//            }
//            rs.close(); // close the ResultSet
//            st.close(); // close the PreparedStatement
//
//        } catch (SQLException ex) {
//            ex.printStackTrace(); // print the exception for debugging
//            return null;
//        }
//        return list;
//    }
//
//    public List<ShoeProduct> searchShoeByName(String name) throws SQLException {
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        List<ShoeProduct> list = new ArrayList<>();
//        try {
//            String sql = "SELECT * FROM shoe WHERE shoe_name LIKE ?";
//            ps = getConnection().prepareStatement(sql);
//            ps.setString(1, "%" + name + "%"); // Remove unnecessary single quotes
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                ShoeProduct c = new ShoeProduct(
//                        rs.getInt("id"),
//                        rs.getString("shoe_name"),
//                        rs.getInt("brand_id"),
//                        rs.getInt("sports_id"),
//                        rs.getInt("gender_id"),
//                        rs.getString("description"),
//                        rs.getDouble("price"),
//                        rs.getDouble("discount"),
//                        rs.getString("img"),
//                        rs.getDate("created_at"),
//                        rs.getDate("updated_at"));
//                list.add(c);
//            }
//        } catch (SQLException ex) {
//            System.out.println("Error: " + ex.getMessage());
//            throw ex; // Re-throw exception to handle it in upper layers
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (ps != null) {
//                    ps.close();
//                }
//                if (getConnection() != null) {
//                    getConnection().close();
//                }
//            } catch (SQLException ex) {
//                System.out.println("Error closing resources: " + ex.getMessage());
//            }
//        }
//        return list;
//    }

}
