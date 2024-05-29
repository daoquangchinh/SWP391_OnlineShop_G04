package dal;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modal.User;

/**
 * UserDAO class provides CRUD operations for User entities.
 */
public class UserDAO extends DBContext{
    
   

    public User getUserByUsernamePassword(String userName, String password) {
        String sql = "SELECT * FROM [dbo].[User] WHERE username = ? AND password = ?";
        try ( PreparedStatement ps = getConnection().prepareStatement(sql)) {
            // Set the parameters for the prepared statement
            ps.setString(1, userName);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // Create and return a User object if a record is found
                    User user = new User();
                    user.setId(rs.getString("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setFullname(rs.getString("fullname"));
                    user.setGender(rs.getString("gender"));
                    user.setPhone(rs.getInt("phone"));
                    user.setEmail(rs.getString("email"));
                    user.setImg(rs.getString("img"));
                    user.setRoleId(rs.getInt("role_id"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;  // Return null if no record is found or an exception occurs
    }
    
    public boolean updatePassword(String email, String newPassword) {
    try {
        String sql = "UPDATE [dbo].[User] SET [password] = ? WHERE [email] = ?";
        try (PreparedStatement ps = getConnection().prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setString(2, email);
            int rowCount = ps.executeUpdate();
            return rowCount > 0;
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        return false;
    }
}

}
