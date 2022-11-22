package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.vo.UserVO;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String success = req.getParameter("success");
		// 100 회원아님 or 로그인 실패
		// 201 로그아웃
		req.setAttribute("success", success);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		String saveUid = req.getParameter("saveUid");
		if(saveUid != null) {
			Cookie cookie = new Cookie("cookieUser", uid);
			cookie.setMaxAge(60*60*24);
			resp.addCookie(cookie);
		}
		
		UserVO vo = UserDAO.getInstance().selectUser(uid, pass);
		if(vo != null) {
			req.getSession().setAttribute("sessUser", vo);
			resp.sendRedirect("/JBoard2/list.do");
		}else {
			// 회원아님 or 로그인 실패
			resp.sendRedirect("/JBoard2/user/login.do?success=100");
		}
	}
}
