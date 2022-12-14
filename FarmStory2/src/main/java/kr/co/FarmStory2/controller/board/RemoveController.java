package kr.co.FarmStory2.controller.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.FarmStory2.service.ArticleService;

@WebServlet("/board/remove.do")
public class RemoveController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String pg = req.getParameter("pg");
		String no = req.getParameter("no");
		String file = req.getParameter("file");
		// 글, 댓글, 파일 DB 삭제
		String newName = service.deleteArticle(no, file);
		String path = req.getServletContext().getRealPath("/file");
		File newFile = new File(path+"/"+newName);
		if(newFile.exists()) newFile.delete();
		
		resp.sendRedirect("/FarmStory2/board/list.do?group="+group+"&cate="+cate+"&pg="+pg);
	}

}
