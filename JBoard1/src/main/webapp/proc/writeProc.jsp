<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// multipart 전송 데이터 수신
	String savePath = application.getRealPath("/file");
	// 폴더 생성
	File mdfile = new File(savePath);
	if(!mdfile.exists()) mdfile.mkdirs();
	
	int maxSize = 1024 * 1024 * 10; // 최대 파일 업로드 허용량 10MB
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, savePath, maxSize, "UTF-8", policy);

	String title 	= mr.getParameter("title");
	String content  = mr.getParameter("content");
	String uid  	= mr.getParameter("uid");
	String fname 	= mr.getFilesystemName("fname");
	String regip	= request.getRemoteAddr();
	
	//System.out.println("fname : " + fname);
	//System.out.println("savePath : " + savePath);
	
	ArticleBean article = new ArticleBean();
	article.setTitle(title);
	article.setContent(content);
	article.setUid(uid);
	article.setfname(fname);
	article.setRegip(regip);
	
	
	ArticleDAO dao = ArticleDAO.getInstance();
	int parent = dao.insertArticle(article);

	
	// 파일을 첨부했으면 파일명 수정작업
	if(fname != null){
		
		// 파일명 수정
		int idx = fname.lastIndexOf(".");
		String ext = fname.substring(idx);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newFname = now + uid + ext; //20221026111323_uid.txt
		
		File oriFile = new File(savePath + "/" + fname);
		File newFile = new File(savePath + "/" + newFname);
		oriFile.renameTo(newFile);
		
		// 파일 테이블 저장
		dao.insertFile(parent, newFname, fname);
	}
	
	response.sendRedirect("/JBoard1/list.jsp");	
		
%>