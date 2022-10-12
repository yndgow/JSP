<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String pos = request.getParameter("pos");
	String dep = request.getParameter("dep");
	String rdate = request.getParameter("rdate");
	
	String host = "jdbc:mysql://127.0.0.1:3306/java1db";
	String user = "root";
	String pass	= "1234";
	
	MemberBean member = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "UPDATE `member` SET `name`=?, `hp`=?, `pos`=?, `dep`=?, `rdate`=?";
			   sql+= "WHERE `uid`=?";
			
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, pos);
		psmt.setString(4, dep);
		psmt.setString(5, rdate);
		psmt.setString(6, uid);
		
		psmt.executeUpdate();
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");

%>
