package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conn {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/shopzoon";
	static final String USER = "root";
	static final String PASS = "";
	public static Connection DB() {
		Connection conn=null;
		try {
			Class.forName(JDBC_DRIVER); 
			conn = DriverManager.getConnection(DB_URL,USER,PASS); 
			return conn;
		} 
		catch (ClassNotFoundException | SQLException e) {  
			System.out.println("CONNECT FAILED");
			System.out.println(e.toString());
		}
		return null;
	}
}