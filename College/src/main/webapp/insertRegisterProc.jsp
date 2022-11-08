<%@page import="kr.co.college.bean.RegisterBean"%>
<%@page import="kr.co.college.dao.RegisterDAO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.college.dao.LectureDAO"%>
<%@page import="kr.co.college.bean.LectureBean"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String regStdNo = request.getParameter("regStdNo");
	String stdName = request.getParameter("stdName");
	String regLecNo = request.getParameter("regLecNo");
	
	RegisterDAO dao = RegisterDAO.getInstance();
	int result = dao.insertRegister(regStdNo, Integer.parseInt(regLecNo));
	List<RegisterBean> lrb = null;
	
	if(result > 0){
		lrb = dao.selectRegisters();
		Gson gson = new Gson();
		String jsonData = gson.toJson(lrb);
		out.print(jsonData);
	}else{
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		out.print(json.toString());
	}
%>