/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modal.Img;
import modal.ProductJoin;
import modal.Shoe;

/**
 *
 * @author DELL
 */
public class DetailDao {

    public Shoe getShoeById(int shoeId) {
        String sql = "SELECT * FROM shoe WHERE shoe.id = ?";

        Shoe shoe = null;

        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, shoeId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                shoe = new Shoe();
                shoe.setId(rs.getInt("id"));
                shoe.setName(rs.getString("shoe_name"));
                shoe.setBrandId(rs.getInt("brand_id"));
                shoe.setSportsId(rs.getInt("sports_id"));
                shoe.setGenderId(rs.getInt("gender_id"));
                shoe.setDescriptionm(rs.getString("description"));
                shoe.setPrice(rs.getDouble("price"));
                shoe.setDiscount(rs.getDouble("discount"));
                shoe.setImage(rs.getString("img"));
                shoe.setCreatedAt(rs.getString("created_at"));
                shoe.setUpdatedAt(rs.getString("updated_at"));

            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return shoe;
    }

    public ArrayList<Img> getImgByShoeIdAndColor(int shoeId, int colorId) {
        String sql = "SELECT *\n"
                + "FROM img  \n"
                + "WHERE shoe_id = ?\n"
                + "And shoe_color_id = ?";

        Shoe shoe = null;
        ArrayList<Img> imgList = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, shoeId);
            ps.setInt(2, colorId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Img img = new Img();
                img.setId(rs.getInt("id"));
                img.setImg(rs.getString("img"));
                img.setShoe_id(rs.getInt("shoe_id"));
                img.setShoe_color_id(rs.getInt("shoe_color_id"));
                // Set other fields of Img if needed

                imgList.add(img);
            }
        } catch (SQLException e) {
            System.err.println(e); // Handle SQL exceptions appropriately
        }
        return imgList;
    }

    public Img getImgByImg(String imgString) {
        String sql = "SELECT *\n"
                + "FROM img  \n"
                + "WHERE img.img Like ?";

        Img img = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + imgString + "%");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                img = new Img();
                img.setId(rs.getInt("id"));
                img.setShoe_color_id(rs.getInt("shoe_color_id"));
                img.setImg(rs.getString("img"));
                img.setShoe_id(rs.getInt("shoe_id"));
                // Set other fields of Img if needed

            }

        } catch (SQLException e) {
            System.err.println(e); // Handle SQL exceptions appropriately
        }
        return img;
    }

    public ArrayList<ProductJoin> getProductByShoeIdAndColor(int shoeId, int colorId) {
        String sql = "SELECT p.id, p.shoe_id, p.shoe_size_id, p.shoe_color_id, p.quantity, ss.size "
                + "FROM product p "
                + "LEFT JOIN shoe_color sc ON p.shoe_color_id = sc.id "
                + "LEFT JOIN shoe_size ss ON p.shoe_size_id = ss.id "
                + "WHERE p.shoe_id = ? AND sc.id = ? order by size ASC";
        ArrayList<ProductJoin> productList = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, shoeId);
            ps.setInt(2, colorId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ProductJoin product = new ProductJoin();
                product.setId(rs.getInt("id"));
                product.setShoe_id(rs.getInt("shoe_id"));
                product.setShoe_size_id(rs.getInt("shoe_size_id"));
                product.setShoe_color_id(rs.getInt("shoe_color_id"));
                product.setQuantity(rs.getInt("quantity"));
                product.setSize(rs.getInt("size"));
                productList.add(product);
            }

        } catch (SQLException e) {
            System.err.println(e); // Handle SQL exceptions appropriately
        }
        return productList;
    }

    public ArrayList<Img> getImgMain(int shoeId) {
        ArrayList<Img> imgList = new ArrayList<>();
        String sql = "SELECT *\n"
                + "FROM img  \n"
                + "WHERE img.shoe_id = ?\n"
                + "And img.img Like '%main%'";



        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, shoeId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Img img = new Img();
                img.setId(rs.getInt("id"));
                img.setShoe_color_id(rs.getInt("shoe_color_id"));
                img.setImg(rs.getString("img"));
                img.setShoe_id(rs.getInt("shoe_id"));
                // Set other fields of Img if needed

                imgList.add(img);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return imgList;
    }

    public Img getImgMainByShoeIdAndColor(int shoeId, int color) {
        String sql = "select * from img\n"
                + "where \n"
                + "shoe_id = ?\n"
                + "And shoe_color_id = ?\n"
                + "And img Like '%main%'";


        Img img = null;
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, shoeId);
            ps.setInt(2, color);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                img = new Img();
                img.setId(rs.getInt("id"));
                img.setShoe_color_id(rs.getInt("shoe_color_id"));
                img.setImg(rs.getString("img"));
                img.setShoe_id(rs.getInt("shoe_id"));
                // Set other fields of Img if needed

            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return img;
    }
}
