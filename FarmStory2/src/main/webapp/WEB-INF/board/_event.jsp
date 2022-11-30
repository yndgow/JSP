<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub">
  <div>
    <img src="../img/sub_top_tit${cateResult}.png" alt="" />
  </div>
  <section class="cate${cateResult}">
    <aside>
      <img src="/FarmStory2/img/sub_aside_cate${cateResult}_tit.png" alt="" />
      <ul>
      <c:forEach var="i" begin="1" end="1">
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
			<img src="/FarmStory2/img/sub_cate${cateResult}_lnb${i}.png" alt="" /> 
          </a>
        </li>
        </c:forEach>
      </ul>
    </aside>
    <article>
      <nav class="subNav">
      	      	<img src="../img/sub_nav_tit_cate${cateResult}_tit${cate}.png" alt="">
      	<p>HOME > ${groupStr} > <em>이벤트</em>
      		
      	</p>
      </nav>