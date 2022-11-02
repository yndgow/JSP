<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no 		= request.getParameter("no");
	String content  = request.getParameter("content");
	
	int result = ArticleDAO.getInstance().updateComment(no, content);

	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	json.addProperty("no", no);
	json.addProperty("content", content);
	String jsonData = json.toString();
	
	out.print(jsonData);

%>
