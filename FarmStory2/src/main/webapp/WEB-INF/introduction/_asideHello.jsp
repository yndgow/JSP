<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub">
  <div>
    <img src="../img/sub_top_tit.png" alt="" />
  </div>
  <section class="cate1">
    <aside>
      <img src="/FarmStory2/img/sub_aside_cate1_tit.png" alt="" />
      
      <ul>
      
      
        <li class="<c:out value='${cateResult eq 1 ? "on" : "off"}'/>">
          <a href="./hello.do?group=introduction&cate=1">
			<img src="/FarmStory2/img/sub_cate1_lnb1.png" alt="" /> 
          </a>
        </li>
        <li class="<c:out value="${cateResult eq 2 ? 'on' : 'off'}"/>">
          <a href="./direction.do?group=introduction&cate=2">
			<img src="/FarmStory2/img/sub_cate1_lnb2.png" alt="" /> 
          </a>
        </li>
      </ul>
    </aside>
    <article>
      <nav class="subNav">
      	<img src="/FarmStory2/img/sub_nav_tit_cate_tit.png" alt="">
      	<p>HOME > 팜스토리소개 >
      		<c:choose>
      			<c:when test="${cateResult eq 1}">
      				<em>인사말</em>
      			</c:when>
      			<c:when test="${cateResult eq 2}">
      				<em>찾아오시는길</em>
      			</c:when>
      		</c:choose>
      	</p>
      </nav>