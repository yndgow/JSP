package kr.co.FarmStory2.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.co.FarmStory2.service.ArticleService;

@WebServlet("/board/download.do")
public class DownloadController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fno = req.getParameter("fno");
		service.selectFile(fno, req, resp);
		service.updateFileDownload(fno); // 파일 다운로드수 증가
		
	}
}
