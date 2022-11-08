<%@page import="com.google.gson.Gson"%>
<%@page import="kr.co.college.bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.college.dao.RegisterDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.college.dao.LectureDAO"%>
<%@page import="kr.co.college.bean.LectureBean"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String regStdNo = request.getParameter("regStdNo");
	
	List<RegisterBean> lrb = RegisterDAO.getInstance().selectRegister(regStdNo);
	
	Gson gson = new Gson();
	String jsonData = gson.toJson(lrb);
	
	out.print(jsonData);
	
%>