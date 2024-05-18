<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리그 페이지</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap');
#container { width: 1200px; margin: 0 auto;}




/*상단 타이틀, 중단 타이틀, 페이지 */
.product_img{width: 55px; margin-left: 7px; margin-top: 3px;}
.middle_title { position: relative; font-size: 24px;font-family: 'Bebas Neue', sans-serif; font-weight: 700;}
.middle_title>span { margin-left: 5px; position: absolute; top: 7px; width: 500px;}
.middle_page { text-align: right; margin-right: 60px; color: #0080ff;}
#league_kind{margin-left: 20px; font-size: 15px;}

/* 상품 1개 영역 */
.box { width: 250px; height: 510px; display: inline-block; float: left; border: 1px solid #dee2e6;
margin: 15px; padding: 5px;}
.box span { display: inline-block;}
.p_image { width: 250px; height: 350px;}
.p_image:hover { transform: scale(1.03);}
.p_kind { font-weight: 700; color: #1e94be; margin-top: 5px;}
.p_name { font-size: 17px; font-weight: 700; margin-top: 5px; color: #000; }
.p_name:hover { text-decoration: underline; color: red;}
.p_brand { color: #868e98; margin-top: 5px;}
.p_kind { color: #868e98;}
.p_kind>b{text-align:right;}
.p_price2{text-decoration: line-through; text-decoration-color:red; font-weight: 700;}
.p_price1,.p_price2,.p_price3 { font-size: 17px; font-weight: 700; margin-top: 5px; color: #868e98;}
.b_price { font-size: 17px; font-weight: 700; margin-top: 5px;} 
.p_discount { font-size: 17px; font-weight: 700; color: #c84557;}
.pages{float:right; margin-right: 60px; color: #0080ff; font-size: 20px; margin-top: 10px;}
/* 페이징 영역 */
#paging { margin-top: 580px; margin-bottom: 30px; text-align: center; font-weight: 700; clear:both;}
.pbox { display: inline-block; width: 22px; height: 22px; border-radius: 10%;
margin: 0 5px; padding: 5px; background: #fff; color: #495057; border: 2px solid #495057; text-align: center; }
.pbox:hover { background: #495057; color: #fff;}
.cbox { background: #495057; color: #fff; font-weight: 700;}
.arrow { width: 10px; height: 10px;}

</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	// 페이지번호(pageNum), 리그 분류(kind)
	let kind = document.getElementById("kind");
	
	// 리그 분류 - select 태그
	let league_kind = document.getElementById("league_kind");
	
	league_kind.addEventListener("change", function() {
		location = "/mall/shop/shopProductLeague?league_kind="  + league_kind.value + "#league_kind";
	})
	


	
})
</script>
</head>
<body>
<div id="container">
	<%-- 상단 : shopTop.jsp --%>
	<div class="header">
		<header><jsp:include page="../common/shopTop.jsp"/></header>
	</div>
	<div class="p_kinds">
	<div class="p1 middle_title">
		<img src="<spring:url value='/icon/champ.png'/>" class="product_img">
		<span>${str_league_kind } 분야 상품 목록</span>
	</div>
	<div class="p2 middle_title">
		<select name="league_kind" id="league_kind">
			<option value="000" <c:if test='${league_kind == "000"}'> selected </c:if>>전체 상품</option> 
			<option value="100" <c:if test='${league_kind == "100"}'> selected </c:if>>프리미어리그</option>
			<option value="110" <c:if test='${league_kind == "110"}'> selected </c:if>>분데스리가</option>
			<option value="120" <c:if test='${league_kind == "120"}'> selected </c:if>>세리에A</option>
			<option value="130" <c:if test='${league_kind == "130"}'> selected </c:if>>리그1</option>
			<option value="140" <c:if test='${league_kind == "140"}'> selected </c:if>>라리가</option>
			<option value="200" <c:if test='${league_kind == "200"}'> selected </c:if>>국가대표</option>
		</select>
		<b class="pages">${ paging.currentPage } / ${paging.pageCount }</b>
	</div>

</div>
<div class="clear"></div>
<div class="box_all">
<c:forEach var="product" items="${leagueListKind }">
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
			<a href="/mall/shop/shopContent?product_id=${product.product_id }&product_kind=${product.product_kind}&league_kind=${product.league_kind}"><img src="/sUniform_image/${product.product_imageF }" class="p_image"></a><br>
			<span class="p_kind">[${ str_Lkinds }]</span><br>
			<a href="/mall/shop/shopContent?product_id=${product.product_id }&product_kind=${product.product_kind}&league_kind=${product.league_kind}"><span class="p_name">${product.product_name}</span></a><br>
			<span class="p_brand">${ product.brand_name}</span> | <span class="p_kind">${  str_Pkinds }</span><br> 
			<span class="p_price1">정가</span> <span class="p_price2"> <fmt:formatNumber value="${product.product_price}" pattern="#,###"/></span> <span class="p_price3">원</span><br>
			<span class="b_price">할인가&ensp;<fmt:formatNumber value=" ${product.product_price-(product.product_price * product.discount_rate/100)}" pattern="#,###"/></span> 원 (<span class="p_discount">${product.discount_rate }%</span>할인)
		</div>
</c:forEach>
	</div>
	<div class="clear"></div>
		<%-- 페이징 처리 --%>
		<div id="paging">
		<c:if test="${paging.leagueCount != 0}" >
			<%-- 처음 페이지 처리 --%>
			<c:if test="${paging.startPage > 10 }">
				<a href='/mall/shop/shopProductLeague?pageNum=1&league_kind=${league_kind} '><div class='pbox'><img src='../../icon/left-arrow-fast.png' class='arrow' title='처음 페이지'></div></a>
			</c:if>
			<%-- 이전 페이지 처리 --%>
			<c:if test="${paging.startPage > 10 }">
				<a href='/mall/shop/shopProductLeague?pageNum=${paging.startPage-paging.pageBlock}&league_kind=${league_kind}'><div class='pbox'><img src='../../icon/left-arrow.png' class='arrow' title='10페이지 이전'></div></a>
			</c:if>
			<%--페이지 블럭처리 --%>
			<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
				<c:if test="${i == paging.currentPage}" >
				<div class='pbox cbox'>${i}</div>
			
				</c:if>
				<c:if test="${i != paging.currentPage }">
				<a href='/mall/shop/shopProductLeague?pageNum=${i}&league_kind=${league_kind}'><div class='pbox'>${i}</div></a>
				
				</c:if>
			</c:forEach>
			<%--다음 페이지 처리 --%>
			<c:if test="${paging.endPage < paging.pageCount  }">
				<a href='/mall/shop/shopProductLeague?pageNum=${paging.startPage+paging.pageBlock}&league_kind=${league_kind }'><div class='pbox'><img src='../../icon/right-arrow.png' class='arrow' title='10페이지 다음'></div></a>
			</c:if>
			
			<%--마지막 페이지 처리 --%>
			<c:if test="${paging.endPage < paging.pageCount  }">
				<a href='/mall/shop/shopProductLeague?pageNum=${paging.pageCount }&league_kind=${league_kind}'><div class='pbox'><img src='../../icon/right-arrow-fast.png' class='arrow' title='마지막 페이지'></div></a>
			</c:if>
		</c:if>
	</div>
	
	<div class="footer">
		<footer>
			<jsp:include page="../common/shopBottom.jsp"/>
		</footer>
	</div>	
</div>
</body>
</html>