
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    
    public Connection getConnection()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server

            String url = "jdbc:sqlserver://localhost:1433;databaseName= Test";

            String username = "sa";
            String password = "sa";

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
