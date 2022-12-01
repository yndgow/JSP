package kr.co.FarmStory2.controller.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import kr.co.FarmStory2.service.ArticleService;
import kr.co.FarmStory2.vo.FileVO;

@WebServlet("/board/download.do")
public class DownloadController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fno = req.getParameter("fno");
		FileVO vo = service.selectFile(fno); // 파일정보
		
		// 파일 다운로드수 
		service.updateFileDownload(fno);
		
		String savePath = req.getServletContext().getRealPath("/file");
		
		File newFile = new File(savePath + "/" + vo.getNewName());
        
        byte fileByte[] = FileUtils.readFileToByteArray(newFile);
        
        resp.setContentType("application/octet-stream");
        resp.setContentLength(fileByte.length);
        
        resp.setHeader("Content-Disposition", "attachment; fileName=" + URLEncoder.encode(vo.getOriName(),"UTF-8"));
        resp.setHeader("Content-Transfer-Encoding", "binary");
        resp.setHeader("Pragma", "no-cache");
		resp.setHeader("Cache-Control", "private");
        
        resp.getOutputStream().write(fileByte);
        resp.getOutputStream().flush();
        resp.getOutputStream().close();
	}
}
