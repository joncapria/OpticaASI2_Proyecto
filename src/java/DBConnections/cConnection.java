package DBConnections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class cConnection {

    private static final String MYSQL_URL = "jdbc:mysql://localhost:3306/optica";
    private static final String MYSQL_USER = "root";
    private static final String MYSQL_PASSWD = "toor";

    public static Connection conectar_ds() {
        Connection cnn = null;
        try {

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            cnn = DriverManager.getConnection(MYSQL_URL, MYSQL_USER, MYSQL_PASSWD);
            System.out.println("Conectado a " + MYSQL_URL);
        } catch (SQLException ex) {
            System.out.println("Error al conectarse a la base de datos: " + ex.getMessage());
        } finally {
            return cnn;
        }
    }

    public static void main(String args[]) {
        conectar_ds();
    }
}
