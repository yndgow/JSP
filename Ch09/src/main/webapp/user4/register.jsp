<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>user4::register</title>
  </head>
  <body>
    <h3>user4 등록</h3>
    <a href="/Ch09/user4/list.jsp">목록으로</a>
    <form action="/Ch09/user4/register.jsp" method="post">
      <table border="1">
        <tr>
          <th>이름</th>
          <td><input type="text" name="name" /></td>
        </tr>
        <tr>
          <th>성별</th>
          <td>
            <label for="gender"><input type="radio" name="gender" value="1" />남</label>
            <label for="gender"><input type="radio" name="gender" value="2" />여</label>
          </td>
        </tr>
        <tr>
          <th>나이</th>
          <td><input type="number" name="age" /></td>
        </tr>
        <tr>
          <th>주소</th>
          <td><input type="text" name="addr" /></td>
        </tr>
        <tr>
          <td colspan="2" align="right">
            <input type="submit" value="등록" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
