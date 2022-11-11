package controller.user1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User1Dao;
import vo.User1Vo;

@WebServlet("/user1/modify.do")
public class ModifyContoller extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("vo", User1Dao.getInstance().selectUser(req.getParameter("uid")));
		
		RequestDispatcher dispacher = req.getRequestDispatcher("/user1/modify.jsp");
		dispacher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User1Vo vo = new User1Vo();
		vo.setUid(req.getParameter("uid"));
		vo.setName(req.getParameter("name"));
		vo.setHp(req.getParameter("hp"));
		vo.setAge(req.getParameter("age"));
		
		User1Dao.getInstance().updateUser(vo);
		
		// 리다이렉트
		resp.sendRedirect("/Ch09/user1/list.do");
	}
}
