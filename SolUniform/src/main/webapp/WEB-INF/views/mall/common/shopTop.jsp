<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.soluniform.biz.product.*,com.soluniform.biz.product.impl.*, java.util.*" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 상단</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
#top { width: 100%;}
#top .t_box { display: inline-block;}



/* 1구역: 타이틀, 검색창 */
#t1 { }
#t1 a { text-decoration: none; color: #495057; }
.m_title a{font-family: 'Bebas Neue', sans-serif; font-size: 45px; float: left; margin: 10px 20px 0 0; color: #000;}
.champ {width:100px; height: 100px;}
.s_search { width: 550px; position: relative; margin-left:300px; margin-top:50px;}
#keyword { width: 90%; border: 4px solid #495057; font-size: 18px; padding: 20px 30px; 
border-radius: 10px;}
#search_img { position: absolute; width: 40px; top: 13px; right: 20px; cursor:pointer;}

/* 2구역: 회원정보, 구매내역, 장바구니, 최근본상품 */
#t2 { text-align: right; float:right; }
#t2 a { text-decoration: none; color: #495057;}
#t2 img { width: 45px; margin: 10px ; margin-top: 50px;}


/* 3구역: 메뉴 구성 */
#t3{width: 1196px; margin-left: 4px; position: relative; background: #000; height: 42px }
.all_menu { position: relative;}
.menu_img { width: 30px; height: 40px; position: absolute; top: 2px; left: -10px; cursor: pointer; background:#fff;}
.m1 { position: absolute; left: 25px; top: 0px;}
.m1 .menu_span { display: inline-block; margin-left: 20px; cursor: pointer;}
.m2 { margin-left: 140px;}
.m_box { display: inline-block; font-size: 17px; font-weight: 700; color: #fff; padding: 5px; margin-right: 10px;}
.m_box:hover { text-decoration: none; color: #0080ff;}
.s_box { display: none; position: absolute; z-index: 1000; margin-left: -5px; margin-top: 5px; 
border: 2px solid #0080ff; background: #fff; width: 895px; padding: 20px;}


.ss_box { display: inline-block; width: 150px; text-align: center; line-height: 50px;
font-size: 20px; font-weight: 400px; margin-left: 100px;}
.ss_box>div { height: 50px;}
.ss_title { color: #0080ff;}
.ss_a { color: #000; text-decoration: none;}
.ss_a:hover { color: #f1617d; text-decoration: underline;}

.index{width: 30px; height:30px;margin-right: 15px;margin-top: 15px;}
.my {width: 30px; height:30px;margin-right: 15px;margin-top: 15px;}
.phone{width: 30px; height:30px;margin-right: 15px;margin-top: 15px;}

/* 4구역: 로그인, 회원가입, 고객센터(QnA) */
#t4 { text-align: right; margin-top: 5px; float:right; font-size: 18px;}
#t4 a { text-decoration: none; color: #0088ff; margin: 10px; font-weight: 700;}
#t4 a:hover {text-decoration: none; color: #e6574d;}
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	// 검색 아이콘 클릭
	let keyword = document.getElementById("keyword");
	let search_img = document.getElementById("search_img");
	search_img.addEventListener("click", function(){
		//검색어 유효성 검사
		if(!keyword.value){
			alert("검색어를 입력해 주세요");
			keyword.value.focus();
			return;
		}
		location="/mall/shop/shopProductSearch?keyword=" + keyword.value;
	})
	
 //  검색창에서 엔터키를 눌렀을 때
 document.addEventListener("DOMContentLoaded", function(){
	 
 })
 	// 검색창 엔터키 이벤트
 	keyword.addEventListener("keydown", function(e){
 		//검색어 유효성 검사
 		if(!keyword.value && e.keyCode == 13){
 		alert("검색어를 입력해주세요")
 		keyword.focus();
 		return;
 		}
 		if(e.keyCode == 13){// 엔터키 코드 : 13 을 눌렀을 때
 			location="/mall/shop/shopProductSearch?keyword=" + keyword.value;
 		}

 		
 		
 	})
	let s_box = document.querySelector(".s_box");
	// 메뉴 아이콘 클릭
	let menu_img = document.querySelector(".menu_img");
	menu_img.addEventListener("click", function() {
		if(s_box.style.display == "none") { 
			menu_img.src = "../../icon/menu_close.png";
			s_box.style.display = "block";
		} else { 
			menu_img.src = "../../icon/menu_open.png";
			s_box.style.display = "none";
		}
	})
	// 전체 선택 메뉴 클릭
	let menu_span = document.querySelector(".menu_span");
	menu_span.addEventListener("click", function() {
		if(s_box.style.display == "none") { 
			menu_img.src = "../../icon/menu_close.png";
			s_box.style.display = "block";
		} else { 
			menu_img.src = "../../icon/menu_open.png";
			s_box.style.display = "none";
		}
	})
})
</script>
</head>
<body>

<div id="top">
	<%-- 1구역: 타이틀, 검색창 --%>
	<div id="t1" class="t_box">
		<div class="m_title" title="메인 쇼핑몰"><a href="/mall/shop/shopMain"><img src="<spring:url value='/icon/champ.png'/>" class="champ"></a><a href="/mall/shop/shopMain">FCSOL<br>ONLINE</a></div>
		<div class="s_search">
			<input type="text" name="keyword" id="keyword" placeholder="검색어 입력">
			<img src="<spring:url value='/icon/search.png'/>" id="search_img">
		</div>
	</div>
	
	<%-- 2구역: 회원정보, 구매목록, 장바구니, 최근본상품 --%> 
	<div id="t2" class="t_box">
		<a href="/mall/member/getMember?member_id=${member.member_id }"><img src="<spring:url value='/icon/user.png'/>" title="나의 정보"></a>
		<a href="/mall/buy/getBuyList"><img src="<spring:url value='/icon/product.png'/>" title="구매목록"></a>
		<a href="/mall/cart/getCartList"><img src="<spring:url value='/icon/cart.png'/>" title="장바구니"></a>
	</div>
	
	<%-- 3구역: 메뉴 구성 --%>
	<div id="t3" class="t_box">
		<div class="all_menu">
 			<div class="m_box m1"> 
 				<span class="menu_span">전체 메뉴</span>
 				<img src="<spring:url value='/icon/menu_open.png'/>" class="menu_img" title="">
 				<div class="s_box">
					<div class="ss_box ss1">
						<div class="ss_title"><img src="<spring:url value='/icon/tag.png'/>" class="index" >카테고리</div><hr>
						<div><a href="/mall/shop/shopProductLeague" class="ss_a">전체상품</a></div><hr>
						<div><a href="/mall/shop/shopProductMenuGood" class="ss_a">추천상품</a></div><hr>
						<div><a href="/mall/shop/shopProductLeague?kind=100#league_kind" class="ss_a">프리미어리그</a></div><hr>
						<div><a href="/mall/shop/shopProductLeague?kind=110#league_kind" class="ss_a">분데스리가</a></div><hr>
						<div><a href="/mall/shop/shopProductLeague?kind=120#league_kind" class="ss_a">세리에A</a></div><hr>
						<div><a href="/mall/shop/shopProductLeague?kind=130#league_kind" class="ss_a">리그1</a></div><hr>
						<div><a href="/mall/shop/shopProductLeague?kind=140#league_kind" class="ss_a">라리가</a></div><hr>
						<div><a href="/mall/shop/shopProductLeague?kind=200#league_kind" class="ss_a">국가대표팀</a></div><hr>
					</div>
					<div class="ss_box ss2">
						<div class="ss_title"><img src="<spring:url value='/icon/user.png'/>" class="my">마이페이지</div><hr>
						<div><a href="/mall/cart/cartList" class="ss_a">장바구니</a></div><hr>
						<div><a href="" class="ss_a">주문이력</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						
					</div>
					<div class="ss_box ss3">
						<div class="ss_title"><img src="<spring:url value='/icon/headphone.png'/>" class="phone">고객센터</div><hr>
						<div><a href="" class="ss_a">FAQ</a></div><hr>
						<div><a href="" class="ss_a">QNA</a></div><hr>
						<div><a href="" class="ss_a">공지사항</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>
						<div><a href="" class="ss_a">&nbsp;</a></div><hr>

					</div>
 				</div>
 			</div>
	 	</div>
		<a href="/mall/shop/shopProductLeague"><div class="m_box m2">전체상품</div></a>
		<a href="/mall/shop/shopProductMenuGood"><div class="m_box m3">추천상품</div></a>
		<a href="/mall/shop/shopProductLeague?league_kind=100#league_kind"><div class="m_box m4">프리미어리그</div></a>
		<a href="/mall/shop/shopProductLeague?league_kind=110#league_kind"><div class="m_box m5">분데스리가</div></a>
		<a href="/mall/shop/shopProductLeague?league_kind=120#league_kind"><div class="m_box m6">세리에A</div></a>
		<a href="/mall/shop/shopProductLeague?league_kind=130#league_kind"><div class="m_box m7">리그1</div></a>
		<a href="/mall/shop/shopProductLeague?league_kind=140#league_kind"><div class="m_box m8">라리가</div></a>
		<a href="/mall/shop/shopProductLeague?league_kind=200#league_kind"><div class="m_box m9">국가대표</div></a>
	
	
	
	<%-- 4구역: 로그인, 회원가입, 고객센터(QnA) --%>
	<div id="t4" class="t_box">
		<div>
			<c:if test="${member.member_id == null }"><%-- 로그인이 되지 않았을 떄(member_id)세션이 없을 때 --%>
				<a href="/mall/member/login">로그인</a> | 
				<a href="/mall/member/insertMember">회원가입</a> | 
			</c:if>
			<c:if test="${member.member_id != null }"><%-- 로그인이 되었을 떄(member_id)세션이 있을 때 --%>
				<a href="/mall/member/getMember?member_id=${member.member_id }" title="${ member.member_id}님 회원정보">${member.member_id}님</a> | 
				<a href="/mall/member/logout">로그아웃</a> | 
			</c:if>
			<a href="">고객센터</a>
		</div>
	</div>
	</div>
</body>
</html>