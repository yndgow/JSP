<%@page import="config.DB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String stdNo = request.getParameter("stdNo");
	String stdName = request.getParameter("stdName");
	String stdHp = request.getParameter("stdHp");
	String stdYear = request.getParameter("stdYear");
	String stdAddress = request.getParameter("stdAddress");
	
	try{
		Connection conn = DB.getInstance().getConnection();
		
		String sql = "UPDATE `student` SET `stdName`=?, `stdHp`=?, `stdYear`=?, `stdAddress`=?";
			   sql+= "WHERE `stdNo`= ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, stdName);
		psmt.setString(2, stdHp);
		psmt.setString(3, stdYear);
		psmt.setString(4, stdAddress);
		psmt.setString(5, stdNo);
		
		psmt.executeUpdate();

		conn.close();
		psmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");

%>
