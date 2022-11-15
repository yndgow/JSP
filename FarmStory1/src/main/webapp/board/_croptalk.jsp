<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String croptalk = request.getParameter("croptalk");
	String cate = request.getParameter("cate");
%>

<div id="sub">
  <div>
    <img src="../img/sub_top_tit3.png" alt="" />
  </div>
  <section class="cate3">
    <aside>
      <img src="../img/sub_aside_cate3_tit.png" alt="" />
      <ul>
        <li class="<%= cate.equals("story") ? "on" : "off" %>">
          <a href="./list.jsp?group=croptalk&cate=story">
            <img src="../img/sub_cate3_lnb1.png" alt="" />
          </a>
        </li>
        <li class="<%= cate.equals("grow") ? "on" : "off" %>">
          <a href="./list.jsp?group=croptalk&cate=grow">
            <img src="../img/sub_cate3_lnb2.png" alt="" />
          </a>
        </li>
        <li class="<%= cate.equals("school") ? "on" : "off" %>">
          <a href="./list.jsp?group=croptalk&cate=school">
            <img src="../img/sub_cate3_lnb3.png" alt="" />
          </a>
        </li>
      </ul>
    </aside>
    <article>
      <nav class="subNav">
      	<img src="../img/sub_nav_tit_cate3_<%=cate%>.png" alt="">
      	<p>HOME > 농작물이야기 >
      	<%	if(cate.equals("story")){ %>
				<em>농작물이야기</em>      			
      	<%  }else if(cate.equals("grow")){ %>	
      			<em>텃밭가꾸기</em>
    	<%  }else{ %>
      			<em>귀농학교</em>
   		<% } %>
      	</p>
      </nav>