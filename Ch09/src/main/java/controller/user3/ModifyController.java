package controller.user3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User3Dao;
import vo.User3Vo;


@WebServlet("/user3/modify.jsp")
public class ModifyController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User3Vo user =  User3Dao.getInstance().selectUser(req.getParameter("uid"));
		req.setAttribute("vo", user);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user3/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User3Vo vo = new User3Vo();
		vo.setUid(req.getParameter("uid"));
		vo.setName(req.getParameter("name"));
		vo.setHp(req.getParameter("hp"));
		vo.setAge(req.getParameter("age"));
		
		User3Dao.getInstance().updateUser(vo);
		
		resp.sendRedirect("/Ch09/user3/list.jsp");
	}

}
