<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Customer::register</title>
  </head>
  <body>
    <h3>고객등록</h3>
    <a href="/Bookstore2">처음으로</a>
    <a href="./list.do">고객목록</a><br />
    <form action="./register.do" method="post">
      <table border="1">
        <tr>
          <td>고객명</td>
          <td><input type="text" name="name"/></td>
        </tr>
        <tr>
          <td>주소</td>
          <td><input type="text" name="address"/></td>
        </tr>
        <tr>
          <td>휴대폰</td>
          <td><input type="text" name="phone"/></td>
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