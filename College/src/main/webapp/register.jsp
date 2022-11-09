<%@page import="kr.co.college.bean.LectureBean"%>
<%@page import="kr.co.college.dao.LectureDAO"%>
<%@page import="kr.co.college.bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.college.dao.RegisterDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<RegisterBean> lrb = RegisterDAO.getInstance().selectRegisters();
	request.setAttribute("lrb", lrb);
	
	List<LectureBean> llb = LectureDAO.getInstance().selectLectures();
	request.setAttribute("llb", llb);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>수강관리</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="./js/toggleForm.js"></script>

  </head>
  <body>
    <h3>수강관리</h3>
    <a href="./lecture.jsp">강좌관리</a>
    <a href="./register.jsp">수강관리</a>
    <a href="./student.jsp">학생관리</a>

    <h4>수강현황</h4>
    <input type="text" name="searchRegStdNo" />
    <button id="search">검색</button>
    <button id="callForm">등록</button>
    <table border="1" id="contentTable">
      <tr>
        <th>학번</th>
        <th>이름</th>
        <th>강좌명</th>
        <th>강좌코드</th>
        <th>중간시험</th>
        <th>기말시험</th>
        <th>총점</th>
        <th>등급</th>
      </tr>
     <c:forEach items="${lrb}" var="rb">
		<tr class="contentTr">
	        <td>${rb.regStdNo}</td>
	        <td>${rb.stdName}</td>
	        <td>${rb.lecName}</td>
	        <td>${rb.regLecNo}</td>
	        <td>${rb.regMidScore}</td>
	        <td>${rb.regFinalScore}</td>
	        <td>${rb.regTotalScore}</td>
	        <td>${rb.regGrade}</td>
		</tr>
      </c:forEach>
    </table>

    <div id="form" style="visibility: hidden">
      <h4>수강신청</h4>
      <button id="closeForm">닫기</button>
      <form id="resetForm">
	      <table border="1">
	        <tr>
	          <td>학번</td>
	          <td><input type="text" name="regStdNo" /></td>
	        </tr>
	        <tr>
	          <td>이름</td>
	          <td><input type="text" name="stdName" /></td>
	        </tr>
	        <tr>
	          <td>신청강좌</td>
	          <td>
	            <select name="lecture" id="lecture">
	              <option value="">강좌선택</option>
	              <c:forEach items="${llb}" var="lb">
	              	<option value="${lb.lecNo}">${lb.lecName}</option>
	              </c:forEach>
	            </select>
	          </td>
	        </tr>
	        <tr>
	          <td colspan="2" align="right"><button class="submitRegister">신청</button></td>
	        </tr>
	      </table>
      </form>
    </div>
  </body>
</html>