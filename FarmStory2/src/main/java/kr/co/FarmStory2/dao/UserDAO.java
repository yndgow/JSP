package kr.co.FarmStory2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.FarmStory2.db.DBHelper;
import kr.co.FarmStory2.db.Sql;

public class UserDAO extends DBHelper{
	
	private static UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstnce() {
		return INSTANCE;
	}
	private UserDAO() {}
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	// psmt 기본
	public void insertExample() {
		try {
			logger.info("insertExample");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_TERMS);
			psmt.setString(1, null);
			psmt.executeUpdate();
			
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : ");
	}
	
	// stmt 기본
	public void selectExample() {
		try {
			logger.info("selectExample");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			while(rs.next()) {
				
			}
			
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	// 아이디 중복체크
	public int selectCountUid(String uid) {
		int result = 0;
		try {
			logger.info("selectCountUid");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_BY_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	// 아이디 중복체크
	public int selectCountNick(String nick) {
		int result = 0;
		try {
			logger.info("selectCountNick");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_BY_NICK);
			psmt.setString(1, nick);
			rs = psmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	public void insert() {}
	public void update() {}
	public void delete() {}
}
