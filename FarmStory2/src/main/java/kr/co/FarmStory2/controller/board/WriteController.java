package kr.co.FarmStory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.FarmStory2.service.ArticleService;
import kr.co.FarmStory2.vo.ArticleVO;

@WebServlet("/board/write.do")
public class WriteController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ArticleService service = ArticleService.INSTANCE;

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
		
		String savePath = req.getServletContext().getRealPath("/file");
		MultipartRequest mr = service.getMultiPartRequest(req, savePath);
		
		String group = mr.getParameter("group");
		String cate = mr.getParameter("cate");
		String fName = mr.getFilesystemName("fname");
		String uid = mr.getParameter("uid");
		String cateStr = service.getGroupInfo(group, cate).get("cateStr");
		
		ArticleVO vo = new ArticleVO();
		vo.setUid(uid);
		vo.setCate(cateStr);
		vo.setTitle(mr.getParameter("title"));
		vo.setContent(mr.getParameter("content"));
		vo.setFile(fName == null ? 0 : 1);
		vo.setRegip(req.getRemoteAddr());
		
		int parent  = service.insertArticle(vo);
		String newName = service.reNameFile(fName, uid, savePath);
		service.insertFile(parent, newName, fName);
		
		resp.sendRedirect("/FarmStory2/board/list.do?group="+group+"&cate="+cate+"&pg=1");
	}
}
