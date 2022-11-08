<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.college.dao.LectureDAO"%>
<%@page import="kr.co.college.bean.LectureBean"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String lecNo = request.getParameter("lecNo");
	String lecName = request.getParameter("lecName");
	String lecCredit = request.getParameter("lecCredit");
	String lecTime = request.getParameter("lecTime");
	String lecClass = request.getParameter("lecClass");
	
	LectureBean lb = new LectureBean();
	lb.setLecNo(Integer.parseInt(lecNo));
	lb.setLecName(lecName);
	lb.setLecCredit(Integer.parseInt(lecCredit));
	lb.setLecTime(Integer.parseInt(lecTime));
	lb.setLecClass(lecClass);
	
	
	int result = LectureDAO.getInstance().insertLecture(lb);
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json.toString());
	
%>