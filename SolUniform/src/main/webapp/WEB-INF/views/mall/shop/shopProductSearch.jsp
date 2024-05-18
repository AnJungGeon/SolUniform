<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색목록</title>
<%-- bxSlider 라이브러리 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
#container { width: 1200px; margin: 0 auto;}

/* bxSlider의 타이틀*/
.search_kind_img {width: 40px;}

/* bxSlider */
.new_image { width: 200px; height: 300px; font-weight: normal;}
.new_image:hover { transform: scale(1.03);}


/* 중단 타이틀, 페이지 */
.search_img { width: 40px;}
.middle_title { position: relative; font-size: 24px; font-family: 'Sunflower', sans-serif;}
.middle_title>span { margin-left: 20px; position: absolute; top: 7px;}
.middle_page { text-align: right; margin-right: 60px; color: #0080ff;}
.middle_title>span>b { color: #0080ff;}
/* 상품 1개 영역 */
.box { width: 250px; height: 510px; display: inline-block; float: left; border: 1px solid #dee2e6;
margin: 15px; padding: 5px;}
.box span { display: inline-block;}
.p_image { width: 250px; height: 350px;}
.p_image:hover { transform: scale(1.03);}
.p_kind { font-weight: 700; color: #1e94be; margin-top: 5px;}
.p_name { font-size: 17px; font-weight: 700; margin-top: 5px; color: #495057;}
.p_name:hover { text-decoration: underline;}
.p_author { color: #868e98; margin-top: 5px;}
.p_com { color: #868e98;}
.p_price { font-size: 17px; font-weight: 700; margin-top: 5px;}
.p_price2{text-decoration: line-through; text-decoration-color:red; font-weight: 700;}
.p_price1,.p_price2,.p_price3 { font-size: 17px; font-weight: 700; margin-top: 5px; color: #868e98;}
.b_price { font-size: 17px; font-weight: 700; margin-top: 5px;}
.p_discount { font-size: 17px; font-weight: 700; color: #c84557;}
.pages{float:right; margin-right: 60px; color: #0080ff; font-size: 20px; margin-top: 10px;}





/* 페이징 영역 */
#paging { margin-top: 20px; margin-bottom: 30px; text-align: center; font-weight: 700; clear:both;}
.pbox { display: inline-block; width: 22px; height: 22px; border-radius: 10%;
margin: 0 5px; padding: 5px; background: #fff; color: #495057; border: 2px solid #495057; text-align: center; }
.pbox:hover { background: #495057; color: #fff;}
.cbox { background: #495057; color: #fff; font-weight: 700;}
.arrow { width: 10px; height: 10px;}
</style>
<script>
$(document).ready(function() {
	// bxSlider - 신상품
	$('.bx-slider-new').bxSlider({
		auto: true,          // 자동 슬라이드
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

})
</script>
</head>
<body>
<div id="container">
	<%--상단 : shopTop.jsp--%>
	<div class="header">
		<header>
			<jsp:include page="../common/shopTop.jsp"/>
		</header>
	</div>
	
	<%--중단 : 검색결과 --%>
	<div class="main">	
		<main>
		<%--  검색어 관련 추천 상품 (상품 분류별 10개씩) : bxSlider 사용 --%>
		<article>
		<h3 class="middle_title">
			<img src="<spring:url value='/icon/search_kind.png'/>" class="search_kind_img">
			<span>${keyword }&nbsp;관련 상품을 추천해드려요</span>
		</h3>
		<div class="bx-slider-new">
		<c:forEach var="product" items="${productListNew }">
			<div>
				<a href="/mall/shop/shopContent?product_id=${product.product_id}"><img src="/sUniform_image/${ product.product_imageF }" class="new_image"></a>
			</div>	
		 </c:forEach>
		</div>
		</article>	
		<%-- 검색 타이틀 --%>
		<article>
			<h3 class="middle_title">
			<img src="<spring:url value='/icon/search_product.png'/>" class="search_img" width="50">
			<span><b>${keyword}</b> 검색 결과: <b>${paging.leagueCount }</b>개</span>
			<b class="pages">${ paging.currentPage }/${ paging.pageCount}</b>
			</h3>
		</article>
		<%--검색 목록 --%>
		<article>
		<c:forEach var="product" items="${productList }">
			<%--리그 분류 문자열 처리 --%>
			<c:set var="l_k" value="${l_k }"/>
			<c:set var="l_v" value="${l_v }"/>
			<%--상품 분류 문자열 처리 --%>
			<c:set var="p_k" value="${p_k }"/>
			<c:set var="p_v" value="${p_v }"/>
			<c:set var="buy_price" value="${buy_price }"/>
			<c:forEach var="i" begin="0" end="${fn:length(l_k)-1 }" step="1">
				<c:if test="${l_k[i] == product.league_kind }">
					<c:set var="strL_kinds" value="${str_Lkinds = l_v[i] }"/>	
				</c:if>
			</c:forEach>
			<c:forEach var="i" begin="0" end="${fn:length(p_k)-1 }" step="1">
				<c:if test="${p_k[i] == product.product_kind }">
					<c:set var="strP_kinds" value="${str_Pkinds = p_v[i] }"/>	
				</c:if>
			</c:forEach>
		
			<div class="box">
				<a href="/mall/shop/shopContent?product_id=${product.product_id }"><img src="/sUniform_image/${product.product_imageF }" class="p_image"></a><br>
				<span class="p_kind">[${ str_Lkinds }]</span><br>
				<a href="/mall/shop/shopContent?product_id=${product.product_id }"><span class="p_name">${product.product_name}</span></a><br>
				<span class="p_brand">${ product.brand_name}</span> | <span class="p_kind">${  str_Pkinds }</span><br> 
				<span class="p_price1">정가</span> <span class="p_price2"> <fmt:formatNumber value="${product.product_price }" pattern="#,###"/></span> <span class="p_price3">원</span><br>
				<span class="b_price">할인가&ensp;<fmt:formatNumber value=" ${product.product_price-(product.product_price * product.discount_rate/100)}" pattern="#,###"/></span> 원 (<span class="p_discount">${product.discount_rate }%</span>할인)
			</div>
		</c:forEach>
		</article>
		</main>
	</div>	
		<div class="clear"></div>
	<%-- 페이징 처리 --%>
	<div id="paging">
	<c:if test="${paging.leagueCount != 0 }">
		<%-- 처음 페이지 처리 --%>
		<c:if test="${paging.startPage > 10 }">
			<a href='/mall/shop/shopProductSearch?pageNum=1&keyword=${keyword }'><div class='pbox'><img src='../../icon/left-arrow-fast.png' class='arrow' title='처음 페이지'></div></a>
		</c:if>
		<%-- 이전 페이지 처리 --%>
		<c:if test="${paging.startPage > 10 }">
			<a href='/mall/shop/shopProductSearch?pageNum=${paging.startPage-paging.pageBlock}&keyword=${keyword }'><div class='pbox'><img src='../../icon/left-arrow.png' class='arrow' title='10페이지 이전'></div></a>
		</c:if>
		<%-- 페이지 블럭 처리 --%>
		<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
			<c:if test="${i == paging.currentPage}">
				<div class='pbox cbox'>${i}</div>
			</c:if>
			<c:if test="${i != paging.currentPage}">
				<a href='/mall/shop/shopProductSearch?pageNum=${i}&keyword=${keyword }'><div class='pbox'>${i}</div></a>
			</c:if>
		</c:forEach>
		<%-- 다음 페이지 처리 --%>
		<c:if test="${paging.endPage < paging.pageCount }">
			<a href='/mall/shop/shopProductSearch?pageNum=${paging.startPage+paging.pageBlock}&keyword=${keyword }'><div class='pbox'><img src='../../icon/right-arrow.png' class='arrow' title='10페이지 다음'></div></a>
		</c:if>
		<%-- 이전 페이지 처리 --%>
		<c:if test="${paging.endPage < paging.pageCount }">
			<a href='/mall/shop/shopProductSearch?pageNum=${paging.pageCount}&keyword=${keyword }'><div class='pbox'><img src='../../icon/right-arrow-fast.png' class='arrow' title='마지막 페이지'></div></a>
		</c:if>
	</c:if>
	</div>
		
	<%-- 하단 : shopBottom.jsp --%>
	<div class="footer">
		<footer>
		<jsp:include page="../common/shopBottom.jsp"/>
		</footer>
	</div>
	
	
</div>
</body>
</html>