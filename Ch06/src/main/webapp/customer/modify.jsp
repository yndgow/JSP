<%@page import="config.DBCP"%>
<%@page import="bean.CustomerBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String custId = request.getParameter("custId");
	
	CustomerBean cb = new CustomerBean();
	
	try{
		Connection conn = DBCP.getConnection("dbcp_java1_shop");
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `customer` WHERE `custId`=?");
		psmt.setString(1, custId);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			cb.setCustId(rs.getString(1));
			cb.setName(rs.getString(2));
			cb.setHp(rs.getString(3));
			cb.setAddr(rs.getString(4));
			cb.setRdate(rs.getDate(5));
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>title</title>
	</head>
	<body>
		<h3>고객 정보 수정</h3>
		<a href="./list.jsp">고객명단으로</a>
		<form action="./modifyProc.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="custId" value="<%= cb.getCustId() %>" readonly></td> 
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= cb.getName() %>" required></td> 
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= cb.getHp() %>"></td> 
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%= cb.getAddr() %>"></td> 
				</tr>
				<tr>
					<td>가입일</td>
					<td><input type="date" name="rdate" value="<%= cb.getRdate() %>"></td> 
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