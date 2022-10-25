<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://127.0.0.1:3306/java1db";
	String user = "root";
	String pass	= "1234";
	
	List<MemberBean> members = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "SELECT * FROM `member`";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			MemberBean member = new MemberBean();
			member.setUid(rs.getString(1));
			member.setName(rs.getString(2));
			member.setHp(rs.getString(3));
			member.setPos(rs.getString(4));
			member.setDep(rs.getInt(5));
			member.setRdate(rs.getDate(6));
			
			members.add(member);
		}
		
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member::list</title>
</head>
<body>
	<h3>Member List</h3>
	<a href="./register.jsp">member 등록</a>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>변경</th>
		</tr>
		<% for(MemberBean member : members){ %>
		<tr>
			<td><%= member.getUid() %></td>
			<td><%= member.getName() %></td>
			<td><%= member.getHp() %></td>
			<td><%= member.getPos() %></td>
			<td><%= member.getDep() %></td>
			<td><%= member.getRdate() %></td>
			<td><a href="./modify.jsp?uid=<%= member.getUid()%>">수정</a> <a
				href="./delete.jsp?uid=<%= member.getUid()%>">삭제</a></td>
		</tr>

		<%} %>
	</table>
</body>
</html>