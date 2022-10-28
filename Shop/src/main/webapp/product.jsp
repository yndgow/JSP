<%@page import="dao.ProductDao"%>
<%@page import="bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<ProductBean> products = ProductDao.getInstance().select_products();
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Shop::product</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(function(){
			// $("#orderForm").hide();
			
			$(".showForm").click(function(){
				let prodNo = $(this).val();
				$("#orderForm").show().find("input[name=orderProduct]").val(prodNo);
				//let prodNo = $(this).parents("tr").children("td:eq(0)").text();
				//$(".prodNo").val(prodNo);
			});
			
			$(".btnClose").click(function() {
				$("#orderForm").hide();
			})
			
			$(".btnSubmit").click(function(){
				let orderCount = $("input[name=orderCount]").val();
				let orderId = $("input[name=orderId]").val();
				if(orderCount && orderId){
					alert('주문성공!');	
				}else{
					alert('수량 or 주문자를 입력하세요');
				}
				
			});
			
			
/* 			$(".btnSubmit").click(function(){
				
				let jsonData = {
						"orderId":$("input[name=orderId]").val(),
						"orderProduct":$("input[name=orderProduct]").val(),
						"orderCount":$("input[name=orderCount]").val()
				};
				
				$.ajax({
					url:"./orderInsertProc.jsp",
					method:"post",
					data:jsonData,
					dataType:"json",
					success:function(data){
						if(data.result == 1){
							alert('주문완료!');
							location.href = "./order.jsp";	
						}else{
							alert('주문실패...');
						}
					},
				});
			}); */
		});
	</script>
	</head>
	<body>
		<h3>상품목록</h3>
		<a href="./customer.jsp">고객목록</a>
		<a href="./order.jsp">주문목록</a>
		<a href="./product.jsp">상품목록</a>
		<table border="1">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>재고량</th>
				<th>가격</th>
				<th>제조사</th>
				<th>주문</th>
			</tr>
			<% for(ProductBean product : products) { %>
			<tr>
				<td><%= product.getProdNo() %></td>
				<td><%= product.getProdName() %></td>
				<td><%= product.getStock() %></td>
				<td><%= product.getPrice() %></td>
				<td><%= product.getCompany() %></td>
				<td><button class="showForm" value="<%= product.getProdNo() %>">주문</button></td>
			</tr>
			<% } %>
		</table>
		
		<div id="orderForm" style="display: none">
			<h4>주문하기</h4>
			<form action="./order.jsp">
				<table border="1">
					<tr>
						<td>상품번호</td>
						<td>
							<input type="text" name="orderProduct" class="prodNo" value="" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>수량</td>
						<td>
							<input type="text" name="orderCount" value="" required="required">
						</td>
					</tr>
					<tr>
						<td>주문자</td>
						<td>
							<input type="text" name="orderId" value="" required="required">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<button type="submit" class="btnSubmit">주문하기</button>
						</td>
					</tr>
				</table>
				
			</form>
			<button class="btnClose">닫기</button>
		</div>
	</body>
</html>