<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %>
<div id="sub">
  <div>
    <img src="../img/sub_top_tit1.png" alt="" />
  </div>
  <section class="cate1">
    <aside>
      <img src="../img/sub_aside_cate1_tit.png" alt="" />
      <ul>
        <li>
          <a href="./hello.jsp">
            <img src="../img/sub_cate1_lnb1.png" alt="" />
          </a>
        </li>
        <li class="on">
          <a href="./direction.jsp">
            <img src="../img/sub_cate1_lnb2.png" alt="" />
          </a>
        </li>
      </ul>
    </aside>
    <article>
      <nav></nav>
      <span>내용</span>
    </article>
  </section>
</div>
<%@ include file="../_footer.jsp" %>