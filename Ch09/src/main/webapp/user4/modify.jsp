<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>user4::modify</title>
  </head>
  <body>
    <h3>user4 수정</h3>
    <a href="/Ch09/user4/list.do">목록으로</a>
    <form action="/Ch09/user4/modify.do" method="post">
      <table border="1">
        <tr>
          <th>번호</th>
          <td><input type="text" name="seq" readonly="readonly" value="${requestScope.vo.seq}"/></td>
        </tr>
        <tr>
          <th>이름</th>
          <td><input type="text" name="name" value="${vo.name}" /></td>
        </tr>
        <tr>
          <th>성별</th>
          <td>
            <label for="gender"><input type="radio" name="gender" value="1" <c:if test="${vo.gender eq 1}">checked</c:if> />남</label>
            <label for="gender"><input type="radio" name="gender" value="2" <c:if test="${vo.gender eq 2}">checked</c:if> />여</label>
          </td>
        </tr>
        <tr>
          <th>나이</th>
          <td><input type="number" name="age" value="${vo.age}"/></td>
        </tr>
        <tr>
          <th>주소</th>
          <td><input type="text" name="addr" value="${vo.addr}"/></td>
        </tr>
        <tr>
          <td colspan="2" align="right">
            <input type="submit" value="수정" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
