<%@page import="kr.co.jboard1.bean.FileBean"%>
<%@page import="java.io.File"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String pg= request.getParameter("pg");
	
	// dao
	ArticleDAO dao = ArticleDAO.getInstance();
	// 게시글,댓글 삭제 
	int result1 = dao.deleteArticle(no);
	
	/// 게시글 파일 삭제
	// 삭제할 파일명 조회(newName), 파일 테이블 데이터 삭제 (DB)
	String fileName = dao.deleteFile(no);
	
	// 파일 실제 삭제 (Directory)
	if(fileName != null){
		String path = application.getRealPath("/file");
		File file = new File(path, fileName);
		
		if(file.exists()) file.delete();
	}
	
	// redirect
	if(result1 > 0) response.sendRedirect("/JBoard1/list.jsp?pg="+pg);
%>