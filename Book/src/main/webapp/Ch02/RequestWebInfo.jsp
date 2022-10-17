<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>내장객체-request</title>
	</head>
	<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String sex = request.getParameter("sex");
		String[] favo = request.getParameterValues("favo");
		
		String favoStr = "";
		if(favo != null){
			for(String s : favo){
				favoStr += s + " ";
			}
		}
		String intro = request.getParameter("intro").replace("\r\n", "<br/>");
	
	%>
		<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
		<ul>
			<li>데이터 전송 방식 : <%= request.getMethod() %></li>
			<li>URL : <%= request.getRequestURL() %></li>
			<li>URI : <%= request.getRequestURI() %></li>
			<li>프로토콜 : <%= request.getProtocol() %></li>
			<li>서버명 : <%= request.getServerName() %></li>
			<li>서버포트 : <%= request.getServerPort() %></li>
			<li>클라이언트 IP 주소 : <%= request.getRemoteAddr() %></li>
			<li>쿼리스트링 : <%= request.getQueryString() %></li>
			<li>전송된 값 1 : <%= request.getParameter("eng") %></li>
			<li>전송된 값 2 : <%= request.getParameter("han") %></li>
		</ul>
		<ul>
			<li>아이디	 : <%= id %></li>
			<li>성별	 : <%= sex %></li>
			<li>관심사항 : <%= favoStr %></li>
			<li>자기소개 : <%= intro %></li>
		</ul>
	</body>
</html>