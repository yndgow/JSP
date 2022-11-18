<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Customer::modify</title>
  </head>
  <body>
    <h3>고객수정</h3>
    <a href="/Bookstore2">처음으로</a>
    <a href="./list.do">고객목록</a><br />
    <form action="./modify.do" method="post">
      <table border="1">
        <tr>
          <td>고객번호</td>
          <td><input type="text" name="custId" value="${customer.custId}" readonly/></td>
        </tr>
          <tr>
          <td>고객명</td>
          <td><input type="text" name="name" value="${customer.name}"/></td>
        </tr>
        <tr>
          <td>주소</td>
          <td><input type="text" name="address" value="${customer.address}"/></td>
        </tr>
        <tr>
          <td>휴대폰</td>
          <td><input type="text" name="phone" value="${customer.phone}"/></td>
        </tr>
        <tr>
          <td align="right" colspan="2">
            <input type="submit" value="수정" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
