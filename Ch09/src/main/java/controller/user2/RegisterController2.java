package controller.user2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User2Dao;
import vo.User2Vo;

@WebServlet("/user2/register.jsp")
public class RegisterController2 extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user2/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User2Vo user = new User2Vo();
		user.setUid(req.getParameter("uid"));
		user.setName(req.getParameter("name"));
		user.setHp(req.getParameter("hp"));
		user.setAge(req.getParameter("age"));
		
		User2Dao.getInstance().insertUser(user);
		
		resp.sendRedirect("/Ch09/user2/list.jsp");
	}
}
