package kr.co.FarmStory2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.FarmStory2.service.UserService;
import kr.co.FarmStory2.vo.UserVO;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	UserService service = UserService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 100 회원아님 or 로그인 실패 201 로그아웃
		String success = req.getParameter("success");
		if(success == null) success = "200";
		req.setAttribute("success", success);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//String uid = req.getParameter("uid");
		//String pass = req.getParameter("pass");
		String uid = "qwqwqw";
		String pass = "1234qw!@";
		UserVO vo = service.selectUser(uid, pass);
		
		if(vo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("sessUser", vo);
		
			resp.sendRedirect("/FarmStory2/");
		}else {
			// 회원아님 or 로그인 실패
			resp.sendRedirect("/FarmStory2/user/login.do?success=100");
		}
	}
}
