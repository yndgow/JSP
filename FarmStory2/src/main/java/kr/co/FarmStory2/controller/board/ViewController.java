package kr.co.FarmStory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.FarmStory2.service.ArticleService;

@WebServlet("/board/view.do")
public class ViewController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("group", req.getParameter("group"));
		req.setAttribute("cateStr", req.getParameter("cateStr"));
		req.setAttribute("cate", req.getParameter("cate"));
		req.setAttribute("pg", req.getParameter("pg"));
		
		String no = req.getParameter("no");
		
		// 글 불러오기
		req.setAttribute("vo", service.selectArticle(no));
		
		// 댓글불러오기
		req.setAttribute("comments", service.selectComments(no));
		
		// 글 조회수 증가
		service.updateArticleHit(no);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/board/view.jsp");
		dispatcher.forward(req, resp);
	}
}
