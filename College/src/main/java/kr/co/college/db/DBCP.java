package kr.co.college.db;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class DBCP {
	
	private static DataSource ds = null;
	
	public static Connection getConnection() throws NamingException, SQLException {
		
		if(ds == null) {
			ds = (DataSource)new InitialContext().lookup("java:comp/env/dbcp_java1_college");
		}
		return ds.getConnection(); // 커넥션 가져오기
	}
}
