<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 메인</title>
<%-- bxSlider 라이브러리 --%>
<%-- bxSlider 라이브러리 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<style>
#container { width: 1200px; margin: 0 auto;}
.clear{clear:"both"}
.main{margin-left: 4px;}
/* bxSlider, slick */
.new_image, .good_image { width: 200px; height: 300px; font-weight: normal;  }
.new_image:hover, .good_image:hover { transform: scale(1.03);}
.a3 { margin-bottom: 30px;}
.a4 { margin-bottom: 30px;}
.a1 {font-size: 25px; font-weight: 700; margin-bottom: 10px; }
.a2 {font-size: 25px; font-weight: 700; margin-bottom: 10px; margin-top: 50px;}
.player_image{width: 100%; height:440px;}
.bx-wrapper {border:0;background:#fbfbfb;box-shadow:none;}
.bx-slider-new, .bx-slider-good {margin-top: 10px;}
.a1>span, .a2>span{margin-bottom: 20px; margin-left:20px; }
.good_img, .new_img{width: 50px; height: 40px; margin-bottom: -7px;}
</style>
<script>
$(document).ready(function() {

	// bxSlider - 신상품
	$('.bx-slider-new').bxSlider({
		auto: false,          // 자동 슬라이드
		autoHover: true,     // 마우스를 올렸을 때 멈춤
		autoControls: true,  // 재생/정지 버튼 생성
		speed: 2000,         // 슬라이드 속도(2초)
		pause: 5000,         // 이미지의 노출 시간(5초)
		slideWidth: 230,     // 슬라이드 너비 
		slideHeight: 280,    // 슬라이드 높이
		slideMargin: 10,     // 슬라이드 사이의 간격
		maxSlides: 5,        // 슬라이드 최대 노출 개수
		minSlides: 1,        // 슬라이드 최소 노출 개수
		moveSlides: 3,       // 슬라이드 이동 개수
		touchEnabled: false, // touch 이벤트 제거 -> 클릭했을 때 해당 페이지로 이동하기 위해서
	})
	// bxSlider - 추천
	$('.bx-slider-good').bxSlider({
		auto: false,          // 자동 슬라이드
		autoHover: true,     // 마우스를 올렸을 때 멈춤
		autoControls: true,  // 재생/정지 버튼 생성
		speed: 2000,         // 슬라이드 속도(2초)
		pause: 5000,         // 이미지의 노출 시간(5초)
		slideWidth: 230,     // 슬라이드 너비 
		slideHeight: 280,    // 슬라이드 높이
		slideMargin: 10,     // 슬라이드 사이의 간격
		maxSlides: 5,        // 슬라이드 최대 노출 개수
		minSlides: 1,        // 슬라이드 최소 노출 개수
		moveSlides: 3,       // 슬라이드 이동 개수
		touchEnabled: false, // touch 이벤트 제거 -> 클릭했을 때 해당 페이지로 이동하기 위해서
	})
		// bxSlider - 선수
	$('.bx-slider-player').bxSlider({
		auto: true,          // 자동 슬라이드
		autoHover: true,     // 마우스를 올렸을 때 멈춤
		autoControls: true, // 재생/정지 버튼 생성
		pager: false,		//점 여부
		speed: 2000,         // 슬라이드 속도(2초)
		pause: 3000,         // 이미지의 노출 시간(3초)
		controls: false,	//화살표 여부
		slideWidth: 1200,     // 슬라이드 너비 
		slideHeight: 430,    // 슬라이드 높이
		slideMargin: 0,     // 슬라이드 사이의 간격
		maxSlides: 1,        // 슬라이드 최대 노출 개수
		minSlides: 1,        // 슬라이드 최소 노출 개수
		moveSlides: 1,       // 슬라이드 이동 개수
		touchEnabled: false, // touch 이벤트 제거 -> 클릭했을 때 해당 페이지로 이동하기 위해서
	})
	
})

</script>
</head>
<body>
<%--이미지 경로 인식, 슬라이더 제품상세 슬라이더,페이징 처리--%>
<%-- 쇼핑몰 메인: 3단 구성 -> 상단(고정), 중단(변경), 하단(고정) --%>
<div id="container">
<%-- 상단 : shopTop.jsp --%>
		<div class="header">
			<header><jsp:include page="../common/shopTop.jsp"/></header>
		</div>
	<div class="main">
		<main>
			<div class="bx-slider-player">
				<div><a href="/mall/shop/shopProductLeague?league_kind=120"><img src="<spring:url value='/player/ibra.jpg'/>" class="player_image"></a></div>					
				<div><a href="/mall/shop/shopProductLeague?league_kind=110"><img src="<spring:url value='/player/kim.jpg'/>" class="player_image"></a></div>		
				<div><a href="/mall/shop/shopProductLeague?league_kind=100"><img src="<spring:url value='/player/son.jpg'/>"class="player_image"></a></div>			
				<div><a href="/mall/shop/shopProductLeague?league_kind=130"><img src="<spring:url value='/player/lee.jpg'/>" class="player_image"></a></div>			
				<div><a href="/mall/shop/shopProductLeague?league_kind=140"><img src="<spring:url value='/player/real.jpg'/>" class="player_image"></a></div>
				<div><a href="/mall/shop/shopProductLeague?league_kind=110"><img src="<spring:url value='/player/bvb.jpg'/>" class="player_image"></a></div>
				<div><a href="/mall/shop/shopProductLeague?league_kind=120"><img src="<spring:url value='/player/inter.jpg'/>" class="player_image"></a></div>
				<div><a href="/mall/shop/shopProductLeague?league_kind=140"><img src="<spring:url value='/player/barca.jpg'/>" class="player_image"></a></div>
				<div><a href="/mall/shop/shopProductLeague?league_kind=100"><img src="<spring:url value='/player/city.jpg'/>" class="player_image"></a></div>
				<div><a href="/mall/shop/shopProductLeague?league_kind=200"><img src="<spring:url value='/player/world.jpg'/>" class="player_image"></a></div>
				<div><a href="mall/shop/shopProductLeague?league_kind=200"><img src="<spring:url value='/player/kor.jpg'/>" class="player_image"></a></div>				
			</div>
			<%-- 1. 신상품 - 각 분류별로 최근 등록일 순으로 2개씩을 노출 -> jQuery plug-in : bxSlider 사용 --%>
			<article class="a1">
				<img src="<spring:url value='/icon/product_new.png'/>" class="new_img"><span >신상품</span>
				<hr>
				<div class="bx-slider-new">
				<c:forEach var="product" items="${productListNew}">
						<div>
							<a href="/mall/shop/shopContent?product_id=${product.product_id }&product_kind=${product.product_kind}&league_kind=${product.league_kind}"><img src="/sUniform_image/${product.product_imageF}" class="new_image"></a>
						</div>	
				</c:forEach>
				</div>
			</article>
			<hr>
		
			<article class="a2">
					<%-- 3. 추천상품 - 각 분류별로 할인률 순으로 3개씩을 노출 -> jQuery plug-in : bxSlider 사용 --%>
					<img src="<spring:url value='/icon/product_good.png'/>" class="good_img"><span>추천상품</span>
					<hr>
				<div class="bx-slider-good">
				<c:forEach var="product" items="${productListGood }">
						<div>
							<a href="/mall/shop/shopContent?product_id=${product.product_id }&product_kind=${product.product_kind}&league_kind=${product.league_kind}"><img src="/sUniform_image/${product.product_imageF}" class="good_image"></a>
						</div>
				</c:forEach>  
				</div>
			</article>
			<hr>
		<%-- 4. 상품 전체 또는 상품 분류별로 상품 노출 --%>
			<%-- shopAll.jsp 페이지를 include 해서 사용 --%>
			<article class="a4"><jsp:include page="shopAll.jsp"/></article>
			
		</main>
		
	<div class="footer">
		<footer><jsp:include page="../common/shopBottom.jsp"/></footer>
	</div>	
	</div>
	</div>

</body>
</html>