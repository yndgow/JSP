package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/logout.do")
public class LogoutController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 세션 초기화
		HttpSession session= req.getSession();
		session.removeAttribute("sessUser");
		session.invalidate();
		// 쿠키 초기화
		Cookie[] cookies = req.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("cookieUser")) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				resp.addCookie(cookie);
				break;
			}
		}
		resp.sendRedirect("/JBoard2/user/login.do?success=201");
	}
}
