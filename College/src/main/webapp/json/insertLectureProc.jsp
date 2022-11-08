<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
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
	
	LectureDAO dao = LectureDAO.getInstance();
	int result = dao.insertLecture(lb);
	List<LectureBean> llb = null;

	if(result > 0){
		llb = dao.selectLectures();
		Gson gson = new Gson();
		String jsonData = gson.toJson(llb);
		out.print(jsonData);
	}else{
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		out.print(json.toString());
	}
%>