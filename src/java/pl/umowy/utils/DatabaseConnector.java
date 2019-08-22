
package pl.umowy.utils;


import java.sql.Connection;
import java.sql.DriverManager;


public class DatabaseConnector {
    
    
    private static Connection connection = null;

    public static Connection getConnection() {
        if (DatabaseConnector.connection == null) {            
            initConnection();
        }
        return DatabaseConnector.connection;

    }

    private static void initConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost/postgres";
            String user = "postgres";
            String pw = "postgres";
            DatabaseConnector.connection = DriverManager.getConnection(url, user, pw);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
