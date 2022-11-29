package kr.co.FarmStory2.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.FarmStory2.db.DBHelper;
import kr.co.FarmStory2.db.Sql;
import kr.co.FarmStory2.vo.UserVO;

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
	
	// 회원가입
	public void insertUser(UserVO vo) {
		int result = 0;
		try {
			logger.info("insertUser start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getPass());
			psmt.setString(3, vo.getName());
			psmt.setString(4, vo.getNick());
			psmt.setString(5, vo.getEmail());
			psmt.setString(6, vo.getHp());
			//psmt.setInt(7, vo.getGrade());
			psmt.setString(7, vo.getZip());
			psmt.setString(8, vo.getAddr1());
			psmt.setString(9, vo.getAddr2());
			psmt.setString(10, vo.getRegip());
			result = psmt.executeUpdate();
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
	}
	
	// 로그인
	public UserVO selectUser(String uid, String pass) {
		UserVO vo = null;
		try {
			logger.info("selectUser...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new UserVO();
				vo.setUid(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setNick(rs.getString(4));
				vo.setEmail(rs.getString(5));
				vo.setHp(rs.getString(6));
				vo.setGrade(rs.getString(7));
				vo.setZip(rs.getString(8));
				vo.setAddr1(rs.getString(9));
				vo.setAddr2(rs.getString(10));
				vo.setRegip(rs.getString(11));
				vo.setRdate(rs.getString(12));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + vo);
		return vo;
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
	
	// 닉네임 중복체크
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
