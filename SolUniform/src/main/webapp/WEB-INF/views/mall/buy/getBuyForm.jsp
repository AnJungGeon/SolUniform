<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 폼</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
#container { width: 1200px; margin: 0 auto;}
.clear{clear:both;}
/*결제화면 상단 - 부가 기능*/
.buyForm0 {width: 1100px; margin: 10px auto;}
.buyForm0 .b1 div {display: inline-block;}
.buyForm0 .b1{ margin: 20px 0;}

.buyForm0 .b1 div{width: 100px; height: 35px; text-align: center; line-height: 35px;  border-radius: 5px; margin-right: 10px;}
.buyForm0 .b1 div:nth-child(2){background: #196ab3; color: #fff; border: 2px solid #196ab3; font-size: 17px; font-weight: 700;}
.buyForm0 .b1 div:nth-child(1), .buyForm0 .b1 div:nth-child(3){background:#fff ; color:#196ab3; border: 2px solid #196ab3;}

/* 구매 상품 정보 */
.d_tit {position:relative; width: 1100px; margin: 20px 0; margin-left: 100px;}
.i_tit {position: absolute; }
.s_tit {margin-left: 50px; font-size: 18px; font-weight: 700; color:#196ab3;}
.buyForm_table1 {width: 1100px; margin: 10px auto; border: 1px solid #000; border-collapse: collapse;
border-left: none; border-right: none;}
.buyForm_table1  tr {height: 50px;}
.buyForm_table1  th, .buyForm_table1 td{border: 1px solid #ced4da; border-left: none; border-right: none;}
.buyForm_table1  th {background: #f1f3f5; color: #868e96;}
.buyForm_table1  td {padding : 10px 0;}
.buyForm_table1  .cart_zero{text-align: center; font-weight: 700; font-size: 17px;}
.buyForm_table1  .center{text-align: center;}
.buyForm_table1  .left{text-align: left; padding-left: 10px;}
.buyForm_table1  .right{text-align: right; padding-right: 30px;}
.buyForm_table1  .left a{text-decoration: none; color: #495057; font-weight: 700;}
.buyForm_table1  .right{color: #0080ff; font-weight: 700;}
.title1 {margin-left: 100px;}
/*총 정보*/
/*카트 하단 - 카트 총 정보*/
.buyForm_table2 {width : 1100px; margin: 10px auto; border:1px solid #cae0f0; border-collapse: collapse;
background: #e6f0fa;}
.buyForm_table2 tr {height: 100px;}
.buyForm_table2 th, .buyForm_table2 td{border:1px solid #cae0f0;}
.buyForm_table2 th{font-size: 18px; width: 33.3%;}
.buyForm_table2 td {text-align: center;}
.buyForm_table2 .th1, .buyForm_table2 .td1{color: #343a40;}
.buyForm_table2 .th2, .buyForm_table2 .td2{color: #3a85c8;}
.buyForm_table2 .th3, .buyForm_table2 .td3{color: #a13b66;}
.buyForm_table2 .s21, .buyForm_table2 .s31{font-size: 28px; font-weight: 700;}
.buyForm_table2 .d31 {margin-bottom: 5px; }
.buyForm_table2 .d32{font-size: 14px; font-weight: 700;}


/*배송정보*/
.buyForm_table3 {width : 1100px; margin: 10px auto; border:1px solid #cae0f0; border-collapse: collapse;
background: #e6f0fa;}
.buyForm_table3 tr {height: 80px;}
.buyForm_table3 th, .buyForm_table3 td{border:1px solid #cae0f0;}
.buyForm_table3 th{font-size: 18px;}
.buyForm_table3 td {text-align: ; }
.buyForm_table3 td input{margin-left: 10px; height: 22px; }
.buyForm_table3 .end_td input{margin: 5px 0 5px 10px; width: 740px;}
#btnDelivery{margin-left: 30px;}
#btnDelivery, #btnAddress{width: 110px; height:30px; background: #196ab3; border: none; color: #fff;cursor: pointer;
font-weight: 700; border-radius: 5px;}

/*주문자 정보*/
.buyForm_table4 {width : 1100px; margin: 10px auto; border:1px solid #cae0f0; border-collapse: collapse;
background: #e6f0fa;}
.buyForm_table4 tr {height: 80px;}
.buyForm_table4 th, .buyForm_table4 td{border:1px solid #cae0f0;}
.buyForm_table4 th{font-size: 18px;}
.buyForm_table4 td {text-align: ; }
.buyForm_table4 .s1{margin-left: 10px;}
.buyForm_table4 #account{margin-left: 10px; width: 250px; height: 30px;}
#btnBankDelete{width: 90px; height: 30px; background: #196ab3; border: none; color: #fff;
font-weight: 700; border-radius: 5px; margin-left: 10px; cursor: pointer;}
.buyForm_table4 .card_com , .buyForm_table4 .card_no{width: 180px; height: 30px; margin-left:10px;}
#btnBankInsert{width: 90px; height:30px; background: #199db3; border: none; color: #fff;cursor: pointer;
font-weight: 700; border-radius: 5px; margin-left: 10px;}

/*최종 결제 정보*/
.buyForm {margin-bottom: 30px;}
.buyForm_table5 {width : 1100px; margin: 10px auto; border:1px solid #cae0f0; border-collapse: collapse;
background: #e6f0fa;}
.buyForm_table5 tr {height: 80px;}
.buyForm_table5 th, .buyForm_table5 td{border:1px solid #cae0f0;}
.buyForm_table5 th{font-size: 18px; width: 33.3%}
.buyForm_table5 td {text-align: ; }
.buyForm_table5 .th1, .buyForm_table5 .td1{color: #343a40;}
.buyForm_table5 .th2, .buyForm_table5 .td2{color: #3a85c8;}
.buyForm_table5 .th3, .buyForm_table5 .td3{color: #a13b66;}

.buyForm_table5 .td1 {text-align: center; font-size: 18px; font-weight: 700;}
.buyForm_table5 .td2, .buyForm_table5 .td3 {text-align: center; font-size: 28px; font-weight: 700;}
#btnBuy{width: 140px; height: 50px; background: #a13b66; border: none; color: #fff; font-weight: 700;
font-size: 18px; border-radius: 5px; cursor: pointer;}
</style>
<script>

document.addEventListener("DOMContentLoaded", function(){
	let form = document.buyForm;
	
	
	// 주문자와 동일 버튼
	let btnDelivery = document.getElementById("btnDelivery");
	btnDelivery.addEventListener("click", function(){
		form.delivery_name.value = form.member_name.value;
		form.delivery_tel.value = form.tel.value;
		form.delivery_address1.value = form.address1.value;
		form.delivery_address2.value = form.address2.value;
	})
	
	
	
	
	// 주소 찾기 버튼
	let btnAddress = document.getElementById("btnAddress");
	btnAddress.addEventListener("click", function() {
		new daum.Postcode({
			oncomplete: function(data) {
				form.delivery_address1.value = data.address;
			}
		}).open();
	})
	
	
	
	// 카드 등록 버튼
	let btnBankInsert = document.getElementById("btnBankInsert");
	btnBankInsert.addEventListener("click", function(){
		if(!form.card_com.value){
			alert("카드회사를 입력하시오.")
			form.card_com.focus();
			return;
		}
		if(!form.card_no.value){
			alert("카드번호를 입력하시오.")
			form.card_no.focus();
			return;
		}
		let yn = confirm("입력한 카드를 등록하겠습니다.")
		if(!yn) return;
		form.action = "/mall/bank/insertBank";
		form.submit();
	})
	//카드 삭제 버튼
	let btnBankDelete = document.getElementById("btnBankDelete");
	btnBankDelete.addEventListener("click", function(){
		if(form.account.options[account.selectedIndex].value == "결제 카드 선택"){
			alert("결제 카드를 선택하세요.");
			return;
		}
		let yn = confirm("선택한 카드를 삭제하겠습니까?")
		if(!yn) return;
		//카드 정보(카드번호 + 카드회사에서 카드번호만 추출)
		let card_no_com = form.account.options[account.selectedIndex].value
		let card_no = card_no_com.substring(0, card_no_com.indexOf(" "));
	
		location ="/mall/bank/deleteBank?card_no="+ card_no + "&member_id="+form.member_id.value;
	})
	
	//최종 결제 버튼
	let btnBuy = document.getElementById("btnBuy");
	btnBuy.addEventListener("click", function(){

		if(!form.delivery_name.value){
			alert("받는 사람을 입력하세요.");
			return;
		}
		if(!form.delivery_tel.value){
			alert("배송지 연락처을 입력하세요.");
			return;
		}
		if(!form.delivery_address1.value){
			alert("배송지 기본 주소를 입력하세요.");
			return;
		}
		if(!form.delivery_address2.value){
			alert("배송지 상세 주소를 입력하세요.");
			return;
		}
		if(form.account.options[account.selectedIndex].value == "결제 카드 선택"){
			alert("결제 카드를 선택하세요.");
			return;
		}
		
		form.submit();
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
	
	<!-- 중단: 결제 폼 구성-->
	<div class="main">
		<main>
		<%--카트 상단 : 결제 폼의 부가 기능 --%>
		<article class="buyForm0">
			<div class="b1">
				<div>카트</div>
				<div>결제</div>
				<div>결제 완료</div>
			</div>
		</article>
			<!-- 구매 상품정보 -->
			<form action="/mall/buy/insertBuy" method="post" name="buyForm">
			<article class="buyForm1">
				<div class="title1">
					<img src="../../icon/buy_product.png" width="30" class="i_tit">
					<span class="s_tit">구매 상품 확인</span>
				</div>
				<table class="buyForm_table1">
					<tr>
						<th colspan="2" >상품정보</th><!-- 이미지, 제목 -->
						<th>정가</th>
						<th>판매가</th>
						<th>구매수량</th>
						<th>합계</th>
						<th>배송일</th>					
					</tr>
					<!--  결제 총정보(품목 개수, 구매상품 개수, 총 상품금액(할인전), 총 할인금액, 최종 결제금액(할인 후)-->
					<c:set var="tot1" value="0"/>
					<c:set var="tot2" value="0"/>
					<c:set var="d_tot" value="0"/>
					<c:set var="cnt1" value="${fn:length(cartList) }"/>
					<c:set var="cnt2" value="0"/>
					<c:forEach var="cart" items="${cartList}">
						<c:set var="tot1" value="${tot1 = tot1 + cart.product_price * cart.buy_count }"/>
						<c:set var="tot2" value="${tot2 = tot2 + cart.buy_price * cart.buy_count }"/>
						<c:set var="d_tot" value="${d_tot = d_tot  + (cart.product_price * cart.discount_rate/100) * cart.buy_count }"/>
						<c:set var="cnt2" value="${cnt2 = cnt2 + cart.buy_count }"/>
					<tr>
						<td width="12%" class="center">
							<a href="/mall/shop/shopContent?product_id=${cart.product_id }&product_kind=${p_product_kind}&league_kind=${l_league_kind}"><img src="/sUniform_image/${ cart.product_imageF}" width="100" height="150"></a>
						</td>
						<td width="38%" class="left">
							<a href="/mall/shop/shopContent?product_id=${cart.product_id }&product_kind=${product.product_kind}&league_kind=${product.league_kind}}">${ cart.product_name}</a>
						</td>
						<td width="10%" class="right"><fmt:formatNumber value="${cart.product_price }" pattern="#,###"/></td>
						<td width="10%" class="right"><fmt:formatNumber value="${cart.buy_price }" pattern="#,###"/></td>
						<td width="10%" class="center">${cart.buy_count }</td>
						<td width="10%" class="right"><fmt:formatNumber value="${cart.buy_price * cart.buy_count }" pattern="#,###"/></td>
						<td width="10%" class="center">당일 배송</td>
					</tr>
					</c:forEach>
				</table>
			</article>
			<!-- 총 정보 -->
			<article class="buyForm2">
				<table class="buyForm_table2">
					<tr>
						<th width="33.3%" class="th1">총 상품금액</th>
						<th width="33.3%" class="th2">총 할인금액</th>
						<th width="33.3%" class="th3">최종 결제금액</th>
					</tr>	
					<tr>
						<td><span class="s11 tot1"><fmt:formatNumber value="${ tot1 }" pattern="#,###"/></span><span class="s12">원</span></td>
						<td><span class="s21 d_tot1"><fmt:formatNumber value="${ d_tot }" pattern="#,###"/></span><span class="s22">원</span></td>	
					<td>
						<div class="d31"><span class="s31 tot2"><fmt:formatNumber value="${ tot2 }" pattern="#,###"/></span><span class="s32">원</span></div>
						<div class="d32"><span class="s33 cnt1"><fmt:formatNumber value="${ cnt1 }" pattern="#,###"/> 종 <span class="s34 cnt2">(${ cnt2 }</span> 개)</div>
					</td>
					</tr>		
				</table>			
			</article>
			
			<!-- 배송 정보 : 수령인명, 수령인 전화번호, 수령인 주소-->
			<article class="buyForm3">
				<div class="d_tit">
					<img src="../../icon/buy_product.png" width="30" class="i_tit">
					<span class="s_tit">배송 정보</span>
					<input type="button" id="btnDelivery" value="주문자와 동일" >
				</div>
				<table class="buyForm_table3">
					<input type="hidden" name="member_name" value="${ member.member_name}">
					<input type="hidden" name="tel" value="${ member.tel}">
					<input type="hidden" name="address1" value="${ member.address1}">
					<input type="hidden" name="address2" value="${ member.address2}">
					<tr>
						<th width="30%">받는 사람</th>
						<td width="70%"><input type="text" name="delivery_name" id="delivery_name" size="30"></td>
					</tr>
					<tr>
						<th>배송지 연락처</th>
						<td><input type="text" name="delivery_tel"  size="30" placeholder="수령인의 전화번호를 입력하시오."></td>
					</tr>
					<tr>
						<th>배송지 주소</th>
						<td class="end_td">
							<input type="button" value="주소 찾기" id="btnAddress"><br>
							<input type="text" name="delivery_address1"  size="106" placeholder="수령인의 기본주소를 입력하시오"><br>
							<input type="text" name="delivery_address2"  size="106" placeholder="수령인의 상세주소를 입력하시오"><br>					
						</td>
					</tr>
				</table>
			</article>
			
			<!-- 주문자 정보 : 구매자명, 구매자 전화번호, 구매자 주소, 결제 카드(은행) -->
			<article class="buyForm4">
				<div class="d_tit">
					<img src="../../icon/buy_product.png" width="30" class="i_tit">
					<span class="s_tit">주문자 정보</span>
				</div>
				<table class="buyForm_table4">
					<tr>
						<th width="30%">주문자 이름</th>
						<td width="70%"><span class="s1">${ member.member_name}</span></td>
					</tr>
					<tr>
						<th>주문자 연락처</th>
						<td><span class="s1">${ member.tel}</span></td>
					</tr>
					<tr>
						<th>주문자 취소</th>
						<td>
							<span class="s1">${ member.address1}  ${ member.address2}</span>
						</td>
					</tr>
					<!-- 카드 확인/ 삭제 -->
					<tr>
						<th>결제 카드</th>
						<td>
							<select name="account" id="account">
								<option>결제 카드 선택</option>
								<c:forEach var="bank" items="${bankList}">
								<option>${bank.card_no} ${bank.card_com}</option>
			 					</c:forEach>
							</select>
							
							<input type="button" id="btnBankDelete" value="카드삭제">
						</td>
					</tr>
					<%--카드 등록 --%>
					<tr>
					<input type="hidden" name="member_id" value="${member.member_id}">
					
						<th width="30%">카드 정보 입력</th>
							<td width="70%">
								<input type="text" name="card_com" class="card_com" placeholder="카드사 입력">&ensp;&ensp;
								<input type="text" name="card_no" class="card_no" placeholder="카드번호 입력">&ensp;&ensp;
								<input type="button" id="btnBankInsert" value="카드 등록">
							</td>
					
					</tr>
				</table>
				
			</article>
			<!-- 최종 결제 정보 -->
			<article class="buyForm5">
				<div class="d_tit">
					<img src="../../icon/buy_product.png" width="30" class="i_tit">
					<span class="s_tit">최종 결제</span>
				</div>
				<table class="buyForm_table5">
					<tr>
						<th class="th1">상품도착 예정일</th>
						<th class="th2">총 구매 금액</th>
						<th class="th3">결제</th>
					</tr>
					<tr>
						<td class="td1">${delivery_date}</td>
						<td class="td2"><span><fmt:formatNumber value="${tot2}" pattern="#,###" /></span></td>
						<td class="td3"><input type="button" id="btnBuy" value="최종 결제"></td>
					</tr>
				</table>	
			</article>
			</form>
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