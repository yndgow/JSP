<%@page import="config.DB"%>
<%@page import="bean.StudentBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String stdNo = request.getParameter("stdNo");

	StudentBean sb = new StudentBean();
	
	try{
		Connection conn = DB.getInstance().getConnection();
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM `student` WHERE `stdNo`= '"+stdNo+"'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
		}
		
		conn.close();
		rs.close();
		stmt.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>student::modify</title>
	</head>
	<body>
		<h3>student 수정하기</h3>
		
		<a href="./list.jsp">목록보기</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="stdNo" value="<%= sb.getStdNo() %>" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdName"  value="<%= sb.getStdName() %>" ></td>
				</tr>
				<tr>			
					<td>휴대폰</td>
					<td><input type="text" name="stdHp"  value="<%= sb.getStdHp() %>" ></td>
				</tr>
				<tr>
					<td>학년</td>
					<td>
						<select name="stdYear">
						<%
							if(sb.getStdYear() == 1){
								out.print("<option selected>1</option>");
								out.print("<option>2</option>");
								out.print("<option>3</option>");
							}else if(sb.getStdYear() == 2){
								out.print("<option>1</option>");
								out.print("<option selected>2</option>");
								out.print("<option>3</option>");
							}else{
								out.print("<option>1</option>");
								out.print("<option>2</option>");
								out.print("<option selected>3</option>");
							}
						%>
						</select>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="stdAddress"  value="<%= sb.getStdAddress() %>" ></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>