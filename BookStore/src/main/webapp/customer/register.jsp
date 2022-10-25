<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.Customer"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>고객등록</title>
	</head>
	<body>
		<h3>고객등록</h3>
		<a href="../index.jsp">처음으로</a>
		<a href="./list.jsp">고객목록</a>
		<form action="../proc/customerProc.jsp" method="post">
		<input type="hidden" name="opt" value="opt_register">
			<table border="1">
				<tr>
					<td>고객명</td>
					<td><input type="text" name="name" placeholder="고객명 입력"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" placeholder="주소 입력"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="phone" placeholder="휴대폰 입력"></td>
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