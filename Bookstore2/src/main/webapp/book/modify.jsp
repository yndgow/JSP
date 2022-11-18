<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Book::modify</title>
  </head>
  <body>
    <h3>도서수정</h3>
    <a href="/Bookstore2">처음으로</a>
    <a href="./list.do">도서목록</a><br />
    <form action="./modify.do" method="post">
      <table border="1">
		<tr>
          <td>도서번호</td>
          <td><input type="text" name="bookId" value="${book.bookId}" readonly/></td>
        </tr>
        <tr>
          <td>도서명</td>
          <td><input type="text" name="bookName" value="${book.bookName}"/></td>
        </tr>
        <tr>
          <td>출판사</td>
          <td><input type="text" name="publisher" value="${book.publisher}"/></td>
        </tr>
        <tr>
          <td>가격</td>
          <td><input type="text" name="price" value="${book.price}"/></td>
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
