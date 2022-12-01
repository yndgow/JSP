package kr.co.FarmStory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/write.do")
public class WriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("group", req.getParameter("group"));
		req.setAttribute("cate", req.getParameter("cate"));
		req.setAttribute("groupNum", req.getParameter("groupNum"));
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/board/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String cate = req.getParameter("cate");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
	}
}
