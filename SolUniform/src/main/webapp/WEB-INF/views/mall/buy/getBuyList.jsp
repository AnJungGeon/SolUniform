<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 목록 확인</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
#container { width: 1200px; margin: 0 auto;}
.clear{clear:both;}
/*결제화면 상단 - 부가 기능*/
.buyList0 {width: 1100px; margin: 10px auto;}
.buyList0 .b1 div {display: inline-block;}
.buyList0 .b1{ margin: 20px 0;}


.buyList0 .b1 div{width: 100px; height: 35px; text-align: center; line-height: 35px;  border-radius: 5px; margin-right: 10px;}
.buyList0 .b1 div:nth-child(3){background: #196ab3; color: #fff; border: 2px solid #196ab3; font-size: 17px; font-weight: 700;}
.buyList0 .b1 div:nth-child(1), .buyList0 .b1 div:nth-child(2){background:#fff ; color:#196ab3; border: 2px solid #196ab3;}

/*구매 일자별 검색*/
.buyList1{width: 1140px; margin: 10px auto; text-align: right;}
.buyList1 #start_date, .buyList1 #end_date {width: 160px; height:25px; margin: 0 20px; text-align: center;}
.buyList1 #btnSearch {width: 80px; height: 30px; cursor:pointer; }
.title1{text-align: left;}

/* 구매 상품 정보 */
.d_tit {position:relative; width: 1100px; margin: 20px 0; margin-left: 100px;}
.i_tit {position: absolute; margin-left: 50px;}
.s_tit {margin-left: 100px; font-size: 18px; font-weight: 700; color:#196ab3;}
.buyList_table1 {width: 1100px; margin: 10px auto; border: 1px solid #000; border-collapse: collapse;
border-left: none; border-right: none; text-align:center;}
.buyList_table1  tr {height: 50px;}
.buyList_table1  th, .buyList_table1 td{border: 1px solid #ced4da; border-left: none; border-right: none;}
.buyList_table1  th {background: #f1f3f5; color: #868e96;}
.buyList_table1  td {padding : 10px 0;}
.buyList_table1  .cart_zero{text-align: center; font-weight: 700; font-size: 17px;}
.buyList_table1  .center{text-align: center;}
.buyList_table1  .left{text-align: left; padding-left: 10px;}
.buyList_table1  .right{text-align: right; padding-right: 20px;}
.buyList_table1  .left a{text-decoration: none; color: #495057; font-weight: 700;}
.buyList_table1  .right{color: #0080ff; font-weight: 700;}

</style>
<script>
document.addEventListener("DOMContentLoaded", function(){
	let start_date = document.getElementById("start_date");
	let end_date = document.getElementById("end_date");
	let btnSearch = document.getElementById("btnSearch");
	btnSearch.addEventListener("click", function(){
		location='/mall/buy/getBuyListSearch?start_date=' + start_date.value + "&end_date=" + end_date.value;
	})
})
</script>
</head>
<body>
<div id="container">
	<!-- 상단 -->
	<div class="header">
		<header>
			<jsp:include page="../common/shopTop.jsp"></jsp:include>
		</header>
	</div>
	
	<!-- 중단: 구매 목록 화면 상단-->
	<div class="main">
		<main>
		<%--카트 상단 : 결제 폼의 부가 기능 --%>
		<article class="buyList0">
			<div class="b1">
				<div>카트</div>
				<div>결제</div>
				<div>결제 완료</div>
			</div>
		</article>
		
			<!-- 구매 날짜별 검색 -->
			<article class="buyList1">
				
				<div class="date_search">
					<input type="date" id="start_date"><span class="ss">~</span> 
					<input type="date" id="end_date">
					<input type ="button" id="btnSearch" value="검색">
				</div>
				
			</article>
		
			<!-- 구매 목록정보 -->
			<article class="buyList1">
				<div class="title1">
					<img src="../../icon/buy_success.png" width="30" class="i_tit">
					<span class="s_tit">구매 목록</span>
				</div>
				<table class="buyList_table1">
					<tr>
						<th width="20%">주문번호(주문일자)</th>
						<th width="50%" colspan="2">주문상품정보</th><%-- 제목, 이미지 --%>
						<th width="11%">구매금액</th>
						<th width="10%">배송비</th>
						<th width="10%">주문상태</th>					
					</tr>
					<c:if test="${fn:length(buyList) == 0 }">
					
						<tr><td colspan="6" class ="center buy_zero">구매 상품이 없습니다.</td></tr>
					
					</c:if>	
					<c:if test="${fn:length(buyList) != 0 }">
						
					<c:forEach var="buy" items="${buyList }">
					<tr>
						<td class="center">
							<a href="/mall/buy/getBuyDetail?buy_id=${buy.buy_id}">${buy.buy_id}</a><br>
							(<fmt:formatDate value="${buy.buy_date }" pattern="yyyy-MM-dd"/>)
							<span>총 ${buy.buy_id_count}종</span>
						</td>
						<td class="center">
							<a href="/mall/shop/shopContent?product_id=${ buy.product_id}"><img src="/sUniform_image/${ buy.product_imageF}" width="80" height="120"></a>
						</td>
						<td class="left">
							<a href="/mall/shop/shopContent?product_id=${ buy.product_id}">${ buy.product_name}</a>
							
						</td>
						<td class="right"><fmt:formatNumber value="${buy.buy_id_sum}" pattern="#,###"/> 원</td>
						<td class="center">무료</td>
						<td class="center">${ buy.delivery_state}</td>
					</tr>
					</c:forEach>	
					</c:if>
				</table>
			</article>

		
		</main>
	</div>
	

	<!-- 하단: shopBottom.jsp -->
	<div class="footer">
		<footer>
			<jsp:include page="../common/shopBottom.jsp"></jsp:include>
		</footer>
	</div>
	
	
</div>
</body>
</html>