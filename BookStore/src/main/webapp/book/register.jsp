<%@page import="config.DBCP"%>
<%@page import="bean.Book"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	// bookId 자동증가
	Book book = null;
	try{ 
		Connection conn = DBCP.getConnection();
		String sql = "SELECT `bookId` from `book` ORDER BY `bookId` DESC LIMIT 1";
		PreparedStatement psmt = conn.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			book = new Book();
			book.setBookId(rs.getInt(1));
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
	<title>도서등록</title>
	</head>
	<body>
		<h3>도서등록</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">도서목록</a>
		<form action="../proc/bookProc.jsp" method="post">
		<input type="hidden" name="opt" value="opt_register">
			<%-- <input type="hidden" name="bookId" value="<%= book.getBookId()+1 %>"> --%>
			<table border="1">
				<tr>
					<td>도서번호</td>
					<td><input type="text" name="bookId" value="<%= book.getBookId()+1 %>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><input type="text" name="bookName" placeholder="도서명 입력"></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="publisher" placeholder="출판사 입력"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" placeholder="가격 입력"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit" value="등록">
					</td>
				</tr>
			</table>		
		</form>
	</body>
</html>