package com.tech.db;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBcon {

	public static Connection getConnection() throws Exception {
		/*Class.forName("oracle.jdbc.driver.OracleDriver");

		//접속
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="green";
		String pw="123456";
		Connection con=DriverManager.getConnection(url,user,pw);*/
		Context context=new InitialContext();
		DataSource dataSource=(DataSource)context.lookup("java:comp/env/jdbc/noticeOrcl");
		Connection con=dataSource.getConnection();
	
				return con;
	}
}
