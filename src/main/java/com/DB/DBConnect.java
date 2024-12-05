package com.DB;

import java.sql.*;

public class DBConnect {
	private static Connection conn = null;

	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EBook", "root", "password");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public static void destroy() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
