<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user::register</title>
	</head>
	<body>
		<h3>user 등록하기</h3>
		
		<a href="/Ch09/user1/list.jsp">목록보기</a>
		
		<form action="#" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"></td>
				</tr>
				<tr>			
					<td>휴대폰</td>
					<td><input type="text" name="hp" placeholder="휴대폰입력"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" placeholder="나이 입력"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>