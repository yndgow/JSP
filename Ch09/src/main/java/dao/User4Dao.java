package dao;

import java.util.ArrayList;
import java.util.List;

import db.DBHelper;
import vo.User4Vo;

public class User4Dao extends DBHelper{

	private static User4Dao instance = new User4Dao();
	public static User4Dao getInstance()	{
		return instance;
	}
	private User4Dao ()	{}
	
	public List<User4Vo> selectUsers(){
		List<User4Vo> users = new ArrayList<>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `user4`");
			while(rs.next()) {
				User4Vo vo = new User4Vo();
				vo.setSeq(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setGender(rs.getInt(3));
				vo.setAge(rs.getInt(4));
				vo.setAddr(rs.getString(5));
				users.add(vo);
			}
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public void insertUser(User4Vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT `user4` SET `name`=?, `gender`=?, `age`=?, `addr`=?");
			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getGender());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getAddr());
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public User4Vo selectUser(String seq) {
		User4Vo vo = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `user4` WHERE `seq`=?");
			psmt.setString(1, seq);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new User4Vo();
				vo.setSeq(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setGender(rs.getInt(3));
				vo.setAge(rs.getInt(4));
				vo.setAddr(rs.getString(5));
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public void updateUser(User4Vo vo) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `user4` SET `name`=?, `gender`=?, `age`=?, `addr`=? WHERE `seq`=?");
			psmt.setString(1, vo.getName());
			psmt.setInt(2, vo.getGender());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getAddr());
			psmt.setInt(5, vo.getSeq());
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteUser(String seq) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("DELETE FROM `user4` WHERE `seq`=?");
			psmt.setString(1, seq);
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
