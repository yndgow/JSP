<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>customer::register</title>
	</head>
	<body>
		<h3>고객 등록</h3>
		<a href="./list.jsp">고객명단으로</a>
		<form action="./registerProc.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="custId" placeholder="아이디 입력"></td> 
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"></td> 
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" placeholder="휴대폰 입력"></td> 
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" placeholder="주소 입력"></td> 
				</tr>
				<tr>
					<td>가입일</td>
					<td><input type="date" name="rdate" placeholder="가입일 입력"></td> 
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="가입">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>
