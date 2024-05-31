
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    
    public Connection getConnection()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
<<<<<<< HEAD
            String url = "jdbc:sqlserver://localhost:1433;databaseName= SWP";
            String username = "chinh";
            String password = "123";
=======
            String url = "jdbc:sqlserver://localhost:1433;databaseName= SWP391";
            String username = "sa";
            String password = "sa";
>>>>>>> quannvhe172350
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
             return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
//    public static void main(String[] args) {
//        System.out.println(new DBContext().getConnection());
//    }
}
