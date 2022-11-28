package kr.co.FarmStory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/list.do")
public class ListController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		req.setAttribute("group", group);
		req.setAttribute("cate", req.getParameter("cate"));
		int cateResult = 0;
		String groupStr = null;
		switch (group) {
			case "introduction" : cateResult = 1; groupStr="팜스토리소개"; break; 
			case "market" : cateResult = 2; groupStr="장보기"; break; 
			case "croptalk" : cateResult = 3; groupStr="농작물이야기"; break; 
			case "event" : cateResult = 4; groupStr="이벤트"; break; 
			case "community" : cateResult = 5; groupStr="커뮤니티"; break; 
		}
		req.setAttribute("groupStr", groupStr);
		req.setAttribute("cateResult", cateResult);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/board/list.jsp");
		dispatcher.forward(req, resp);
	}
}
