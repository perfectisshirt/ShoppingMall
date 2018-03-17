package com.chenxi.model;

import java.sql.*;
public class ConnDB {

	private Connection conn = null;
	public Connection getConn() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping", "root", "woailiuzuqi1");
		return conn;
	}
}
