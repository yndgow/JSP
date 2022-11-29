package kr.co.FarmStory2.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.FarmStory2.service.UserService;

@WebServlet("/user/checkUid.do")
public class CheckUidController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	UserService service = UserService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid = req.getParameter("uid");
		int result = service.selectCountUid(uid);
		service.jsonObj("result", result, resp);
		
	}
}
