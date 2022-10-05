<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 파라미터 데이터 수신
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String addr = request.getParameter("addr");
	String gender = request.getParameter("gender");
	gender=gender.equals("1") ? "남" : "여"; 
	
	/* String hobby = request.getParameter("hobby"); */
	String []hobbies = request.getParameterValues("hobby");
	
	
	

%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원가입 처리</title>
	</head>
	<body>
		<h3>회원가입 처리 페이지</h3>
		<p>
			이름 	 : <%= name %> <br>
			생년월일	 : <%= birth %> <br>
			주소 	 : <%= addr %> <br>
			성별 	 : <%= gender %> <br>
			취미 	 : <%= String.join(", ", hobbies) %> <br>
		</p>
		<a href="../1_request.jsp">뒤로가기</a>
	</body>
</html>