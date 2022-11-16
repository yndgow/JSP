<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String group = request.getParameter("group");
	String [] arr = {"introduce","market","croptalk", "event", "community"};
	int result = 0;
	for(int i=0; i<arr.length; i++){
		if(arr[i].equals(group)){
			result = i+1;	
		}
	}
	String cate = request.getParameter("cate");
%>

<div id="sub">
  <div>
    <img src="../img/sub_top_tit<%=result%>.png" alt="" />
  </div>
  <section class="cate<%=result%>">
    <aside>
      <img src="../img/sub_aside_cate<%=result%>_tit.png" alt="" />
      <ul>
        <li class="<%=cate.equals("1")  ? "on" : "off" %>">
          <a href="./list.jsp?group=<%=group%>&cate=1">
            <img src="../img/sub_cate<%=result%>_lnb1.png" alt="" />
          </a>
        </li>
        <li class="<%=cate.equals("2") ? "on" : "off" %>">
          <a href="./list.jsp?group=<%=group%>&cate=2">
            <img src="../img/sub_cate<%=result%>_lnb2.png" alt="" />
          </a>
        </li>
        <li class="<%=cate.equals("3") ? "on" : "off" %>">
          <a href="./list.jsp?group=<%=group%>&cate=3">
            <img src="../img/sub_cate<%=result%>_lnb3.png" alt="" />
          </a>
        </li>
      </ul>
    </aside>
    <article>
      <nav class="subNav">
      	<img src="../img/sub_nav_tit_cate<%=result%>_tit<%=cate%>.png" alt="">
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