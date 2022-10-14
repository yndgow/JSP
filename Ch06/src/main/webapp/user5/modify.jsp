<%@page import="config.DBCP"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.User5Bean"%>
<%@page import="config.DB"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	User5Bean ub = new User5Bean();
	
	try{
		Connection conn = DBCP.getConnection("dbcp_java1db");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `user5` WHERE uid='"+uid+"'");
		
		if(rs.next()){
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setBirth(rs.getString(3));
			ub.setGender(rs.getInt(4));
			ub.setAge(rs.getInt(5));
			ub.setAddress(rs.getString(6));
			ub.setHp(rs.getString(7));
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
	<title>user5::register</title>
	</head>
	<body>
		<h3>user5 수정</h3>
		<a href="./list.jsp">목록으로</a>
		
		<form action="./modifyProc.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" value="<%= ub.getUid() %>" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= ub.getName() %>"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth" value="<%= ub.getBirth() %>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
					<% if(ub.getGender() == 1){
						out.println("<label><input type='radio' name='gender' value='1' checked>남</label>");
						out.println("<label><input type='radio' name='gender' value='2' >여</label>");
					}else{
						out.println("<label><input type='radio' name='gender' value='1' >남</label>");
						out.println("<label><input type='radio' name='gender' value='2' checked>여</label>");
					}
					%>
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td>
						<input type="number" name="age" value="<%= ub.getAge() %>">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%= ub.getAddress() %>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= ub.getHp() %>"></td>
				</tr>
				<tr>
					
					<td colspan="2" align="right">
						<input type="submit" value="수정">
					</td>
				</tr>
			</table>
		
		</form>
	</body>
</html>