<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	try{
	Connection conn = DBCP.getConnection("dbcp_java1db");
	PreparedStatement psmt = conn.prepareStatement("DELETE FROM `user5` WHERE `uid`=?");
	psmt.setString(1, request.getParameter("uid"));
	psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("./list.jsp");
%>