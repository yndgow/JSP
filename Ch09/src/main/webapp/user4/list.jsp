<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user4::list</title>
</head>
<body>
	<h3>user4 목록</h3>
    <a href="/Ch09/user4/register.jsp">등록으로</a>
	<table border="1">
		<tr>
            <th>번호</th>
            <th>이름</th>
            <th>성별</th>
            <th>나이</th>
            <th>주소</th>
            <th>관리</th>
        </tr>
        <c:forEach items="${requestScope.users}" var="user">
        <tr>
           <td>${user.seq}</td>
           <td>${user.name}</td>
			<c:choose>
				<c:when test="${user.gender == 1}">
					<td>남</td>
				</c:when>
				<c:otherwise>
					<td>여</td>
				</c:otherwise>
			</c:choose>
           
           <td>${user.age}</td>
           <td>${user.addr}</td>
           <td>
			<a href="/Ch09/user4/modify.jsp?seq=${user.seq}">수정</a>
           	<a href="/Ch09/user4/delete.jsp?seq=${user.seq}">삭제</a>
           </td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>