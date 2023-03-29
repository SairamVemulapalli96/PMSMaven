package com.rama.pms.dao;
import com.rama.pms.bo.TenantSuggestion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TenantSuggestionDAO {
	
	static Connection conn = null;
	static String connURL1 = "jdbc:mysql://localhost:3306/PropertyManagementSystem?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true";
	static String connURL = "jdbc:mysql://localhost:3306/PropertyManagementSystem";
    static String userName = "root";
	static String password = "root";
 	//static String JDBC_DRIVER_CLASS = "com.mysql.jdbc.Driver";
	static String JDBC_DRIVER_CLASS = "com.mysql.cj.jdbc.Driver";
	
	
	
	public static void main(String... args)
	{
		try {
			connectToDB();
			System.out.println("Connection to the MySQL DB is successful!");
			System.out.println("conn : " + conn);
		}catch(Exception exception) {
			System.err.println("Exception occurred while making a connection..");
			System.err.println("Error Message :  " + exception.getMessage());
			exception.printStackTrace();//NOT recommended in PROD codebase, as it reveals the code structure
		}
		
	}

	public static void connectToDB() throws Exception
	{	
		Class.forName(JDBC_DRIVER_CLASS);
		conn = DriverManager.getConnection(connURL, userName, password);
	}

	public static int createTenantSuggestion(TenantSuggestion tenantsuggestion)
	{
		System.out.println("--- createTenantSuggestion - tenantsuggestion :: " + tenantsuggestion);
		
		String sql = "INSERT INTO TENANTSUGGESTIONS(EMAIL, TENANT_NAME, SUGGESTIONS)" + 
					" VALUES (?, ?, ?)";

		System.out.println("SQL Query :: " + sql);
		
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		int lastInsertedId=0, recordsInserted = 0;
		
		try {
			
			if(null==conn)
			{
				connectToDB();
			}
			
			System.out.println("AutoCommit ? : " + conn.getAutoCommit());
			/*conn.setAutoCommit(true);
			System.out.println("(2) AutoCommit ? : " + conn.getAutoCommit());*/
			
			pStmt = conn.prepareStatement(sql);
			
			pStmt.setString(1, tenantsuggestion.getEmail());
			pStmt.setString(2, tenantsuggestion.getTenantName());
			pStmt.setString(3, tenantsuggestion.getSuggestions());
			
			recordsInserted = pStmt.executeUpdate();
			//lastInsertedId = pStmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
			System.out.println("recordsInserted : " + recordsInserted);
			
		    rs = pStmt.executeQuery("SELECT LAST_INSERT_ID()");

		    if (rs.next()) {
		    	lastInsertedId = rs.getInt(1);
		    } else {
		        System.err.println("There was no record inserted in this session!");
		    }

		    System.out.println("Key returned from " +
		                       "'SELECT LAST_INSERT_ID()': " +
		                       lastInsertedId);
			
		}catch(SQLException sqlException) {
			System.err.println("SQL Exception occurred while reading the data from the Database Table");
			System.err.println("Message : " + sqlException.getMessage());
		}catch(Exception exception) {
			System.err.println("Exception occurred while reading the data from the Database Table");
			System.err.println("Message : " + exception.getMessage());
		} finally {
			try {
				if(null!=pStmt) pStmt.close();
				if(null!=conn) conn.close();
			}catch(SQLException sqlException) {
				System.err.println("Exception occurred while inserting the data into the Database Table");
				System.err.println("Message : " + sqlException.getMessage());
			}finally {
				try {
					if(null!=pStmt) pStmt.close();
					if(null!=conn) conn.close();
				}catch(SQLException sqlException) {
					System.err.println("Exception occurred while closing the JDBC Resources");
					System.err.println("Message : " + sqlException.getMessage());
				}
			}
		}
		
		System.out.println("Records Inserted with the Id : " + lastInsertedId);
		//System.out.println("Records Inserted  : " + recordsInserted);
		
		return recordsInserted;
	}
	
	public static List<TenantSuggestion> tenantSuggestionsList()
	{
		System.out.println("---tenantSuggestionsList() invoked!!");
		
		String sql = "SELECT * FROM TENANTSUGGESTIONS";
		
		Statement stmt = null;
		ResultSet rs = null;
		List<TenantSuggestion> tenantSuggestionsList = new ArrayList<>();
		
		System.out.println("Connection object : "+conn);
		
		try {
			if(null==conn||conn.isClosed())
			{
				System.out.println("Connection is closed. Creating a new one!!");
				connectToDB();
				System.out.println("Connection object : "+ conn);
			}			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next())
			{
				TenantSuggestion tenantsuggestion = new TenantSuggestion();
				
				tenantsuggestion.setTSId(rs.getInt("TSID"));
				tenantsuggestion.setEmail(rs.getString("EMAIL"));
				tenantsuggestion.setTenantName(rs.getString("TENANT_NAME"));
				tenantsuggestion.setSuggestions(rs.getString("SUGGESTIONS"));
				tenantSuggestionsList.add(tenantsuggestion);
			}
			
		}
		
		catch(SQLException sqlexception)
		{
			System.err.println("SQLExcpetion occured while reading the data");
			System.err.println("Message : +" +sqlexception.getMessage());
			sqlexception.printStackTrace();
		}
		
		catch(Exception exception)
		{
			System.err.println("SQLExcpetion occured while reading the data");
			System.err.println("Message : +" +exception.getMessage());
			exception.printStackTrace();
		}
		
		finally {
			try {
				if(null!=rs) rs.close();
				if(null!=stmt) stmt.close();
				if(null!=conn) conn.close();
			}
			catch(SQLException sqlexception)
			{
				System.err.println("SQLException occured while closing the resources");
				System.err.println("Message : " + sqlexception.getMessage());
				sqlexception.printStackTrace();
			}
		}
		
		return tenantSuggestionsList;
	}


}
