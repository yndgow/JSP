package kr.co.FarmStory2.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.FarmStory2.dao.ArticleDAO;
import kr.co.FarmStory2.vo.ArticleVO;
import kr.co.FarmStory2.vo.FileVO;
import kr.co.FarmStory2.vo.TermsVO;

public enum ArticleService {
	INSTANCE;
	
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	public TermsVO selectTerms() {
		return dao.selectTerms();
	}
	
	public List<ArticleVO> selectArticles(String cate, int start){
		return dao.selectArticles(cate, start);
	}
	
	public ArticleVO selectArticle(String no) {
		return dao.selectArticle(no);
	}

	public List<ArticleVO> selectComments(String parent) {
		return dao.selectComments(parent);
	}
	
	
	public int insertArticle(ArticleVO vo) {
		return dao.insertArticle(vo);
	}
	
	public void insertFile(int parent, String newName, String oriName) {
		dao.insertFile(parent, newName, oriName);
	}
	
	public ArticleVO insertComment(ArticleVO vo) {
		return dao.insertComment(vo);
	}
	
	public void updateFileDownload(String fno) {
		dao.updateFileDownload(fno);
	}
	
	public int updateCommentHit(String parent) {
		return dao.updateCommentHit(parent);
	}
	
	public void updateArticle(String no, String title, String content) {
		dao.updateArticle(no, title, content);
	}
	
	public void updateArticleHit(String no) {
		dao.updateArticleHit(no);
	}
	
	public String deleteArticle(String no, String file) {
		return dao.deleteArticle(no, file);
	}
	
	public List<ArticleVO> selectArticleLatest(String cate) {
		return dao.selectArticleLatest(cate);
	}
		
	
	
	
	
	public void selectFile(String fno, HttpServletRequest req, HttpServletResponse resp) throws IOException {
		FileVO vo = dao.selectFile(fno);
		
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
	
	public int getLastPageNum(int total) {
		int lastPageNum = 0;
		if(total % 10 == 0){
			lastPageNum = total / 10;
		}else{
			lastPageNum = total / 10 + 1;
		}
		return lastPageNum;
	}
	
	public int selectCountTotal(String cate) {
		return dao.selectCountTotal(cate);
	}
	public int selectCountTotalKeyword(String keyword) {
		return dao.selectCountTotalKeyword(keyword);
	}
	
	public int[] getPageGroupNum(int currentPage, int lastPageNum) {
		int currentPageGroup = (int)Math.ceil(currentPage / 10.0);
		int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
		int pageGroupEnd = currentPageGroup * 10;
		
		if(pageGroupEnd > lastPageNum){
			pageGroupEnd = lastPageNum;
		}
		int[] result = {pageGroupStart, pageGroupEnd};
		return result;
	}
	
	public int getPageStartNum(int total, int currentPage) {
		int start = (currentPage - 1) * 10;
		return total - start;
	}
	
	public int getCurrentPage(String pg) {
		int currentPage = 1;
		
		if(pg != null){
			currentPage = Integer.parseInt(pg);	
		}
		return currentPage;
	}
	
	public int getStartNum(int currentPage) {
		return (currentPage - 1) * 10;
	}
	
	public HashMap<String, String> getGroupInfo(String group, String cate) {
		String groupNum = null;
		String groupStr = null;
		String cateStr = null;
		
		switch (group) {
			case "introduction" : groupNum= "1"; groupStr="팜스토리소개"; break; 
			case "market" : groupNum = "2"; groupStr="장보기"; break; 
			case "croptalk" : groupNum = "3"; groupStr="농작물이야기"; break; 
			case "event" : groupNum = "4"; groupStr="이벤트"; break; 
			case "community" : groupNum = "5"; groupStr="커뮤니티"; break; 
		}
		
		if(group.equals("croptalk")) {
			switch (cate) {
			case "1": cateStr = "story"; break;
			case "2": cateStr = "grow"; break;
			case "3": cateStr = "school"; break;
			}
		}
		else if(group.equals("community")) {
			switch (cate) {
			case "1": cateStr = "notice"; break;
			case "2": cateStr = "diet"; break;
			case "3": cateStr = "cook"; break;
			case "4": cateStr = "qna"; break;
			case "5": cateStr = "faq"; break;
			}
		}
		else {
			cateStr = group;
		}
		
		HashMap<String, String> cateMap = new HashMap<>();
		cateMap.put("groupNum", groupNum);
		cateMap.put("groupStr", groupStr);
		cateMap.put("cateStr", cateStr);
		
		return cateMap;
	}
	
	public MultipartRequest getMultiPartRequest(HttpServletRequest req, String savePath) throws IOException {
		File mdfile = new File(savePath);
		if(!mdfile.exists()) mdfile.mkdirs();
		int maxSize = 1024 * 1024 * 10;
		MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		return mr; 
	}

	// 파일 이름 변경
	public String reNameFile(String fName, String uid, String savePath) {
		int idx = fName.lastIndexOf("."); // 확장자 인덱스
		String ext = fName.substring(idx); // 확장자 구분
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_"); // 날짜형식 
		String now = sdf.format(new Date()); // 오늘 날짜 포맷 적용
		String newName = now + uid + ext; // 새로운 파일 이름
		File oriFile = new File(savePath + "/" + fName); // 실제 저장된 파일 객체
		File newFIle = new File(savePath + "/" + newName); // 변경할 파일 객체
		oriFile.renameTo(newFIle);
		return newName;
	}
		
	public void jsonObj(String key, int value, HttpServletResponse resp) throws IOException {
		JsonObject json = new JsonObject();
		json.addProperty(key, value);
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
	public void gsonTojson(Object obj, HttpServletResponse resp) throws IOException {
		Gson gson = new Gson();
		String jsonData = gson.toJson(obj);
		PrintWriter writer = resp.getWriter();
		writer.print(jsonData);
	}
}
	
	
	
	
	
	
	
	
	
	
