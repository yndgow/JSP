<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@page import="bean.Book"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% // bookId 로 데이터 가져오기
	request.setCharacterEncoding("UTF-8");
	String bookId = request.getParameter("bookId");

	Book book = new Book();
	try{
		Connection conn = DBCP.getConnection();
		String sql = "SELECT * FROM `book` WHERE `bookId` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, bookId);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			book = new Book();
			book.setBookId(rs.getInt(1));
			book.setBookName(rs.getString(2));
			book.setPublisher(rs.getString(3));
			book.setPrice(rs.getInt(4));
			
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
	<title>도서수정</title>
	</head>
	<body>
		<h3>도서수정</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">도서목록</a>
		<form action="../proc/bookProc.jsp" method="post">
		<input type="hidden" name="opt" value="opt_modify">
			<table border="1">
				<tr>
					<td>도서번호</td>
					<td><input type="text" name="bookId" value="<%= book.getBookId() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="bookName" value="<%= book.getBookName() %>"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="publisher" value="<%= book.getPublisher() %>"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" value="<%= book.getPrice() %>"></td>
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