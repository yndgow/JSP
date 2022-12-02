package kr.co.FarmStory2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.FarmStory2.service.ArticleService;
import kr.co.FarmStory2.vo.ArticleVO;

@WebServlet("/board/getLatest.do")
public class LatestController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/x-json; charset=UTF-8");
		String cate = req.getParameter("cate");
		List<ArticleVO> articles = service.selectArticleLatest(cate);
		
		service.gsonTojson(articles, resp);
	}

}
