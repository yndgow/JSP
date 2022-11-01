<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pg		= request.getParameter("pg");
	String parent 	= request.getParameter("parent");
	String content 	= request.getParameter("content");
	String uid 		= request.getParameter("uid");
	String regip 	= request.getRemoteAddr();
	
	ArticleBean comment = new ArticleBean();
	comment.setParent(parent);
	comment.setContent(content);
	comment.setUid(uid);
	comment.setRegip(regip);
	
	ArticleDAO dao = ArticleDAO.getInstance();
	
	ArticleBean article = dao.insertComment(comment);
	
	//response.sendRedirect("/JBoard1/view.jsp?no=" + parent + "&pg=" + pg);

	/* Gson gson = new Gson();
	String jsonData = gson.toJson(comments); */
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", 1);
	json.addProperty("no", article.getNo());
	json.addProperty("parent", article.getParent());
	json.addProperty("nick", article.getNick());
	json.addProperty("date", article.getRdate());
	json.addProperty("content", article.getContent());
	String jsonData = json.toString();
	
	out.println(jsonData);
	

%>