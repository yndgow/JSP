package kr.co.college.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.college.bean.RegisterBean;
import kr.co.college.db.DBCP;
import kr.co.college.db.SQL;

public class RegisterDAO {

	private static RegisterDAO instance = new RegisterDAO();
	private RegisterDAO () {}
	public static RegisterDAO getInstance() {
		return instance;
	}
	
	public List<RegisterBean> selectRegisters() {
		
		List<RegisterBean> lrb = new ArrayList<>(); 
		
		try {
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SQL.SELECT_REGISTERS);
			while(rs.next()) {
				RegisterBean rb = new RegisterBean();
				rb.setStdName(rs.getString(1));
				rb.setLecName(rs.getString(2));
				rb.setRegStdNo(rs.getString(3));
				rb.setRegLecNo(rs.getInt(4));
				rb.setRegMidScore(rs.getInt(5));
				rb.setRegFinalScore(rs.getInt(6));
				rb.setRegTotalScore(rs.getInt(7));
				rb.setRegGrade(rs.getString(8));
				lrb.add(rb);
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lrb;
	}
	public List<RegisterBean> selectRegister(String regStdNo) {
		
		List<RegisterBean> lrb = new ArrayList<>(); 
		
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_REGISTER_STDNO);
			psmt.setString(1, regStdNo);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				RegisterBean rb = new RegisterBean();
				rb.setStdName(rs.getString(1));
				rb.setLecName(rs.getString(2));
				rb.setRegStdNo(rs.getString(3));
				rb.setRegLecNo(rs.getInt(4));
				rb.setRegMidScore(rs.getInt(5));
				rb.setRegFinalScore(rs.getInt(6));
				rb.setRegTotalScore(rs.getInt(7));
				rb.setRegGrade(rs.getString(8));
				lrb.add(rb);
			}
			rs.close();
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lrb;
	}
	public int insertRegister(String regStdNo, int regLecNo) {
		
		int result = 0;
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_REGISTER);
			psmt.setString(1, regStdNo);
			psmt.setInt(2, regLecNo);
			result = psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
