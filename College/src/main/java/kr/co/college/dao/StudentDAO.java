package kr.co.college.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
			rs.close();
			stmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lsb;
		
	}
	public List<StudentBean> insertStudent(StudentBean sb) {
		List<StudentBean> lsb = new ArrayList<>();
		try {
			Connection conn = DBCP.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_STUDENT);
			psmt.setString(1, sb.getStdNo());
			psmt.setString(2, sb.getStdName());
			psmt.setString(3, sb.getStdHp());
			psmt.setInt(4, sb.getStdYear());
			psmt.setString(5, sb.getStdAddress());
			psmt.executeUpdate();
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SQL.SELECT_STUDENTS);
			conn.commit();
			
			while(rs.next()) {
				StudentBean sb2 = new StudentBean();
				sb2.setStdNo(rs.getString(1));
				sb2.setStdName(rs.getString(2));
				sb2.setStdHp(rs.getString(3));
				sb2.setStdYear(rs.getInt(4));
				sb2.setStdAddress(rs.getString(5));
				lsb.add(sb2);
			}
			
			psmt.close();
			stmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return lsb;
	}
}
