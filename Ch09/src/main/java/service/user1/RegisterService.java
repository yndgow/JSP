package service.user1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterService {
	private static RegisterService instance = new RegisterService();
	public static RegisterService getInstance() {
		return instance;
	}
	private RegisterService() {}
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		return "/user1/register.jsp";
	}
}
