package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User1Vo;

public class User1Dao extends DBHelper{
	
	private static User1Dao instance = new User1Dao();
	public static User1Dao getInstance() {
		return instance;
	}
	private User1Dao() {}
	
	public void insertUser(User1Vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `user1` VALUES(?,?,?,?)");
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public User1Vo selectUser(String uid) {
		
		User1Vo vo = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `user1` WHERE `uid` = ?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new User1Vo();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public List<User1Vo> selectUsers() {
			
		List<User1Vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `user1`");
			while(rs.next()) {
				User1Vo vo = new User1Vo();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setAge(rs.getInt(4));
				users.add(vo);
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public void updateUser(User1Vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `user1` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?");
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getUid());
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("DELETE FROM `user1` WHERE `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}	
