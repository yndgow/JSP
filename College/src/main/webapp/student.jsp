<%@page import="kr.co.college.bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.college.dao.StudentDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<StudentBean> lsb = StudentDAO.getInstance().selectStudents();
	request.setAttribute("lsb", lsb);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>학생관리</title>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const callForm = document.getElementById("callForm");
        const form = document.getElementById("form");
        callForm.addEventListener("click", function () {
          form.style.visibility = "visible";
        });
        const closeForm = document.getElementById("closeForm");

        closeForm.addEventListener("click", function () {
          form.style.visibility = "hidden";
        });
      });
    </script>
  </head>
  <body>
    <h3>학생관리</h3>
    <a href="./lecture.jsp">강좌관리</a>
    <a href="./register.jsp">수강관리</a>
    <a href="./student.jsp">학생관리</a>

    <h4>학생목록</h4>
    <button id="callForm">등록</button>
    <table border="1">
      <tr>
        <th>학번</th>
        <th>이름</th>
        <th>휴대폰</th>
        <th>학년</th>
        <th>주소</th>
      </tr>
      <c:forEach items="${lsb}" var="lb">
	      <tr>
	        <td><c:out value="${lb.stdNo}"></c:out></td>
	        <td><c:out value="${lb.stdName}"></c:out></td>
	        <td><c:out value="${lb.stdHp}"></c:out></td>
	        <td><c:out value="${lb.stdYear}"></c:out></td>
	        <td><c:out value="${lb.stdAddress}"></c:out></td>
	      </tr>
      </c:forEach>
    </table>

    <div id="form" style="visibility: hidden">
      <h4>학생등록</h4>
      <button id="closeForm">닫기</button>
      <table border="1">
        <tr>
          <td>학번</td>
          <td><input type="text" name="" /></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="" /></td>
        </tr>
        <tr>
          <td>휴대폰</td>
          <td><input type="text" name="" /></td>
        </tr>
        <tr>
          <td>학년</td>
          <td>
            <select name="" id="">
              <option value="1">1학년</option>
              <option value="2">2학년</option>
              <option value="3">3학년</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>주소</td>
          <td><input type="text" name="" /></td>
        </tr>
        <tr>
          <td colspan="2" align="right"><button>신청</button></td>
        </tr>
      </table>
    </div>
  </body>
</html>