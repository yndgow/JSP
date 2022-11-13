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

@WebServlet("/user2/modify.do")
public class ModifyController2 extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User2Vo user =  User2Dao.getInstance().selectUser(req.getParameter("uid"));
		req.setAttribute("vo", user);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user2/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User2Vo vo = new User2Vo();
		vo.setUid(req.getParameter("uid"));
		vo.setName(req.getParameter("name"));
		vo.setHp(req.getParameter("hp"));
		vo.setAge(req.getParameter("age"));
		
		User2Dao.getInstance().updateUser(vo);
		
		resp.sendRedirect("/Ch09/user2/list.do");
	}

}
