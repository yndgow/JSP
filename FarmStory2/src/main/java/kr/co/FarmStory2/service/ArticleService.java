package kr.co.FarmStory2.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


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

	public int insertArticle(ArticleVO vo) {
		return dao.insertArticle(vo);
	}
	
	public void insertFile(int parent, String newName, String oriName) {
		dao.insertFile(parent, newName, oriName);
	}
	
	public FileVO selectFile(String fno) {
		return dao.selectFile(fno);
	}
	
	public void updateFileDownload(String fno) {
		dao.updateFileDownload(fno);
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
		
}
	
	
	
	
	
	
	
	
	
	
