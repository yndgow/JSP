<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>registerProc</title>
	</head>
	<body>
		<h3>사용자 확인</h3>
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		
		<jsp:useBean id="user2" class="bean.User2Bean">
			<jsp:setProperty property="name" name="user2"/>
			<jsp:setProperty property="age" name="user2"/>
			<jsp:setProperty property="hp" name="user2"/>
			<jsp:setProperty property="addr" name="user2"/>
		</jsp:useBean>
		
		<p>
			이름 : <%= user2.getName() %> <br/>
			나이 : <%= user2.getAge() %> <br/>
			휴대폰 : <%= user2.getHp() %> <br/>			
			주소 : <%= user2.getAddr() %> <br/>
		</p>
		
		<a href="../3_useBean 액션태그.jsp">뒤로가기</a>
		
	</body>
</html>