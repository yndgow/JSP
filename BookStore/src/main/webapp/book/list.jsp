<%@page import="config.DBCP"%>
<%@page import="bean.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String bookId = request.getParameter("bookId");
	List<Book> books = new ArrayList<>();
	try{ // 삭제
		if(bookId != null){
			Connection conn = DBCP.getConnection();
			String sql = "DELETE FROM `book` WHERE `bookId`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, bookId);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
			
			response.sendRedirect("./list.jsp");
		}else{ // 목록
			Connection conn = DBCP.getConnection();
			String sql = "SELECT * FROM `book`";
			PreparedStatement psmt = conn.prepareStatement(sql);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				Book book = new Book();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setPublisher(rs.getString(3));
				book.setPrice(rs.getInt(4));
				
				books.add(book);
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
	<title>도서목록</title>
	</head>
	<body>
		<div class="container">
		<h3>도서목록</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./register.jsp">도서등록</a>
		<table border="1">
			<tr>
				<th>도서번호</th>
				<th>도서명</th>
				<th>출판사</th>
				<th>가격</th>
				<th>관리</th>
			</tr>
			<% for(Book book : books){ %>
			<tr>
				<td><%= book.getBookId() %></td>
				<td><%= book.getBookName() %></td>
				<td><%= book.getPublisher() %></td>
				<td><%= book.getPrice() %></td>
				<td>
					<a href="./modify.jsp?bookId=<%= book.getBookId() %>">수정</a>
					<a href="./list.jsp?bookId=<%= book.getBookId() %>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
		</div>
	</body>
</html>