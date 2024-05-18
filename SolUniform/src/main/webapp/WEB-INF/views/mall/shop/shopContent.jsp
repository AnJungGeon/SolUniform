<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 내용</title>
<%-- bxSlider 라이브러리 --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style>

#container { width: 1200px; margin: 0 auto;}
.clear { clear:both;}
/*상품 내용 상단*/
.content_img {width: 48px;}
.c_t0{position: relative;}
.c_t0 div{position: absolute; left: 50px; top: 2px; color: #196ab3; font-size: 20px; font-weight: 700;
text-decoration: none;}

/*상품 내용*/
.content {float: left; margin-top: 20px; margin-bottom: 20px;}
.c_t1{width: 50%;}
.c_t2{width: 50%;}
/* 1구역 왼쪽 상단*/

.big_img {margin-bottom: 5px; margin-top: 40px;}
.small_img {padding: 1px; margin-right: 90px; margin-top:40px; cursor:pointer;}
.small {margin: 0 1px;}

/* 2, 3, 4구역*/
.d_t1 {width: 95%; float: left; margin-bottom: 20px;}
.d_t2 {width: 60%; float: left;}
.d_t3 {width: 30%; float: left; background:#f1f3f5;}

/*2구역 : 오른쪽 상단*/
.d_t1>div {padding: 10px 20px; margin: 10px 20px;}
.d_t1>div:nth-child(1) {font-size: 28px; font-weight: 700; color: #495057;} 
.d_t1>div:nth-child(2) span { margin: 0 20px;}
.d_t1>div:nth-child(2) span:nth-child(1) {margin-left: 0;}

/*3구역: 오른쪽 아래 왼쪽*/
.d_t2 {height: 450px; background:#edf5fe; font-size: 18px; }
.d_t2>div {padding: 10px 20px; margin-top: 20px;}
.d_t2>div>span {display: inline-block;}
.d_t2>div>span:nth-child(1) {width: 150px;}
.d_t2>div:nth-child(1) span:nth-child(2){font-weight: 700; font-size: 20px;}
.d_t2>div:nth-child(2) span:nth-child(2){font-weight: 700; font-size: 27px; color: #c84557;}
.d_t2>div:nth-child(2) span:nth-child(3){font-weight: 700; font-size: 20px; color: #c84557; margin-left: 165px;}
.d_t2>div:nth-child(3) span:nth-child(2), 
.d_t2>div:nth-child(4) span:nth-child(2),
.d_t2>div:nth-child(5) span:nth-child(2){font-weight: 700; color: #495057}
.d_t2>div:nth-child(4) span:nth-child(2) b:nth-child(2) {font-size: 16px; margin-top:10px;}

/*4구역 : 오른쪽 아래 오른쪽*/
.d_t3 {height: 450px; padding: 0 20px; , margin: 0 20px;}
.d_t3>div {padding: 5px; margin-top: 20px;}
.d_t3>div:nth-child(1) {font-weight:700; font-size: 20px;}
.d_t3>div:nth-child(2) {font-weight:700; font-size: 20px;}
.d_t3>div:nth-child(2) input {width: 50px; height: 20px; margin-left: 40px; text-align: right; padding-right: 10px;}
.buyState {font-weight: 700; font-size: 20px;}
.buyCount{font-weight: 700; font-size:20px;}
.content_btns {text-align:center;}
.content_btns input {width: 150px; height: 40px; margin: 10px 0; font-size: 17px; font-weight: 700; color:#fff;
border: none; border-radius: 5px; cursor: pointer}
#btnCart {background: #196ab3;}
#btnBuy {background: #19b37c;}
#buy_count{width: 80px; height: 25px; margin-left: 30px;}
.d_t3 .etc {font-size: 18px; font-weight: 700; color:#196ab3; margin-top:17px; line-height: 28px;}

/* 상품 내용 : product_content*/
.d_t4 {padding: 30px;}
.d_t4>div:nth-child(1) {color:#495057; margin-bottom: 17px;}
.d_t4>div:nth-child(2) {line-height: 40px; text-align: justify; font-size: 17px;  }

/*제품 이미지*/
.img_f{width: 700px; margin-left: 240px; margin-top: 50px;}
.img_size{width: 750px; margin-left: 240px; margin-top: 50px;}
/*슬라이더*/
.a1{margin-top: 30px;}
.new_image, .recom_image { width: 200px; height: 300px; font-weight: normal;}
.recom_image:hover, .new_image:hover { transform: scale(1.03);}
</style>
<script>
document.addEventListener("DOMContentLoaded", function(){
	
	//이미지 변환 - 썸네일 이미지 클릭시 큰 사진으로 변경
	let big_img = document.querySelector(".big_img");
	let samll_img = document.querySelectorAll(".small");
	for(let i of samll_img){
		i.addEventListener("click", function(){
			big_img.src = i.src;
		})
	}
	
	
	//구매 수량 범위 제한 - 1~100 사이의 값만 입력 0, 음수는 불가
	let buy_count = document.getElementById("buy_count");
	buy_count.addEventListener("keyup", function(){
		if(buy_count.value < 1 || buy_count.value > 100){
			alert("구매 수량은 100 이하로 입력해 주세요.");
			buy_count.value = 1;
			buy_count.focus();
		}
	})
	
	// 장바구니 담기 버튼
	
	let productForm = document.productForm;
	let btnCart = document.getElementById("btnCart");
	btnCart.addEventListener("click", function(){
		//로그인 여부 확인
		if(productForm.buyer.value == "null"){
			alert("로그인한 후 장바구니에 담을수 있습니다.");
			return;
		}
		productForm.submit();
	})
	//구매 버튼
	
	let btnBuy = document.getElementById("btnBuy");
	btnBuy.addEventListener("click", function(){
		//로그인 여부 확인
		if(productForm.buyer.value == "null"){
			alert("로그인한 후 구매할 있습니다.");
			return;
		}
		// 구매 수량 체크 
		let product_count = "<c:out value='${product.product_count}'/>"
		if(product_count < productForm.buy_count.value){
			alert("재고 수량이 부족합니다. (재고 수량: " + product_count + "개)");
			return;
		}
		productForm.action = "/mall/buy/getBuyForm";
		productForm.submit();
	})
	
	

	// bxSlider - 추천
	$('.bx-slider-recom').bxSlider({
		auto: false,          // 자동 슬라이드
		autoHover: true,     // 마우스를 올렸을 때 멈춤
		autoControls: true,  // 재생/정지 버튼 생성
		speed: 2000,         // 슬라이드 속도(2초)
		pause: 5000,         // 이미지의 노출 시간(5초)
		slideWidth: 230,     // 슬라이드 너비 
		slideHeight: 230,    // 슬라이드 높이
		slideMargin: 10,     // 슬라이드 사이의 간격
		maxSlides: 5,        // 슬라이드 최대 노출 개수
		minSlides: 1,        // 슬라이드 최소 노출 개수
		moveSlides: 5,       // 슬라이드 이동 개수
		touchEnabled: false, // touch 이벤트 제거 -> 클릭했을 때 해당 페이지로 이동하기 위해서
	})
	
		// bxSlider - 추천
	$('.bx-slider-lnew').bxSlider({
		auto: false,          // 자동 슬라이드
		autoHover: true,     // 마우스를 올렸을 때 멈춤
		autoControls: true,  // 재생/정지 버튼 생성
		speed: 2000,         // 슬라이드 속도(2초)
		pause: 5000,         // 이미지의 노출 시간(5초)
		slideWidth: 230,     // 슬라이드 너비 
		slideHeight: 230,    // 슬라이드 높이
		slideMargin: 10,     // 슬라이드 사이의 간격
		maxSlides: 5,        // 슬라이드 최대 노출 개수
		minSlides: 1,        // 슬라이드 최소 노출 개수
		moveSlides: 5,       // 슬라이드 이동 개수
		touchEnabled: false, // touch 이벤트 제거 -> 클릭했을 때 해당 페이지로 이동하기 위해서
	})
	
	})
</script>
</head>
<body>
<div id="container">
<%--  상단 : shopTop.jsp --%>
	<div class="header">
		<header>
			<jsp:include page="../common/shopTop.jsp"/>
		</header>
	</div>
	<%--중단 상품 내용 --%>
	<div class="main">
		<main>
		<input type="hidden" name="member_id" value="${ member.member_id }">
		<article>
				<div class="c_t0"> 
					<img src="<spring:url value='/icon/champ.png'/>" class="content_img">
					<a href="shopProductLeague?league_kind=${product.league_kind}#league_kind" title="${str_league_kind} 상품이동"><div>[ ${ str_league_kind } ]</div></a>
				</div>
			</article>
		<%-- 상품 내용 본문 --%>
			<article>
				
				<%-- 1구역 - 상단(왼쪽) --%>
				<div class="c_t1 content">
					<img src="/sUniform_image/${product.product_imageF }" class="big_img" width="70%" height="400px">
					<div class="small_img">
						<img src="/sUniform_image/${ product.product_imageAll}" class="small" width="23%" height="110px" >
						<img src="/sUniform_image/${ product.product_imageF}" class="small" width="23%" height="110px" >
						<img src="/sUniform_image/${ product.product_imageB}" class="small" width="23%" height="110px" >
						<img src="/sUniform_image/${ product.size_chart}" class="small" width="23%" height="110px" >
					</div>
				</div>
				<%-- 상단: 오른쪽 --%>
				<div class="c_t2 content">
					<%-- 2구역 - 상단(위 - 오른쪽)--%>
					<div class="d_t1 detail">
						<div><span>${ product.product_name}</span></div>
						<div><span>브랜드: ${ product.brand_name}</span>|<span>제조국: ${product.made_country}</span>|<span>상품 분류: ${ str_product_kind }</span></div>
					</div>
					<hr class="clear">
					<%-- 3구역 - 상단(아래 - 왼쪽) --%>
					<div class="d_t2 detail">
						<div><span>정가</span><span><fmt:formatNumber value="${product.product_price}" pattern="#,###"/> 원</span> </div>
						<div><span>판매가</span><span><fmt:formatNumber value="${buy_price }" pattern="#,###"/> 원</span><span>(${product.discount_rate }% 할인)</span></div>
						<div><span>결제혜택</span><span>카드/간편결제 혜택을 확인하세요.</span></div>
						<%-- 로그인이 되면 주소를 노출하도록 처리 --%> 
						
						<div>
							<span>배송 안내</span>
							<span>
							<c:if test="${member == null}" >
								배송 대기중
							</c:if>
							<c:if test="${member != null }">
								${ member.address1} ${ member.address2 }
							</c:if>
							</span>
						</div>
						 
						<%-- 배송주소에 따른 다른 배송비 정책 --%>
						<div><span>배송비</span><span>무료</span></div>
					</div>
					<%-- 4구역 - 상단(아래 - 오른쪽) --%>
					<form action="/mall/cart/insertCart" method="post" name="productForm">
				
						<input type="hidden" name="buyer" value="${member.member_id }">
						<input type="hidden" name="product_id" value="${ product.product_id}">
						<input type="hidden" name="product_name" value="${ product.product_name}">
						<input type="hidden" name="product_imageF" value="${ product.product_imageF}">
						<input type="hidden" name="product_price" value= "${ product.product_price}">
						<input type="hidden" name="discount_rate" value="${ product.discount_rate}">
						<input type="hidden" name="buy_price" value="${buy_price}">
					 	<%-- 재고수량에 따라 판별 --%>
					 <div class="d_t3 detail">
						<div class="buyState">판매중</div>
						<div class="buyCount">수량<input type="number" value="1" name="buy_count" id="buy_count"></div>
						<div class="content_btns">
						<div><input type="button" value="장바구니 담기" id="btnCart"></div>
						<div><input type="button" value="구매" id="btnBuy"></div>
					</div>
						<hr>
						<div class="etc">
						국내배송만 가능<br>
						최저가 보상<br>
						문화비소득공제<br>
						 신청가능
						</div>
					</div>
					</form>
				</div>
			</article>
			<hr>
			<article>
				<h2>제품 전면 이미지</h2>
				<div>
					<img src="/sUniform_image/${ product.product_imageF}" class="img_f">
				</div>
				<h2>사이즈 표</h2>
				<div>
					<img src="/sUniform_image/${ product.size_chart}" class="img_size">
				</div>
			</article>
			<!-- 추천 상품 -->
			<article class="a1">
				<h3 class="middle_title">
					<span>${ str_product_kind } 추천상품</span>
				</h3>
				<div class="bx-slider-recom">
				<c:forEach var="product" items="${productListRecom }">
						<div>
							<a href="/mall/shop/shopContent?product_id=${product.product_id }&product_kind=${product.product_kind}&league_kind=${product.league_kind}"><img src="/sUniform_image/${product.product_imageF}" class="recom_image"></a>
						</div>	
				</c:forEach>
				</div>
				<hr>
			</article>
						<!-- 추천 상품 -->
			<article class="a1">
				<h3 class="middle_title">
					<span>${str_league_kind } 신상품</span>
				</h3>
				<div class="bx-slider-lnew">
				<c:forEach var="product" items="${leagueListNew}">
						<div>
							<a href="/mall/shop/shopContent?product_id=${product.product_id }&product_kind=${product.product_kind}&league_kind=${product.league_kind}"><img src="/sUniform_image/${product.product_imageF }" class="new_image"></a>
						</div>	
				</c:forEach>
				</div>
			</article>
			

		</main>
	</div>
		<%--  하단: shopfooter.jsp --%>
	<div class="footer">
		<footer><jsp:include page="../common/shopBottom.jsp"/></footer>
	</div>
</div>

</body>
</html>