package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User2Vo;

public class User2Dao extends DBHelper{
	
	private static User2Dao instance = new User2Dao();
	public static User2Dao getInstance() {
		return instance;
	}
	private User2Dao ()	{}
	
	public List<User2Vo> selectUsers() {
		
		List<User2Vo> users = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `user2`");
			while(rs.next()) {
				User2Vo user = new User2Vo();
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
	
	public User2Vo selectUser(String uid) {
		User2Vo user = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `user2` WHERE `uid` = ?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				user = new User2Vo();
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
	
	public void insertUser(User2Vo user) {
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT `user2` SET `uid`=?, `name`=?, `hp`=?, `age`=?");
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
			psmt = conn.prepareStatement("DELETE FROM `user2` WHERE `uid`= ?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateUser(User2Vo user) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `user2` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?");
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
