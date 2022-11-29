package kr.co.FarmStory2.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.FarmStory2.dao.UserDAO;

public enum UserService {
	
	INSTANCE;
	
	UserDAO dao = UserDAO.getInstnce();
	
	public void jsonObj (String key, int value, HttpServletResponse resp) throws IOException {
		JsonObject json = new JsonObject();
		json.addProperty("result", value);
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
	
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	
	public int selectCountNick(String nick) {
		return dao.selectCountNick(nick);
	}
	
}
