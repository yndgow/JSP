package kr.co.FarmStory2.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.FarmStory2.service.ArticleService;
import kr.co.FarmStory2.vo.ArticleVO;

@WebServlet("/board/commentWrite.do")
public class CommentWriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 댓글 작성
		resp.setContentType("application/x-json; charset=UTF-8");
		String content = req.getParameter("content");
		String uid = req.getParameter("uid");
		String parent = req.getParameter("parent");
		String regip = req.getRemoteAddr();
		
		ArticleVO vo = new ArticleVO();
		vo.setContent(content);
		vo.setUid(uid);
		vo.setParent(parent);
		vo.setRegip(regip);
		
		ArticleVO article = service.insertComment(vo);
		
		// 댓글수 증가
		service.updateCommentHit(parent);
		
		service.gsonTojson(article, resp);

	}
}
