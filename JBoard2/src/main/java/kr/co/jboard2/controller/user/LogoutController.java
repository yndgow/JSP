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
		HttpSession session= req.getSession();
		session.removeAttribute("sessUser");
		session.invalidate();
		Cookie cookies[] = req.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName() == "cookieUser") {
				cookie.setMaxAge(0);
				break;
			}
		}
		resp.sendRedirect("/JBoard2/user/login.do?success=201");
	}
}
