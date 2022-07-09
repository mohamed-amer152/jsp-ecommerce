package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBoperation {
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/ecomerce_jsp";
	String user = "root";
	String password = "root";
	public PreparedStatement preparedStatement ;
	public PreparedStatement preparedStatement2 ;
	public ResultSet resultSet ;
	public ResultSet resultSet2 ;
	public Connection connection ;
	
	
	public Connection getconnection()
	{
		
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user,password);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		
		return connection ;
	}
	

}
