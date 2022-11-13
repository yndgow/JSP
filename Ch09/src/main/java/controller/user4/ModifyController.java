package controller.user4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User4Dao;
import vo.User4Vo;

@WebServlet("/user4/modify.do")
public class ModifyController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("vo", User4Dao.getInstance().selectUser(req.getParameter("seq"))); 
		RequestDispatcher dispatcher = req.getRequestDispatcher("/user4/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User4Vo vo = new User4Vo();
		vo.setName(req.getParameter("name"));
		vo.setGender(req.getParameter("gender"));
		vo.setAge(req.getParameter("age"));
		vo.setAddr(req.getParameter("addr"));
		vo.setSeq(req.getParameter("seq"));
		
		User4Dao.getInstance().updateUser(vo);
		resp.sendRedirect("/Ch09/user4/list.do");
	}

}
