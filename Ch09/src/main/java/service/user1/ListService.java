package service.user1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListService {
	private static ListService instance = new ListService();
	public static ListService getInstance() {
		return instance;
	}
	private ListService() {}
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "/user1/list.jsp";
	}
}
