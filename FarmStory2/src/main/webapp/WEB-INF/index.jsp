<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script src="/FarmStory2/js/recent.js"></script>
<script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
</script>
<main>
  <div class="slider">
    <img src="img/main_slide_img_tit.png" alt="팜스토리" />
    <img src="img/main_banner_bg.jpg" alt="오픈기념배경" />
    <img src="img/main_banner_img.png" alt="과일" />
    <img src="img/main_banner_tit.png" alt="그랜드오픈" />
    <img src="img/main_banner_txt.png" alt="오픈기념" />
  </div>
  
  <div class="quick">
    <div id="sub1">
      <a href="">
        <img src="img/main_banner_sub1_bg.jpg" alt="" />
        <img src="img/main_banner_sub1_tit.png" alt="" />
      </a>
    </div>
    <div id="sub2">
      <a href="">
        <img src="img/main_banner_sub2_bg.jpg" alt="" />
        <img src="img/main_banner_sub2_tit.png" alt="" />
      </a>
    </div>
  </div>
  
  <div class="latest">
    <div>
      <img src="img/main_latest1_tit.png" alt="" />
      <img src="img/main_latest1_img.jpg" alt="" />
      <table>
        <tr>
          <td>></td>
          <td>
			<a href="/FarmStory2/board/view.do?group=croptalk&cate=2&pg=1&no=">마토마</a>
          </td>
        </tr>
      </table>
    </div>
    <div>
      <img src="img/main_latest2_tit.png" alt="" />
      <img src="img/main_latest2_img.jpg" alt="" />
      <table>
        <tr>
          <td>></td>
          <td>
            <a href="/FarmStory2/board/view.jsp?group=croptalk&cate=3&pg=1&no=">토마토</a>
          </td>
        </tr>
      </table>
    </div>
    <div>
      <img src="img/main_latest3_tit.png" alt="" />
      <img src="img/main_latest3_img.jpg" alt="" />
      <table>
        <tr>
          <td>></td>
          <td>
            <a href="/FarmStory2/board/view.jsp?group=croptalk&cate=1&pg=1&no=">토마토마토</a>
          </td>
        </tr>
      </table>
    </div>
  </div>
  
  <div class="info">
    <div>
      <img src="img/main_sub2_cs_tit.png" alt="" />
      <img src="img/main_sub2_cs_img.png" alt="" />
      <img src="img/main_sub2_cs_txt.png" alt="" />
	  <img src="img/main_sub2_cs_bt1.png" alt="" class="info_img_community"/>
      <img src="img/main_sub2_cs_bt2.png" alt="" class="info_img_community"/>
      <img src="img/main_sub2_cs_bt3.png" alt="" class="info_img_community"/>
      <p class="time">
        평일: AM 09:00 ~ PM 06:00<br />
        점심: PM 12:00 ~ PM 01:00<br />
        토, 일요일, 공휴일 휴무
      </p>
    </div>
    <div>
      <img src="img/main_sub2_account_tit.png" alt="" />
      <p class="account">
        기업은행 123-456789-01-01-012<br />
        국민은행 01-1234-56789<br />
        우리은행 123-456789-01-01-012<br />
        하나은행 123-456789-01-01<br />
        예 금 주 (주)팜스토리
      </p>
    </div>
    <div>
		<div id="tabs">
		    <ul>
		        <li><a href="#tabs-1">공지사항</a></li>
		        <li><a href="#tabs-2">1:1 고객문의</a></li>
		        <li><a href="#tabs-3">자주묻는 질문</a></li>
		    </ul>
		    <div id="tabs-1">
		        <ul class="txt">
		            <img src="/FarmStory2/img/loading.gif" class="loading">
		        </ul>
		    </div>
		    <div id="tabs-2">
		        <ul class="txt">
		            <img src="/FarmStory2/img/loading.gif" class="loading">
		        </ul>
		    </div>
		    <div id="tabs-3">
		        <ul class="txt">
		            <img src="/FarmStory2/img/loading.gif" class="loading">
		        </ul>
		    </div>
		</div>
	</div>
  </div>
</main>
<jsp:include page="./_footer.jsp"/>