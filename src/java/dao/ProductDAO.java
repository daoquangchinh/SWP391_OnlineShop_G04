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
import java.util.List;
import modal.ProductUpdate;
import modal.Shoe;
import modal.ShoeDetail;

/**
 *
 * @author ViQuan
 */
public class ProductDAO {

    public List<ProductUpdate> getProductsByShoeId(int shoeId) {
        List<ProductUpdate> products = new ArrayList<>();
        String query = "SELECT\n"
                + "    p.id AS product_id,\n"
                + "    s.img AS shoe_img,\n"
                + "    s.shoe_name AS shoe_name,\n"
                + "    sc.color AS shoe_color,\n"
                + "    ss.size AS shoe_size,\n"
                + "    p.quantity AS product_quantity,\n"
                + "    s.price AS product_price,\n"
                + "    st.name AS status_name\n"
                + "FROM\n"
                + "    product p\n"
                + "JOIN\n"
                + "    shoe s ON p.shoe_id = s.id\n"
                + "JOIN\n"
                + "    shoe_color sc ON p.shoe_color_id = sc.id\n"
                + "JOIN\n"
                + "    shoe_size ss ON p.shoe_size_id = ss.id\n"
                + "JOIN\n"
                + "    status st ON p.status_id = st.id\n"
                + "WHERE\n"
                + "    p.shoe_id = ?;";
        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, shoeId); // Set the shoeId parameter in the query
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductUpdate p = new ProductUpdate();
                    p.setId(rs.getInt("product_id"));
                    p.setImg(rs.getString("shoe_img"));
                    p.setName(rs.getString("shoe_name"));
                    p.setColor(rs.getString("shoe_color"));
                    p.setSize(rs.getInt("shoe_size"));
                    p.setQuantity(rs.getInt("product_quantity"));
                    p.setPrice(rs.getInt("product_price")); // Đảm bảo rằng `price` được lấy từ bảng `product`
                    p.setStatus(rs.getString("status_name"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving products: " + e.getMessage());
        }
        return products;
    }

    public List<ShoeDetail> getAllShoeDetails() {
        // Câu lệnh SQL để lấy thông tin từ bảng shoe và các bảng liên quan
        String query = "SELECT "
                + "shoe.id AS id, "
                + "shoe.shoe_name AS name, "
                + "shoe.description, "
                + "shoe.price, "
                + "shoe.discount, "
                + "shoe.img AS image, "
                + "shoe.created_at AS createdAt, "
                + "shoe.updated_at AS updatedAt, "
                + "Brand.Brand_name AS brandName, "
                + "Sports.Sports_name AS sportsName, "
                + "Gender.gender_name AS genderName "
                + "FROM shoe "
                + "INNER JOIN Brand ON shoe.brand_id = Brand.id "
                + "INNER JOIN Sports ON shoe.sports_id = Sports.id "
                + "INNER JOIN Gender ON shoe.gender_id = Gender.id";

        List<ShoeDetail> shoes = new ArrayList<>();

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ShoeDetail shoe = new ShoeDetail();
                shoe.setId(rs.getInt("id"));
                shoe.setName(rs.getString("name"));
                shoe.setDescription(rs.getString("description"));
                shoe.setPrice(rs.getDouble("price"));
                shoe.setDiscount(rs.getDouble("discount"));
                shoe.setImage(rs.getString("image"));
                shoe.setCreatedAt(rs.getString("createdAt"));
                shoe.setUpdatedAt(rs.getString("updatedAt"));
                shoe.setBrandName(rs.getString("brandName"));
                shoe.setSportsName(rs.getString("sportsName"));
                shoe.setGenderName(rs.getString("genderName"));

                shoes.add(shoe);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching shoe details: " + e.getMessage());
        }

        return shoes;
    }

    public boolean findProductBoolean(int size, String color, int shoeId, int id) {
        // Câu lệnh SQL để lấy thông tin từ bảng product và các bảng liên quan
        String query = "SELECT *\n"
                + "FROM product p\n"
                + "JOIN shoe_size ss ON p.shoe_size_id = ss.id\n"
                + "JOIN shoe_color sc ON p.shoe_color_id = sc.id\n"
                + "WHERE ss.size = ?\n"
                + "AND sc.color = ?\n"
                + "and shoe_id=?\n"
                + "AND p.id <> ?;"; // Loại bỏ điều kiện shoe_id=1 nếu không cần thiết

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

            // Thiết lập các tham số cho câu lệnh SQL
            ps.setInt(1, size);
            ps.setString(2, color);
            ps.setInt(3, shoeId);
            ps.setInt(4, id);

            try (ResultSet rs = ps.executeQuery()) {
                // Nếu có ít nhất một kết quả trả về, thì có sản phẩm đáp ứng yêu cầu
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println("Error fetching product details: " + e.getMessage());
            return false;
        }
    }

    public void updateShoeByProductId(int productId, int shoeId, String shorColor, int shoeSize, int quantity, int status) {
        int shoeColorId = findOrCreateShoeColorId(shorColor);
        int shoeSizeId = findOrCreateShoeSizeId(shoeSize);

        String updateShoeQuery = "UPDATE product SET shoe_id= ? , shoe_color_id = ?, shoe_size_id = ?, quantity = ?, status_id = ? WHERE id = ?";

        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement updateShoePs = conn.prepareStatement(updateShoeQuery)) {

            // Set parameters for the update query
            updateShoePs.setInt(1, shoeId);
            updateShoePs.setInt(2, shoeColorId);
            updateShoePs.setInt(3, shoeSizeId);
            updateShoePs.setInt(4, quantity);
            updateShoePs.setInt(5, status);
            updateShoePs.setInt(6, productId);

            // Execute the update
            updateShoePs.executeUpdate();

        } catch (SQLException e) {
            System.err.println("Error updating shoe by product ID: " + e.getMessage());
        }
    }

    public int findOrCreateShoeColorId(String color) {
        String selectQuery = "SELECT id FROM shoe_color WHERE color = ?";
        String insertQuery = "INSERT INTO shoe_color (color) VALUES (?)";

        int shoeColorId = -1; // Giá trị mặc định nếu có lỗi xảy ra

        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement selectPs = conn.prepareStatement(selectQuery); PreparedStatement insertPs = conn.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Thiết lập tham số màu cho câu lệnh SELECT
            selectPs.setString(1, color);

            // Thực hiện câu lệnh SELECT
            try (ResultSet rs = selectPs.executeQuery()) {
                if (rs.next()) {
                    // Màu sắc đã tồn tại, lấy id của nó
                    shoeColorId = rs.getInt("id");
                } else {
                    // Màu sắc không tồn tại, thêm mới
                    insertPs.setString(1, color);
                    int affectedRows = insertPs.executeUpdate();

                    if (affectedRows > 0) {
                        // Lấy khóa được sinh ra (id của màu mới)
                        try (ResultSet generatedKeys = insertPs.getGeneratedKeys()) {
                            if (generatedKeys.next()) {
                                shoeColorId = generatedKeys.getInt(1);
                            }
                        }
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi tìm hoặc tạo id màu sắc: " + e.getMessage());
        }

        return shoeColorId;
    }

    public int findOrCreateShoeSizeId(int size) {
        String selectQuery = "SELECT id FROM shoe_size WHERE size = ?";
        String insertQuery = "INSERT INTO shoe_size (size) VALUES (?)";

        int shoeSizeId = -1; // Giá trị mặc định nếu có lỗi xảy ra

        try (
                Connection conn = new DBContext().getConnection(); PreparedStatement selectPs = conn.prepareStatement(selectQuery); PreparedStatement insertPs = conn.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Thiết lập tham số kích thước cho câu lệnh SELECT
            selectPs.setInt(1, size);

            // Thực hiện câu lệnh SELECT
            try (ResultSet rs = selectPs.executeQuery()) {
                if (rs.next()) {
                    // Kích thước đã tồn tại, lấy id của nó
                    shoeSizeId = rs.getInt("id");
                } else {
                    // Kích thước không tồn tại, thêm mới
                    insertPs.setInt(1, size);
                    int affectedRows = insertPs.executeUpdate();

                    if (affectedRows > 0) {
                        // Lấy khóa được sinh ra (id của kích thước mới)
                        try (ResultSet generatedKeys = insertPs.getGeneratedKeys()) {
                            if (generatedKeys.next()) {
                                shoeSizeId = generatedKeys.getInt(1);
                            }
                        }
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi tìm hoặc tạo id kích thước giày: " + e.getMessage());
        }

        return shoeSizeId;
    }
public int findOrCreateBrandId(String brandName) {
    String selectQuery = "SELECT id FROM Brand WHERE Brand_name = ?";
    String insertQuery = "INSERT INTO Brand (Brand_name) VALUES (?)";

    int brandId = -1; // Giá trị mặc định nếu có lỗi xảy ra

    try (
            Connection conn = new DBContext().getConnection(); 
            PreparedStatement selectPs = conn.prepareStatement(selectQuery); 
            PreparedStatement insertPs = conn.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {

        // Thiết lập tham số tên thương hiệu cho câu lệnh SELECT
        selectPs.setString(1, brandName);

        // Thực hiện câu lệnh SELECT
        try (ResultSet rs = selectPs.executeQuery()) {
            if (rs.next()) {
                // Thương hiệu đã tồn tại, lấy id của nó
                brandId = rs.getInt("id");
            } else {
                // Thương hiệu không tồn tại, thêm mới
                insertPs.setString(1, brandName);
                int affectedRows = insertPs.executeUpdate();

                if (affectedRows > 0) {
                    // Lấy khóa được sinh ra (id của thương hiệu mới)
                    try (ResultSet generatedKeys = insertPs.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            brandId = generatedKeys.getInt(1);
                        }
                    }
                }
            }
        }

    } catch (SQLException e) {
        System.err.println("Lỗi khi tìm hoặc tạo id thương hiệu: " + e.getMessage());
    }

    return brandId;
}
public int findOrCreateSportsId(String sportsName) {
    String selectQuery = "SELECT id FROM Sports WHERE Sports_name = ?";
    String insertQuery = "INSERT INTO Sports (Sports_name) VALUES (?)";

    int sportsId = -1; // Giá trị mặc định nếu có lỗi xảy ra

    try (
            Connection conn = new DBContext().getConnection(); 
            PreparedStatement selectPs = conn.prepareStatement(selectQuery); 
            PreparedStatement insertPs = conn.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {

        // Thiết lập tham số tên môn thể thao cho câu lệnh SELECT
        selectPs.setString(1, sportsName);

        // Thực hiện câu lệnh SELECT
        try (ResultSet rs = selectPs.executeQuery()) {
            if (rs.next()) {
                // Môn thể thao đã tồn tại, lấy id của nó
                sportsId = rs.getInt("id");
            } else {
                // Môn thể thao không tồn tại, thêm mới
                insertPs.setString(1, sportsName);
                int affectedRows = insertPs.executeUpdate();

                if (affectedRows > 0) {
                    // Lấy khóa được sinh ra (id của môn thể thao mới)
                    try (ResultSet generatedKeys = insertPs.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            sportsId = generatedKeys.getInt(1);
                        }
                    }
                }
            }
        }

    } catch (SQLException e) {
        System.err.println("Lỗi khi tìm hoặc tạo id môn thể thao: " + e.getMessage());
    }

    return sportsId;
}
public int findOrCreateGenderId(String genderName) {
    String selectQuery = "SELECT id FROM Gender WHERE gender_name = ?";
    String insertQuery = "INSERT INTO Gender (gender_name) VALUES (?)";

    int genderId = -1; // Giá trị mặc định nếu có lỗi xảy ra

    try (
            Connection conn = new DBContext().getConnection(); 
            PreparedStatement selectPs = conn.prepareStatement(selectQuery); 
            PreparedStatement insertPs = conn.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {

        // Thiết lập tham số tên giới tính cho câu lệnh SELECT
        selectPs.setString(1, genderName);

        // Thực hiện câu lệnh SELECT
        try (ResultSet rs = selectPs.executeQuery()) {
            if (rs.next()) {
                // Giới tính đã tồn tại, lấy id của nó
                genderId = rs.getInt("id");
            } else {
                // Giới tính không tồn tại, thêm mới
                insertPs.setString(1, genderName);
                int affectedRows = insertPs.executeUpdate();

                if (affectedRows > 0) {
                    // Lấy khóa được sinh ra (id của giới tính mới)
                    try (ResultSet generatedKeys = insertPs.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            genderId = generatedKeys.getInt(1);
                        }
                    }
                }
            }
        }

    } catch (SQLException e) {
        System.err.println("Lỗi khi tìm hoặc tạo id giới tính: " + e.getMessage());
    }

    return genderId;
}
public void updateShoeById(String shoeIdStr, String productName, String productBrand, String productSports, String productDescription, String productPriceStr, String productDiscountStr, String productGender, String product_img) {
    // Convert price and discount from String to Money (or appropriate data type)
    double  productPrice = Double.parseDouble(productPriceStr);
    double productDiscount = Double.parseDouble(productDiscountStr);
    int shoeId = Integer.parseInt(shoeIdStr);
    // Find or create necessary IDs
    product_img = "img/img_Shoe/"+product_img;
    int brandId = findOrCreateBrandId(productBrand);
    int sportsId = findOrCreateSportsId(productSports);
    int genderId = findOrCreateGenderId(productGender);

    String updateShoeQuery = "UPDATE shoe SET shoe_name = ?, brand_id = ?, sports_id = ?, gender_id = ?, description = ?, price = ?, discount = ?, img = ?, updated_at = GETDATE() WHERE id = ?";

    try (
            Connection conn = new DBContext().getConnection(); 
            PreparedStatement updateShoePs = conn.prepareStatement(updateShoeQuery)) {

        // Set parameters for the update query
        updateShoePs.setString(1, productName);
        updateShoePs.setInt(2, brandId);
        updateShoePs.setInt(3, sportsId);
        updateShoePs.setInt(4, genderId);
        updateShoePs.setString(5, productDescription);
        updateShoePs.setDouble(6, productPrice); // Assuming Money is properly handled
        updateShoePs.setDouble(7, productDiscount); // Assuming Money is properly handled
        updateShoePs.setString(8, product_img);
        updateShoePs.setInt(9, shoeId);

        // Execute the update
        updateShoePs.executeUpdate();

    } catch (SQLException e) {
        System.err.println("Error updating shoe by ID: " + e.getMessage());
    }
}



public void updateShoeByShoeId(int shoeId, String name, String description, String brand, String sports, String gender, double price, double discount, String image) {
    String updateShoeQuery = "UPDATE shoe SET name = ?, description = ?, brand = ?, sports = ?, gender = ?, price = ?, discount = ?, image = ? WHERE id = ?";

    try (
        Connection conn = new DBContext().getConnection(); 
        PreparedStatement updateShoePs = conn.prepareStatement(updateShoeQuery)
    ) {
        // Set parameters for the PreparedStatement
        updateShoePs.setString(1, name);
        updateShoePs.setString(2, description);
        updateShoePs.setString(3, brand);
        updateShoePs.setString(4, sports);
        updateShoePs.setString(5, gender);
        updateShoePs.setDouble(6, price);
        updateShoePs.setDouble(7, discount);
        updateShoePs.setString(8, image);
        updateShoePs.setInt(9, shoeId);

        // Execute the update
        int rowsAffected = updateShoePs.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("Shoe updated successfully.");
        } else {
            System.out.println("No shoe found with the given ID.");
        }
    } catch (SQLException e) {
        System.err.println("Error updating shoe by product ID: " + e.getMessage());
    }
}


    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
    dao.updateShoeById("1", "quanaaa", "Nike Sportswear", "Lifestyles", "The radiance lives on in the Nike Air Force 107, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine. Style: CW2288-111", "200.0", "0.0", "male", "abc");
//      List<ProductUpdate> list = dao.getProductsByShoeId(1);
//        System.out.println(list.size()+list.toString());
    }
}
