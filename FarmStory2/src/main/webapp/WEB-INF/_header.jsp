<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>팜스토리::메인</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="/FarmStory2/css/style.css" />
    <link rel="stylesheet" href="/FarmStory2/css/user/style.css" />
    <link rel="stylesheet" href="/FarmStory2/css/board/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="/FarmStory2/js/user/postcode.js"></script>
  	<script src="/FarmStory2/js/user/terms.js"></script>
  	<script src="/FarmStory2/js/user/validation.js"></script>
  	<script src="/FarmStory2/js/user/emailAuth.js"></script>
  	<script src="/FarmStory2/js/board/comment.js"></script>
	
  </head>
  <body>
    <div id="wrapper">
      <header>
        <a href="/FarmStory2/index.do">
          <img src="/FarmStory2/img/logo.png" alt="" />
        </a>
        <img src="/FarmStory2/img/head_txt_img.png" alt="" />
        <p>
          <a href="/FarmStory2/index.do">HOME |</a>
          <c:if test="${sessUser eq null }">
          <a href="/FarmStory2/user/login.do">로그인 |</a>
          <a href="/FarmStory2/user/terms.do">회원가입 |</a>
          </c:if>
          <c:if test="${sessUser ne null }">
          <a href="/FarmStory2/user/proc/logout.do">로그아웃 |</a>
          </c:if>
          <a href="#">고객센터</a>
        </p>
        <ul class="gnb">
          <li><a href="/FarmStory2/introduction/hello.do?group=introduction&cate=1">팜스토리소개</a></li>
          <li><a href="/FarmStory2/board/list.do?group=market&cate=1">장보기</a><img src="/FarmStory2/img/head_menu_badge.png" alt="" /></li>
          <li><a href="/FarmStory2/board/list.do?group=croptalk&cate=1">농작물이야기</a></li>
          <li><a href="/FarmStory2/board/list.do?group=event&cate=1">이벤트</a></li>
          <li><a href="/FarmStory2/board/list.do?group=community&cate=1">커뮤니티</a></li>
        </ul>
      </header>