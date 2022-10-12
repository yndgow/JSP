<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/java1db";
	String user = "root";
	String pass	= "1234";
	
	int result = 0;
	try{
		// 1단계
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계
		String sql = "UPDATE `user3` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=? ";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, age);
		psmt.setString(4, uid);

		
		// 4단계
		result = psmt.executeUpdate();
		
		// 5단계
		// 6단계
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	
	//response.sendRedirect("./list.jsp");
%>
<script>
	<%
		if(result != 0){
	%>
	
	alert("성공");
	location.href="./list.jsp"
	
	<%
	}else{
	%>
	alert("실패");
	location.href="./list.jsp"	
	<%
	}
	%>
</script>
