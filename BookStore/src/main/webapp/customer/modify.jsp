<%@page import="config.DBCP"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.Customer"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% // custId로 data 불러오기
	request.setCharacterEncoding("UTF-8");
	String custId = request.getParameter("custId");

	Customer customer = new Customer();
	try{
		Connection conn = DBCP.getConnection();
		String sql = "SELECT * FROM `customer` WHERE `custId` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, custId);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			customer = new Customer();
			customer.setCustId(rs.getInt(1));
			customer.setName(rs.getString(2));
			customer.setAddress(rs.getString(3));
			customer.setPhone(rs.getString(4));
			
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
	<title>고객수정</title>
	</head>
	<body>
		<h3>고객수정</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">고객목록</a>
		<form action="../proc/customerProc.jsp">
		<input type="hidden" name="opt" value="opt_modify">
			<table border="1">
				<tr>
					<td>고객번호</td>
					<td><input type="text" name="custId" value="<%= customer.getCustId() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>고객명</td>
					<td><input type="text" name="name"  value="<%= customer.getName() %>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%= customer.getAddress() %>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="phone" value="<%= customer.getPhone() %>"></td>
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