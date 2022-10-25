<%@page import="config.DB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.StudentBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	List<StudentBean> sbs = new ArrayList<>();
	try{
		Connection conn = DB.getInstance().getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `student`");
		
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			
			sbs.add(sb);
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
	<title>student::list</title>
	</head>
	<body>
		<h3>Student List</h3>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>주소</th>
				<th>변경</th>
			</tr>
			<% for(StudentBean sb : sbs){ %>
				<tr>
					<td><%= sb.getStdNo() %></td>
					<td><%= sb.getStdName() %></td>
					<td><%= sb.getStdHp() %></td>
					<td><%= sb.getStdYear() %></td>
					<td><%= sb.getStdAddress() %></td>
					<td>
						<a href="./modify.jsp?stdNo=<%= sb.getStdNo() %>">수정</a>
						<a href="./delete.jsp?stdNo=<%= sb.getStdNo() %>">삭제</a>
					</td>
				</tr>
			<%} %>
		</table>
	</body>
</html>