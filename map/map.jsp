<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header include -->
<%@include file="../includes/header.jsp" %> 
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/pages/map.css">
<link rel="stylesheet" href="/resources/css/fontawesome.css">
<link rel="stylesheet" href="/resources/css/owl.css">
</head>

<!-- nav include -->
<%@ include file="../includes/nav.jsp"%>

    <div id="wrap" class="Font">
        <div id="mapBanner" class="mb150">
            <img src="/resources/images/map_banner.svg" alt="찾아오시는 길 배너 이미지">
        </div> <!-- id mapBanner end-->
        <div id="mapContent" class="mb150">
            <div class="container">
                <div class="mapContent">
                    <h1 class="h1 colorMain pointFont">찾아오시는 길</h1>
                    <div id="map" class="mt30"></div>
                </div>
            </div> <!-- container end-->
        </div> <!-- id map end-->
        
        <div id="mapTextBox" class="mb150">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <section class="mapBoxLeft">
                            <article class="mapLocation mb20">
                                <h2 class="h2 colorMain pointFont">술결 : 위치</h2>
                                <div class="mapLeftTop mt30">
                                    <span class="mapName fontPurple">도로명</span>
                                    <span class="mapNameEx fontTurquoise"> : 서울 구로구 경인로 557 삼영빌딩 4층</span>
                                </div>
                                <div class="mapLeftTop mt20">
                                    <span class="mapNumber fontPurple">지번</span>
                                    <span class="mapNumberEx fontTurquoise"> : 구로동 606-4 삼영빌딩 4층</span>
                                </div>
                            </article>
                            <hr class="mapHr">
                            <article class="mapInformation">
                                <h2 class="h2 colorMain pointFont">술결 : 정보</h2>
                                <div class="mapLeftBottom mt30">
                                    <span class="mapCall fontPurple">전화</span>
                                    <span class="mpapCallEx fontTurquoise"> : 02-3667-0008</span>
                                </div>
                                <div class="mapLeftBottom mt20">
                                    <span class="mapEmail fontPurple">이메일</span>
                                    <span class="mapEmailEx fontTurquoise"> : DtoD@gmail.com</span>
                                </div>
                            </article>
                        </section>
                    </div>
                    <div class="col">
                        <section class="mapBoxRight">
                            <h2 class="h2 colorMain pointFont">술결 : 교통수단</h2>
                            <article class="mapCarCon mt30">
                                <img class="mapImg" src="/resources/images/car_img.svg" alt="자가용 아이콘 이미지">
                                <span class="mapCar fontPurple">자가용</span>
                                <span class="mapCarEx fontTurquoise"> : [네비게이션] 구로역 술결</span>
                            </article>
                            <article class="mapSubCon mt30">
                                <img class="mapImg" src="/resources/images/sub_img.svg" alt="지하철 아이콘 이미지">
                                <span class="mapSub fontPurple">지하철</span>
                                <span class="mapSubEx fontTurquoise"> : 구로역 1호선 3번출구</span>
                            </article>
                            <article class="mapBusCon mt30">
                                <img class="mapImg" src="/resources/images/bus_img.svg" alt="버스 아이콘 이미지">
                                <span class="mapBus fontPurple">버스</span>
                                <span class="mapBusEx">
                                    <p class="mapBusExTop fontTurquoise"> : 구로역 하차 후 도보 6분</p>
                                    <p class="mapBusExBottom fontTurquoise"> : 구로역. 구로기계공구상가 하차 후 도보 3분</p>
                                </span>
                            </article>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- wrap end-->
    
    <!-- 카카오 지도: https://apis.map.kakao.com/web/sample/basicMarkerImage/ -->
    <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=d1a90f6e2d2c87203e7d445dabddbc67"></script>
    <script>
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.5030698, 126.8789856), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    var imageSrc = '/resources/images/map_marker.svg', // 마커이미지의 주소입니다    
        imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
        
    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(37.5030698, 126.8789856); // 마커가 표시될 위치입니다

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition, 
        image: markerImage // 마커이미지 설정 
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map); 

    </script>
    
<!-- footer include -->
<%@ include file="../includes/footer.jsp"%>