<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.farmstory1.dao.UserDAO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	int result = UserDAO.getInstnce().selectCountNick(nick);
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json.toString());
%>