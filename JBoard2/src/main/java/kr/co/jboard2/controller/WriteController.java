package kr.co.jboard2.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.vo.ArticleVO;

@WebServlet("/write.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String savePath = req.getServletContext().getRealPath("/file");
		File mdfile = new File(savePath);
		if(!mdfile.exists()) mdfile.mkdirs();
		
		int maxSize = 1024 * 1024 * 10;
		
		MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String uid = mr.getParameter("uid");
		String file = mr.getFilesystemName("file");
		
		ArticleVO vo = new ArticleVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		vo.setUid(uid);
		vo.setFile(file == null ? 0 : 1);
		vo.setRegip(req.getRemoteAddr());
		
		ArticleDAO dao = ArticleDAO.getInstance();
		int parent = dao.insertArticle(vo);
		
		if(file != null) {
			int idx = file.lastIndexOf(".");
			
			String ext = file.substring(idx);
			System.out.println("ext : "+ ext);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
			String now = sdf.format(new Date());
			System.out.println("now : " + now);
			
			String nFile= now + uid + ext;
			System.out.println("nFile : " + nFile);
			
			File oriFile = new File(savePath + "/" + file);
			File newFile = new File(savePath + "/" + nFile);
			oriFile.renameTo(newFile);
			
			// 파일테이블 저장
			dao.insertFile(parent, nFile, file);
			
		}
		resp.sendRedirect("/JBoard2/list.do");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
