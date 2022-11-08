package kr.co.college.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.college.bean.LectureBean;
import kr.co.college.db.DBCP;
import kr.co.college.db.SQL;

public class LectureDAO {

	private static LectureDAO instance = new LectureDAO();
		
	public static LectureDAO getInstance() {
		return instance;
	}
	private LectureDAO() {}
	
	// 강의 목록
	public List<LectureBean> selectLectures() {
		
		List<LectureBean> llb = new ArrayList<>(); 
		
		try {
			Connection conn = DBCP.getConnection();
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(SQL.SELECT_LECTURES);
			
			while(rs.next()) {
				LectureBean lb = new LectureBean();
				lb.setLecNo(rs.getInt(1));
				lb.setLecName(rs.getString(2));
				lb.setLecCredit(rs.getInt(3));
				lb.setLecTime(rs.getInt(4));
				lb.setLecClass(rs.getString(5));
				llb.add(lb);
			}
			
			rs.close();
			stmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return llb;
	}
	
	// 강의 등록
	public int insertLecture(LectureBean lb) {
		int result = 0;
		try {
			Connection conn = DBCP.getConnection();
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_LECTURE);
			psmt.setInt(1, lb.getLecNo());
			psmt.setString(2, lb.getLecName());
			psmt.setInt(3, lb.getLecCredit());
			psmt.setInt(4, lb.getLecTime());
			psmt.setString(5, lb.getLecClass());
			result = psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
