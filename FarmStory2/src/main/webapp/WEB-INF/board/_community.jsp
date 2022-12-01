<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<div id="sub">
  <div>
    <img src="../img/sub_top_tit${groupNum}.png" alt="" />
  </div>
  <section class="cate${groupNum}">
    <aside>
      <img src="/FarmStory2/img/sub_aside_cate${groupNum}_tit.png" alt="" />
      <ul>
      <c:forEach var="i" begin="1" end="5">
      	<c:choose>
      		<c:when test="${cate eq i}">
      			<c:set var="ind" value="on"/>
      		</c:when>
      		<c:otherwise>
      			<c:set var="ind" value="off"/>
      		</c:otherwise>
      	</c:choose>
        <li class="${ind}">
          <a href="./list.do?group=${group}&cate=${i}">
			<img src="/FarmStory2/img/sub_cate${groupNum}_lnb${i}.png" alt="" /> 
          </a>
        </li>
        </c:forEach>
      </ul>
    </aside>
    <article>
      <nav class="subNav">
      	<img src="../img/sub_nav_tit_cate${groupNum}_tit${cate}.png" alt="">
      	<p>HOME > ${groupStr} >
      		<c:choose>
      			<c:when test="${cate eq 1}">
  					<em>공지사항</em>         	
      			</c:when>
      			<c:when test="${cate eq 2}">
      				<em>오늘의식단</em>
      			</c:when>
      			<c:when test="${cate eq 3}">
      				<em>나도요리사</em>
      			</c:when>
      			<c:when test="${cate eq 4}">
      				<em>1:1고객문의</em>
    			</c:when>
      			<c:when test="${cate eq 5}">
      				<em>자주묻는질문</em>
      			</c:when>
      		</c:choose>
      	</p>
      </nav>
			  			
      			
      			
   				
   				
