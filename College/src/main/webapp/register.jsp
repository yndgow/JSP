<%@page import="kr.co.college.bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.college.dao.RegisterDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	List<RegisterBean> lrb = RegisterDAO.getInstance().selectRegisters();
	request.setAttribute("lrb", lrb);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>수강관리</title>
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
    	$(document).on('click', '#search', function(e){
    		e.preventDefault();
	  		  let jsonData = {
	  				regStdNo : $('input[name=regStdNo]').val()
    		  };
    		  
	  		  // 수강현황 검색
    		  $.ajax({
   	    		 url:'./selectRegisterRegStdNoProc.jsp',
   	    		 type:'post',
   	    		 data:jsonData,
   	    		 dataType:'json',
   	    		 success:function(data){
   	    			 console.log(data);
   	    			$('tr.contentTr').remove();
   	    			let tag = "";
   	    			for (var i = 0; i < data.length; i++) {
   	    				tag += "<tr>";
						tag += "<td>"+data[i].regStdNo+ "</td>";
						tag += "<td>"+data[i].stdName+ "</td>";
						tag += "<td>"+data[i].lecName+ "</td>";
						tag += "<td>"+data[i].regLecNo+ "</td>";
						tag += "<td>"+data[i].regMidScore+ "</td>";
						tag += "<td>"+data[i].regFinalScore+ "</td>";
						tag += "<td>"+data[i].regTotalScore+ "</td>";
						tag += "<td>"+data[i].regGrade+ "</td>";
						tag += "</tr>";
					}
   	    			$('table#contentTable').append(tag);
   	    		 },
   	    	  });
    		  
    		 
    	  });
    	
    	
    	$(document).on('click', '.submit', function(e){
    		e.preventDefault();
    		alert();
   		 	// 수강신청
   		 	let jsonData = {
   		 			regStdNo : $('input[name=regStdNo]').val(),
   		 			stdName  : $('input[name=stdName]').val(),
   		 			regLecNo : $('select[name=lecture]').val()
   		 	};
   		 	
	 		  $.ajax({
	 	    		 url:'./insertRegisterProc.jsp',
	 	    		 type:'post',
	 	    		 data:jsonData,
	 	    		 dataType:'json',
	 	    		 success:function(data){
	 	    			 console.log(data);
	 	    		 },
	    	  });  
    	});
      });
    </script>
  </head>
  <body>
    <h3>수강관리</h3>
    <a href="./lecture.jsp">강좌관리</a>
    <a href="./register.jsp">수강관리</a>
    <a href="./student.jsp">학생관리</a>

    <h4>수강현황</h4>
    <input type="text" name="regStdNo" />
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
	        <td><c:out value="${rb.regStdNo}"></c:out> </td>
	        <td><c:out value="${rb.stdName}"></c:out> </td>
	        <td><c:out value="${rb.lecName}"></c:out> </td>
	        <td><c:out value="${rb.regLecNo}"></c:out> </td>
	        <td><c:out value="${rb.regMidScore}"></c:out> </td>
	        <td><c:out value="${rb.regFinalScore}"></c:out> </td>
	        <td><c:out value="${rb.regTotalScore}"></c:out> </td>
	        <td><c:out value="${rb.regGrade}"></c:out> </td>
		</tr>
		
      </c:forEach>
	
    </table>

    <div id="form" style="visibility: hidden">
      <h4>수강신청</h4>
      <button id="closeForm">닫기</button>
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
              <option value="167">운영체제론</option>
              <option value="2">무역영문</option>
              <option value="239">세법개론</option>
              <option value="248">빅데이터 개론</option>
              <option value="253">컴퓨팅사고와 코딩</option>
              <option value="349">사회복지 마케팅</option>
              <option value="7">컴퓨터구조론</option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="right"><button class="submit">신청</button></td>
        </tr>
      </table>
    </div>
  </body>
</html>