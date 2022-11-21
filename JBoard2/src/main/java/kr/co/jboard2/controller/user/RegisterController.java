package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.vo.UserVO;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet  {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserVO vo = new UserVO();
		vo.setUid(req.getParameter("uid"));
		vo.setPass(req.getParameter("pass2"));
		vo.setName(req.getParameter("name"));
		vo.setNick(req.getParameter("nick"));
		vo.setEmail(req.getParameter("email"));
		vo.setHp(req.getParameter("hp"));
		//vo.setGrade(req.getParameter("grade"));
		vo.setZip(req.getParameter("zip"));
		vo.setAddr1(req.getParameter("addr1"));
		vo.setAddr2(req.getParameter("addr2"));
		vo.setRegip(req.getRemoteAddr());
		
		UserDAO.getInstance().insertUser(vo);
		
		resp.sendRedirect("/JBoard2/user/login.do");
		
	}
}
