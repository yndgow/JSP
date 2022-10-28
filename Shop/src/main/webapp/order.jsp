<%@page import="dao.OrderDao"%>
<%@page import="bean.OrderBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("orderId") != null){
		String orderId		 = request.getParameter("orderId");
		String orderProduct  = request.getParameter("orderProduct");
		String orderCount	 = request.getParameter("orderCount");
		
		int result = OrderDao.getInstance().insert_order(orderId, orderProduct, orderCount);
	}
	
	List<OrderBean> orders = OrderDao.getInstance().select_orders();
	
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Shop::order</title>
	</head>
	<body>
		<h3>주문목록</h3>
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		<table border="1">
			<tr>
				<th>주문번호</th>
				<th>주문자</th>
				<th>주문상품</th>
				<th>주문수량</th>
				<th>주문일</th>
			</tr>
			<% for(OrderBean order  : orders) { %>
			<tr>
				<td><%= order.getOrderNo() %></td>
				<td><%= order.getName() %></td>
				<td><%= order.getProdName() %></td>
				<td><%= order.getOrderCount() %></td>
				<td><%= order.getOrderDate().substring(0,16) %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>