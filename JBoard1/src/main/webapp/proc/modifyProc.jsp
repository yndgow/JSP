<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	int result = ArticleDAO.getInstance().updateArticle(no, title, content);
	//System.out.println(result);
	if(result > 0) response.sendRedirect("/JBoard1/view.jsp?no="+no+"&pg="+pg);
	
%>