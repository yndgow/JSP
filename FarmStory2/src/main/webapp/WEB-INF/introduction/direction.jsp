<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_asideHello.jsp"/>
	<p><span class="directionSp">주소</span><br>
	부산광역시 남구 수영로 299 루미너스빌딩 10층
	
	</p><br>
	
	<p><span class="directionSp">찾아오시는 길</span></p><br>
      <div id="map" style="width:700px;height:500px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2c46ab555aacee11011685af17b72da"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(35.13713477588217, 129.09888802779906),
				level: 2
			};
	
			var map = new kakao.maps.Map(container, options);
			
			// 지도에 마커를 생성하고 표시한다
			var marker = new kakao.maps.Marker({
			    position: new kakao.maps.LatLng(35.13713477588217, 129.09888802779906), // 마커의 좌표
			    map: map // 마커를 표시할 지도 객체
			});
			
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
			
			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			var iwContent = '<div style="padding:5px;text-align:center;"><a href="https://map.kakao.com/link/map/그린컴퓨터아카데미,35.13713477588217,129.09888802779906" target="_blank" >그린컴퓨터아카데미</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(35.13713477588217, 129.09888802779906), //인포윈도우 표시 위치입니다
		    iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
			    map: map, // 인포윈도우가 표시될 지도
			    position : iwPosition, 
			    content : iwContent,
			    removable : iwRemoveable
			});
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
		</script>
    </article>
  </section>
</div>
<jsp:include page="../_footer.jsp"/>