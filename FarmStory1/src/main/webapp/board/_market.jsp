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
      </ul>
    </aside>
    <article>
      <nav class="subNav">
      	<img src="../img/sub_nav_tit_cate<%=result%>_tit<%=cate%>.png" alt="">
      	<p>HOME > 장보기 >
      	<%	if(cate.equals("1")){ %>
				<em>장보기</em>      			
   		<%} %>
      	</p>
      </nav>