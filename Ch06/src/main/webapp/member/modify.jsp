<%@page import="bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	String host = "jdbc:mysql://127.0.0.1:3306/java1db";
	String user = "root";
	String pass	= "1234";
	
	MemberBean member = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "SELECT * FROM `member` WHERE `uid`='"+uid+"' "; 
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			member = new MemberBean();
			member.setUid(rs.getString(1));
			member.setName(rs.getString(2));
			member.setHp(rs.getString(3));
			member.setPos(rs.getString(4));
			member.setDep(rs.getInt(5));
			member.setRdate(rs.getDate(6));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}


%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>member::modify</title>
	</head>
	<body>
		<h3>Member 수정하기</h3>
		<a href="./list.jsp">목록으로</a>
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="uid" value="<%= member.getUid() %>" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%= member.getName() %>"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="hp" value="<%= member.getHp() %>"></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><input type="text" name="pos" value="<%= member.getPos() %>"></td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="number" name="dep" value="<%= member.getDep() %>"></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input type="datetime" name="rdate" value="<%= member.getRdate() %>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>