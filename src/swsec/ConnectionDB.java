package swsec;

import java.sql.*;

public class ConnectionDB {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://129.241.56.92:3306/gonzaloa_exercise1","gonzaloa_softsec","lillian");
		return conn;
	}
	
	public static Connection getUserConnection() throws ClassNotFoundException, SQLException {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		conn = (Connection) DriverManager.getConnection("jdbc:mysql://129.241.56.92:3306/gonzaloa_exercise1","gonzaloa_select","roros");
		return conn;
	}
}
