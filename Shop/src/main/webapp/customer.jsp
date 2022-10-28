<%@page import="bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<CustomerBean> customers = CustomerDao.getInstance().select_Customers();
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Shop::customer</title>
	</head>
	<body>
		<h3>고객목록</h3>
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
			<% for(CustomerBean customer : customers) { %>
			<tr>
				<td><%= customer.getCustId() %></td>
				<td><%= customer.getName() %></td>
				<td><%= customer.getHp() %></td>
				<td><%= customer.getAddr() %></td>
				<td><%= customer.getRdate() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>