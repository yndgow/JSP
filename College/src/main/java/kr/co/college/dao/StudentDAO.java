package kr.co.college.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.college.bean.StudentBean;
import kr.co.college.db.DBCP;
import kr.co.college.db.SQL;

public class StudentDAO {

	private static StudentDAO instance = new StudentDAO();
	private StudentDAO () {}
	public static StudentDAO getInstance() {
		return instance;
	}
	
	public List<StudentBean> selectStudents() {
		List<StudentBean> lsb = new ArrayList<>(); 
		
		try {
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(SQL.SELECT_STUDENTS);
			
			while(rs.next()) {
				StudentBean sb = new StudentBean();
				sb.setStdNo(rs.getString(1));
				sb.setStdName(rs.getString(2));
				sb.setStdHp(rs.getString(3));
				sb.setStdYear(rs.getInt(4));
				sb.setStdAddress(rs.getString(5));
				
				lsb.add(sb);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lsb;
		
	}
	public void insertStudent() {}
}
