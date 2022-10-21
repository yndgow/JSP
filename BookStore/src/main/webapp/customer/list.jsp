<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Customer"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String custId = request.getParameter("custId");

	List<Customer> customers = new ArrayList<>();
	try{
		if(custId != null){
			Connection conn = DBCP.getConnection();
			String sql = "DELETE FROM `customer` WHERE `custId`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, custId);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
			response.sendRedirect("./list.jsp");
		}else{
			Connection conn = DBCP.getConnection();
			String sql = "SELECT * FROM `customer`";
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				Customer customer = new Customer();
				customer.setCustId(rs.getInt(1));
				customer.setName(rs.getString(2));
				customer.setAddress(rs.getString(3));
				customer.setPhone(rs.getString(4));
				
				customers.add(customer);
			}
			rs.close();
			psmt.close();
			conn.close();
		}
			
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>고객목록</title>
	</head>
	<body>
		<h3>고객목록</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">고객등록</a>
		<table border="1">
			<tr>
				<th>고객번호</th>
				<th>고객명</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<% for(Customer customer : customers) { %>
			<tr>
				<td><%= customer.getCustId() %></td>
				<td><%= customer.getName() %></td>
				<td><%= customer.getAddress() %></td>
				<td><%= customer.getPhone() %></td>
				<td>
					<a href="./modify.jsp?custId=<%= customer.getCustId() %>">수정</a>
					<a href="./list.jsp?custId=<%= customer.getCustId() %>">삭제</a>
				</td>
			</tr>
			<% } %>
		</table>
	</body>
</html>