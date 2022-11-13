package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User3Vo;

public class User3Dao extends DBHelper{
	private static User3Dao instance = new User3Dao();
	public static User3Dao getInstance() {
		return instance;
	}
	private User3Dao ()	{}
	
	public List<User3Vo> selectUsers() {
		
		List<User3Vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `user3`");
			while(rs.next()) {
				User3Vo user = new User3Vo();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setHp(rs.getString(3));
				user.setAge(rs.getInt(4));
				users.add(user);
			}
			close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public User3Vo selectUser(String uid) {
		User3Vo user = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `user3` WHERE `uid` = ?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				user = new User3Vo();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setHp(rs.getString(3));
				user.setAge(rs.getInt(4));
			}
			close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public void insertUser(User3Vo user) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT `user3` SET `uid`=?, `name`=?, `hp`=?, `age`=?");
			psmt.setString(1, user.getUid());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getHp());
			psmt.setInt(4, user.getAge());
			psmt.executeUpdate();			
			close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser(String uid) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("DELETE FROM `user3` WHERE `uid`= ?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateUser(User3Vo user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `user3` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?");
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getHp());
			psmt.setInt(3, user.getAge());
			psmt.setString(4, user.getUid());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
