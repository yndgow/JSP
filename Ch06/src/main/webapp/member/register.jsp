<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>member::register</title>
	</head>
	<body>
		<h3>Member 등록하기</h3>
		<a href="./list.jsp">목록보기</a>
		<form action="./registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="uid" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" placeholder="이름 입력"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="hp" placeholder="전화번호 입력"></td>
				</tr>
				<tr>
					<th>직급</th>
					<td><select name="pos">
							<option>사원</option>
							<option>대리</option>
							<option>과장</option>
							<option>차장</option>
							<option>부장</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>부서</th>
					<td><input type="text" name="dep" placeholder="부서 입력"></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input type="datetime" name="rdate" placeholder="입사일 입력"></td>
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