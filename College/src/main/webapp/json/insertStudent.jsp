<%@page import="kr.co.college.dao.StudentDAO"%>
<%@page import="kr.co.college.bean.StudentBean"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.college.dao.LectureDAO"%>
<%@page import="kr.co.college.bean.LectureBean"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String stdNo = request.getParameter("stdNo");
	String stdName = request.getParameter("stdName");
	String stdHp = request.getParameter("stdHp");
	String stdYear = request.getParameter("stdYear");
	String stdAddress = request.getParameter("stdAddress");
	
	StudentBean sb = new StudentBean();
	sb.setStdNo(stdNo);
	sb.setStdName(stdName);
	sb.setStdHp(stdHp);
	sb.setStdYear(Integer.parseInt(stdYear));
	sb.setStdAddress(stdAddress);
	
	List<StudentBean> lsb = StudentDAO.getInstance().insertStudent(sb);
		
	Gson gson = new Gson();
	String jsonData = gson.toJson(lsb);
	out.print(jsonData);
%>