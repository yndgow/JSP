<%@page import="kr.co.farmstory1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	UserBean sessUser = (UserBean)session.getAttribute("sessUser");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>팜스토리::메인</title>
    <link rel="stylesheet" href="/FarmStory1/css/style.css" />
    <link rel="stylesheet" href="/FarmStory1/user/css/style.css" />
    <link rel="stylesheet" href="/FarmStory1/board/css/style.css" />
  </head>
  <body>
    <div id="wrapper">
      <header>
        <a href="/FarmStory1/index.jsp">
          <img src="/FarmStory1/img/logo.png" alt="" />
        </a>
        <img src="/FarmStory1/img/head_txt_img.png" alt="" />
        <p>
          <a href="/FarmStory1/index.jsp">HOME |</a>
          <%if(sessUser == null){ %>
          <a href="/FarmStory1/user/login.jsp">로그인 |</a>
          <a href="/FarmStory1/user/terms.jsp">회원가입 |</a>
          <%}else{ %>
          <a href="/FarmStory1/user/proc/logout.jsp">로그아웃 |</a>
          <%} %>
          <a href="#">고객센터</a>
        </p>
        <ul class="gnb">
          <li><a href="/FarmStory1/introduction/hello.jsp">팜스토리소개</a></li>
          <li><a href="/FarmStory1/board/list.jsp?group=market&cate=1">장보기</a><img src="/FarmStory1/img/head_menu_badge.png" alt="" /></li>
          <li><a href="/FarmStory1/board/list.jsp?group=croptalk&cate=1">농작물이야기</a></li>
          <li><a href="/FarmStory1/board/list.jsp?group=event&cate=1">이벤트</a></li>
          <li><a href="/FarmStory1/board/list.jsp?group=community&cate=1">커뮤니티</a></li>
        </ul>
      </header>