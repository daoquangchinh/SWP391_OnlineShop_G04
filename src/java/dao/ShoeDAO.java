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
import modal.Shoe;

/**
 *
 * @author DELL
 */
public class ShoeDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ArrayList<Shoe> getShoes(int brandId) {
        String sql = ""
                + "SELECT  [id]\n"
                + "      ,[shoe_name]\n"
                + "      ,[brand_id]\n"
                + "      ,[sports_id]\n"
                + "      ,[gender_id]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[created_at]\n"
                + "      ,[updated_at]\n"
                + "      , image\n"
                + "  FROM [shoe] ";
        if (brandId != 0) {
            sql += "  Where brand_id = " + brandId;
        }
        ArrayList<Shoe> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                Shoe shoe = new Shoe();

                shoe.setId(rs.getInt("id"));
                shoe.setName(rs.getString("shoe_name"));
                shoe.setBrandId(rs.getInt("brand_id"));
                shoe.setSportsId(rs.getInt("sports_id"));
                shoe.setGenderId(rs.getInt("gender_id"));
                shoe.setDescriptionm(rs.getString("description"));
                shoe.setPrice(rs.getDouble("price"));
                shoe.setDiscount(rs.getDouble("discount"));
                shoe.setCreatedAt(rs.getString("created_at"));
                shoe.setUpdatedAt(rs.getString("updated_at"));
                shoe.setImage(rs.getString("image"));

                list.add(shoe);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return list;
    }

    public ArrayList<Shoe> getAllShoes() {
        String sql = ""
                + "SELECT  [id]\n"
                + "      ,[shoe_name]\n"
                + "      ,[brand_id]\n"
                + "      ,[sports_id]\n"
                + "      ,[gender_id]\n"
                + "      ,[description]\n"
                + "      ,[price]\n"
                + "      ,[discount]\n"
                + "      ,[created_at]\n"
                + "      ,[updated_at]\n"
                + "      , image\n"
                + "  FROM [shoe] ";

        ArrayList<Shoe> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                Shoe shoe = new Shoe();

                shoe.setId(rs.getInt("id"));
                shoe.setName(rs.getString("shoe_name"));
                shoe.setBrandId(rs.getInt("brand_id"));
                shoe.setSportsId(rs.getInt("sports_id"));
                shoe.setGenderId(rs.getInt("gender_id"));
                shoe.setDescriptionm(rs.getString("description"));
                shoe.setPrice(rs.getDouble("price"));
                shoe.setDiscount(rs.getDouble("discount"));
                shoe.setCreatedAt(rs.getString("created_at"));
                shoe.setUpdatedAt(rs.getString("updated_at"));
                shoe.setImage(rs.getString("image"));

                list.add(shoe);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return list;
    }

    public ArrayList<Shoe> searchShoeByName(String name) {
        String sql = "SELECT * FROM shoe WHERE shoe_name LIKE ?";
        ArrayList<Shoe> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                Shoe shoe = new Shoe();
                shoe.setId(rs.getInt("id"));
                shoe.setName(rs.getString("shoe_name"));
                shoe.setBrandId(rs.getInt("brand_id"));
                shoe.setSportsId(rs.getInt("sports_id"));
                shoe.setGenderId(rs.getInt("gender_id"));
                shoe.setDescriptionm(rs.getString("description"));
                shoe.setPrice(rs.getDouble("price"));
                shoe.setDiscount(rs.getDouble("discount"));
                shoe.setCreatedAt(rs.getString("created_at"));
                shoe.setUpdatedAt(rs.getString("updated_at"));
                shoe.setImage(rs.getString("image"));

                list.add(shoe);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return list;
    }

    public List<Shoe> getFilteredShoes(String priceRange, String sizeRaw, String brand, String sports, String color, String gender, String sortOption) {
        List<Shoe> shoes = new ArrayList<>();

        String query = "SELECT s.* FROM shoe s "
                + "JOIN Brand b ON s.brand_id = b.id "
                + "JOIN Sports sp ON s.sports_id = sp.id "
                + "JOIN Gender g ON s.gender_id = g.id "
                + "JOIN shoe_color sc ON s.id = sc.shoe_id "
                + "JOIN shoe_size ss ON sc.id = ss.shoe_color_id "
                + "JOIN product_size ps ON ss.product_size_id = ps.id "
                + "WHERE 1=1 ";

        if (priceRange != null) {
            switch (priceRange) {
                case "1":
                    query += "AND s.price BETWEEN 0 AND 5000000 ";
                    break;
                case "2":
                    query += "AND s.price BETWEEN 5000000 AND 9000000 ";
                    break;
                case "3":
                    query += "AND s.price BETWEEN 10000000 AND 15000000 ";
                    break;
                case "4":
                    query += "AND s.price BETWEEN 16000000 AND 20000000 ";
                    break;
            }
        }

        if (sizeRaw != null) {
            query += "AND ps.size = ? ";
        }

        if (brand != null) {
            query += "AND b.Brand_name = ? ";
        }

        if (sports != null) {
            query += "AND sp.Sports_name = ? ";
        }

        if (color != null) {
            query += "AND sc.color = ? ";
        }

        if (gender != null) {
            query += "AND g.gender_name = ? ";
        }

        if (sortOption != null) {
            switch (sortOption) {
                case "priceAsc":
                    query += "ORDER BY s.price ASC ";
                    break;
                case "priceDesc":
                    query += "ORDER BY s.price DESC ";
                    break;
                case "newest":
                    query += "ORDER BY s.created_at DESC ";
                    break;
            }
        }

        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            int paramIndex = 1;

            if (sizeRaw != null) {
                ps.setInt(paramIndex++, Integer.parseInt(sizeRaw));
            }

            if (brand != null) {
                ps.setString(paramIndex++, brand);
            }

            if (sports != null) {
                ps.setString(paramIndex++, sports);
            }

            if (color != null) {
                ps.setString(paramIndex++, color);
            }

            if (gender != null) {
                ps.setString(paramIndex++, gender);
            }

            

            while (rs.next()) {
                Shoe shoe = new Shoe();
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
                shoes.add(shoe);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return shoes;
    }

    public static void main(String[] args) throws SQLException {
        ShoeDAO productDAO = new ShoeDAO();
        List<Shoe> list = productDAO.searchShoeByName("Nike");
        if (list != null) {
            System.out.println(list.get(1).getName());
        } else {
            System.out.println("No shoes found within the specified price range.");
        }
    }
}
