<%@page import="kr.co.college.bean.LectureBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.college.dao.LectureDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<LectureBean> llb = LectureDAO.getInstance().selectLectures();
	request.setAttribute("llb", llb);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>강좌관리</title>
	<!-- <script src="../js/toggleForm.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
      $().ready(function(){
    	  
    	  $(document).on('click', '.submit', function(e){
    		      		  
    		  let jsonData = {
    				  lecNo : $('input[name=lecNo]').val(),
    				  lecName : $('input[name=lecName]').val(),
    				  lecCredit : $('input[name=lecCredit]').val(),
    				  lecTime : $('input[name=lecTime]').val(),
    				  lecClass : $('input[name=lecClass]').val()
    		  };
    		  e.preventDefault();
    		  $.ajax({
   	    		 url:'./insertLectureProc.jsp',
   	    		 type:'post',
   	    		 data:jsonData,
   	    		 dataType:'json',
   	    		 success:function(data){
    	    			 //console.log(data);
    	    			$('.contentTr').remove();
    	    			let tag = "";
    	    			for (var i = 0; i < data.length; i++) {
    	    				tag += "<tr>";
        	    			tag += "<td>"+data[i].lecNo+"</td>";
        	    			tag += "<td>"+data[i].lecName+"</td>";
        	    			tag += "<td>"+data[i].lecCredit+"</td>";
        	    			tag += "<td>"+data[i].lecTime+"</td>";
        	    			tag += "<td>"+data[i].lecClass+"</td>";
        	    			tag += "</tr>";
						}
    	    			$('#contentTable').append(tag);
    	    			 
   	    		 },
   	    	  });  
    	  })
      })
    </script>
  </head>
  <body>
    <h3>강좌관리</h3>
    <a href="./lecture.jsp">강좌관리</a>
    <a href="./register.jsp">수강관리</a>
    <a href="./student.jsp">학생관리</a>

    <h4>강좌현황</h4>
    <button id="callForm">등록</button>
    <table border="1" id="contentTable">
      <tr>
        <th>번호</th>
        <th>강좌명</th>
        <th>학점</th>
        <th>시간</th>
        <th>강의장</th>
      </tr>
      <c:forEach items="${llb}" var="lb">
      	<tr class="contentTr">
	        <td><c:out value="${lb.lecNo}"></c:out> </td>
	        <td><c:out value="${lb.lecName}"></c:out> </td>
	        <td><c:out value="${lb.lecCredit}"></c:out> </td>
	        <td><c:out value="${lb.lecTime}"></c:out> </td>
	        <td><c:out value="${lb.lecClass}"></c:out> </td>
      	</tr>
      </c:forEach>
    </table>

    <div id="form" style="visibility: hidden">
      <h4>강좌등록</h4>
      <button id="closeForm">닫기</button>
      <table border="1">
        <tr>
          <td>번호</td>
          <td><input type="text" name="lecNo" /></td>
        </tr>
        <tr>
          <td>강좌명</td>
          <td><input type="text" name="lecName" /></td>
        </tr>
        <tr>
          <td>학점</td>
          <td><input type="text" name="lecCredit" /></td>
        </tr>
        <tr>
          <td>시간</td>
          <td><input type="text" name="lecTime" /></td>
        </tr>
        <tr>
          <td>강의장</td>
          <td><input type="text" name="lecClass" /></td>
        </tr>
        <tr>
          <td colspan="2" align="right"><button class="submit">추가</button></td>
        </tr>
      </table>
    </div>
  </body>
</html>
