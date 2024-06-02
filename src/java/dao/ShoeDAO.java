/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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

}
