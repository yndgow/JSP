<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>user::list</title>
	</head>
	<body>
		<h3>user 목록</h3>
		<a href="./register.do">user 등록하기</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<tr>
				<td>id</td>
				<td>name</td>
				<td>hp</td>
				<td>age</td>
				<td>
					<a href="./modify.do">수정</a>
					<a href="#">삭제</a>
				</td>
			</tr>
		</table>
	</body>
</html>