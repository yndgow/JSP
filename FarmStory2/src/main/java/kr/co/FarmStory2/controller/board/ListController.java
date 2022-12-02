package kr.co.FarmStory2.controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.FarmStory2.service.ArticleService;
import kr.co.FarmStory2.vo.ArticleVO;

@WebServlet("/board/list.do")
public class ListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		HashMap<String, String> groupInfo = service.getGroupInfo(group, cate);
		
		req.setAttribute("groupStr", groupInfo.get("groupStr"));
		req.setAttribute("groupNum", groupInfo.get("groupNum"));
		
		String cateStr = groupInfo.get("cateStr");
		req.setAttribute("cateStr", cateStr);
		
		
		String pg = req.getParameter("pg");
		if(pg == null) pg = "1";
		req.setAttribute("pg", pg);
		String search = req.getParameter("search");
		int currentPage = service.getCurrentPage(pg);// 현재 페이지 번호
		
		int total = 0; // 전체 게시물 갯수 
		if(search == null || search.equals("")) {
			total = service.selectCountTotal(cateStr);
		}else {
			total = service.selectCountTotalKeyword(search);
			req.setAttribute("search", search);
		}
		int lastPageNum = service.getLastPageNum(total);// 마지막 페이지 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);// 페이지 그룹 start, end 번호
		int pageStartNum = service.getPageStartNum(total, currentPage);// 페이지 시작번호
		int start = service.getStartNum(currentPage);// 시작 인덱스
		
		req.setAttribute("lastPageNum", lastPageNum);		
		req.setAttribute("currentPage", currentPage);		
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		
		
		List<ArticleVO> articles = service.selectArticles(cateStr, start);
		if(articles != null) req.setAttribute("articles", articles);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/board/list.jsp");
		dispatcher.forward(req, resp);
	}
}
