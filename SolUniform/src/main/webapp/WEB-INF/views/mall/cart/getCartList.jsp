<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 리스트</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
#container { width: 1200px; margin: 0 auto;}
.clear{clear:both;}
.main
.clear{clear:both;}
/*카트 상단 - 부가 기능*/
.cart0 {width: 1100px; margin: 10px auto;}
.cart0 .b1 div, .cart0 .b2 div, .cart0 .b3 div{display: inline-block;}
.cart0 .b1, .cart0 .b2, .cart0 .b3{ margin: 20px 0;}

.cart0 .b1 div{ width: 100px; height: 35px; text-align: center; line-height: 35px;  border-radius: 5px; margin-right: 10px;}
.cart0 .b1 div:nth-child(1){background: #196ab3; color: #fff; border: 2px solid #196ab3; font-size: 17px; font-weight: 700;}
.cart0 .b1 div:nth-child(2), .cart0 .b1 div:nth-child(3) {background:#fff ; color:#196ab3; border: 2px solid #196ab3;}

.cart0 .b2 div{width: 100px;}
.cart0 .b2 div:nth-child(1){position: relative;}


.cart0 .b2 input[type="button"]{width: 105px; height: 40px; font-size:16px; font-weight: 700; cursor:pointer; border-radius: 5px;}
.cart0 .b2 #btnBuy{background:#a13b66; color: #fff; border: 2px solid #a13b66; }
.cart0 .b2 #btnDelete{background:#fff; color:#a13b66; border: 2px solid #a13b66; margin-left: 15px;}

/*
.cart0 .b3 div{width: 150px; height: 30px; text-align: center; line-height: 30px; border-radius: 50px; margin-right: 10px;}
.cart0 .b3 div:nth-child(2){background: #343a40; color: #fff; border: 2px solid #343a40; font-size: 13px; font-weight: 700;}
.cart0 .b3 div:nth-child(1), .cart0 .b3 div:nth-child(3) {background:#fff ; color:#343a40; border: 2px solid #343a40; font-size: 13px; font-weight: 700;}
*/
/* 카트 중단- 카트 테이블 */
.cart1 {width: 100%;}
.cart_table {width: 1100px; margin: 10px auto; border: 1px solid #ced4da; border-collapse: collapse; 
border-left: none; border-right: none; position: relative;}
.cart_table tr {height: 50px;}
.cart_table th, .cart1 .cart_table td{border: 1px solid #ced4da; border-left: none; border-right: none;}
.cart_table th {background: #f1f3f5; color: #868e96;}
.cart_table td {padding : 10px 0;}
.cart_table .cart_zero{text-align: center; font-weight: 700; font-size: 17px;}
.cart_table .center{text-align: center;}
.cart_table .left{text-align: left; padding-left: 10px;}
.cart_table .right{text-align: right; padding-right: 30px;}
.cart_table .left a{text-decoration: none; color: #495057; font-weight: 700;}
.cart_table .right .b_prices{color: #0080ff; font-weight: 700;}
.cart_table .td_imgs img{margin: 0 5px; width: 27px; cursor: pointer;}
.cart_table .s1{display: inline-box; font-size: 14px; color: #495057; margin-left: 40px; cursor: pointer;}
.cart_table #choice_all {width: 20px; height: 20px; cursor: pointer; position: absolute; top: 13px; left: 40px;}
.cart_table .choice_one{width: 20px; heigth:20px; cursor: pointer;}

.cart1 .cart_table input[type="number"]{width:60px; height: 20px; text-align: right;}
/* number 속성에서 화살표를 없앰 */
.cart1 .cart_table input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button {
 -webkit-appearance: none; margin: 0;}

.cart_table .btnUpdate{width: 60px; heigth: 25px; margin-top: 10px;
background: #f1f3f5; color: #868e96; border: 1px solid #868e96; border-radius: 3px; cursor: pointer;}

/*카트 하단 - 카트 총 정보*/
.cart_table_total {width : 1100px; margin: 10px auto; border:1px solid #cae0f0; border-collapse: collapse;
background: #e6f0fa;}
.cart_table_total tr{height: 100px;}
.cart_table_total th .cart_table_total td{border: 1px solid #cae0f0;}
.cart_table_total th{font-size: 18px; width: 33.3%;}
.cart_table_total td { text-align: center;}
.cart_table_total .th1 ,.cart_table_total .td1{color: #343a40;}
.cart_table_total .th2 ,.cart_table_total .td2{color: #3a85c8;}
.cart_table_total .th3 ,.cart_table_total .td3{color: #a13b66;}
.cart_table_total .s11,.cart_table_total .s21,.cart_table_total .s31{font-size: 28px; font-weight: 700;}
.cart_table_total .d31 {margin-bottom : 5px; }
.cart_table_total .d32{font-size: 14px; font-weight: 700;}
</style>
<script>
document.addEventListener("DOMContentLoaded", function(){
	
	//각 카트의 구매 수량 변경 버튼
	let btnUpdate = document.querySelectorAll(".btnUpdate");//배열
	let cart_id = document.querySelectorAll(".cart_id");//배열
	let buy_count = document.querySelectorAll(".buy_count");//배열
	
	for(let i=0;i<btnUpdate.length;i++){
			btnUpdate[i].addEventListener("click", function(){
				location = "/mall/cart/updateCart?cart_id=" + cart_id[i].value + "&buy_count=" + buy_count[i].value;
			})
		}

	
	//가격 입력 상자에 1 ~ 100 사이의 값만 입력하도록 제한
	for(let i of buy_count){
		let count = i.value;
		i.addEventListener("keyup", function(e){
			console.log("value: "+ count);
			if(i.value <= 0 || i.value > 100){
				alert("구매수량은 1~100 사이의 값만 입력 가능합니다.");
				i.value = count;
				i.focus();
				return;
			}
		})
	}
	
	// 각 카트의 삭제 버튼 (1개)
	let delete_img = document.querySelectorAll(".delete_img"); //배열
	for(let i=0 ;i<delete_img.length; i++){
		delete_img[i].addEventListener("click", function(){
			location = "/mall/cart/deleteCartOne?cart_id=" + cart_id[i].value;
		})
	}
	
	// 카트의 주문 버튼(1개)
	let buy_img = document.querySelectorAll(".buy_img");//배열
	for(let i=0;i<buy_img.length;i++){
		buy_img[i].addEventListener("click", function(){
			location = "/mall/buy/getBuyForm?cart_id=" + cart_id[i].value;
		})
	}
	
	
	
	// 카트 아이디를 저장하는 셋
	let cartIdSet = new Set();
	let choice_all = document.getElementById("choice_all"); //1개
	let choice_one = document.querySelectorAll(".choice_one");//배열
	
	// 전체체크 체크박스, 각각의 체크박스의 기본값을 해제로 설정
	choice_all.checked = false;
	for(let i of choice_one){
		i.checked = false;
	}
	
	//cnt2 += b_count; //총구매상품개수
	//tot1 += p_price * b_count; // 총 상품금액(할인전)
	//tot2 += b_price * b_count; // 최종 결제금액(할인 후)
	//d_tot += (p_price*d_rate/100) * b_count;
	
	
	
	//카트 총 정보 - 총품목개수(cnt1), 총 구매상품개수(cnt2), 총 상품금액(할인전, tot1), 총 할인금액(d_tot), 최정 결재 금액
	let tot1 = document.querySelector(".tot1"); //총 상품금액
	let d_tot = document.querySelector(".d_tot"); //총 할인금액
	let tot2 = document.querySelector(".tot2"); //총 품목개수
	let cnt1 = document.querySelector(".cnt1"); //총 구매상품 개수
	let cnt2 = document.querySelector(".cnt2");// 총 구매상품개수
	
	
	
	let t1 = 0, d = 0, t2 = 0, c1 = 0 , c2 = 0; 
	

	
	// 각 카트 상품별 삼품금액(p_price), 할인율(d_reate), 판매가(b_price), 구매수량(b_count)
	let p_price = document.querySelectorAll(".p_price");
	let d_rate = document.querySelectorAll(".d_rate");
	let b_price = document.querySelectorAll(".b_price");
	let b_count = document.querySelectorAll(".b_count");
	
	
	//각각의 체크박스 선택 및 해제 처리
	for(let i=0; i<choice_one.length;i++){
		choice_one[i].addEventListener("change", function(e){
			if(e.currentTarget.checked){// 체크 했을 때 -> 셋에 추가
				cartIdSet.add(cart_id[i].value);
				c1 += 1;
				c2 += Number(b_count[i].value); // 총 구매 수량
				t1 += Number(p_price[i].value) * Number(b_count[i].value);// 총 상품금액(할인 전)
				t2 += Number(b_price[i].value) * Number(b_count[i].value);// 최종 결제금액(할인 후)
				d += (Number(p_price[i].value) * Number(d_rate[i].value)/100) * Number(b_count[i].value);// 총 할인금액
				
			}else{// 해제했을 떄 -> 셋에서 삭제, 전체 선택 체크박스를 해제
				cartIdSet.delete(cart_id[i].value);
				choice_all.checked = false;
				c1 -= 1;
				c2 -= Number(b_count[i].value);
				t1 -= Number(p_price[i].value) * Number(b_count[i].value);
				t2 -= Number(b_price[i].value) * Number(b_count[i].value);
				d -= (Number(p_price[i].value) * Number(d_rate[i].value)/100) * Number(b_count[i].value);
			}
			cnt1.textContent = c1.toLocaleString();
			cnt2.textContent = c2.toLocaleString();
			tot1.textContent = t1.toLocaleString();
			tot2.textContent = t2.toLocaleString();
			d_tot.textContent = d.toLocaleString();
			console.log(cartIdSet);
		})
	}
	
	
	//전체 선택 및 해제 체크박스 처리
	choice_all.addEventListener("change", function(e){
		c1 = 0, c2 =0, t1=0, t2=0, d = 0;
		if(e.currentTarget.checked){ // 체크했을 때 -> 모든 카트 아이디 추가, 각 체크박스를 체크 상태로 변경
			for(let i = 0; i<cart_id.length; i++){
				choice_one[i].checked = true;
				cartIdSet.add(cart_id[i].value);
				c1 += 1;
				c2 += Number(b_count[i].value); // 총 구매 수량
				t1 += Number(p_price[i].value) * Number(b_count[i].value);// 총 상품금액(할인 전)
				t2 += Number(b_price[i].value) * Number(b_count[i].value);// 최종 결제금액(할인 후)
				d += (Number(p_price[i].value) * Number(d_rate[i].value)/100) * Number(b_count[i].value);// 총 할인금액
				
				}
		
				cnt1.textContent = c1.toLocaleString();
				cnt2.textContent = c2.toLocaleString();
				tot1.textContent = t1.toLocaleString();
				tot2.textContent = t2.toLocaleString();
				d_tot.textContent = d.toLocaleString();
			
		
		}else{// 해제했을 때 -> 모든 카트 아이디 삭제, 각 체크박스를 해제 상태로 변경
			for(let i = 0; i<cart_id.length; i++){
				choice_one[i].checked = false;
				cartIdSet.delete(cart_id[i].value);	
			}
			cnt1.textContent = 0;
			cnt2.textContent = 0;
			tot1.textContent = 0;
			tot2.textContent = 0;
			d_tot.textContent = 0;
		}

		console.log(cartIdSet);
		
	})
	
	


	//상단 주문 버튼 처리 - 1개 또는 여러 개 또는 전체 ->buyForm.jsp로 이동
	let btnBuy = document.getElementById("btnBuy");
	btnBuy.addEventListener("click", function(){
		//셋을 배열로 변경 -> 데이터의 이동과 처리를 위해서
		let c_ids = new Array();
		
		for(let i of cartIdSet){
			c_ids.push(i);
		}
		
		
		// 셋에 카트 아이디가 하나도 없을 때
		if(cartIdSet.size == 0) {
			alert("카트에서 구매 상품을 선택해 주세요.");
			return;
		}
		
		// 셋의 카트 아이디를 모두 삭제
		cartIdSet.clear();
		
		// 전체체크 체크박스, 각각의 체크박스의 기본값을 해제로 설정
		choice_all.checked = false;
		for(let i of choice_one){
			i.checked = false;
		}
		
		location ="/mall/buy/getBuyForm?cart_id=" + c_ids;
	})
	
	//상단 삭제 버튼 처리 - 1개 또는 여러 개 또는 전체 -> DB에서 모든 카트를 삭제 처리
	let btnDelete = document.getElementById("btnDelete");
	btnDelete.addEventListener("click", function(){
		//셋을 배열로 변경 -> 데이터의 이동과 처리를 위해서
		let c_ids = new Array();
		
		for(let i of cartIdSet){
			c_ids.push(i);
		}
		
		
		// 셋에 카트 아이디가 하나도 없을 때
		if(cartIdSet.size == 0) {
			alert("카트에서 구매 상품을 선택해 주세요.");
			return;
		}
		
		// 셋의 카트 아이디를 모두 삭제
		cartIdSet.clear();
		
		// 전체체크 체크박스, 각각의 체크박스의 기본값을 해제로 설정
		choice_all.checked = false;
		for(let i of choice_one){
			i.checked = false;
		}
		
		location ="/mall/cart/deleteCartAll?cart_id=" + c_ids;
	})
	
})
</script>
</head>
<body>

<div id="container">
	<%-- 상단: shopTop.jsp --%>
	<div class="header">
		<jsp:include page="../common/shopTop.jsp"/>
	</div>
	
	
	<%-- 중단: 카트 리스트  --%>
	<div class="main">
		<main>
		<%--카트 상단 : 카트 부가 기능 --%>
		<article class="cart0">
			<div class="b1">
				<div>카트</div>
				<div>결제</div>
				<div>결제 완료</div>
			</div>
			<div class="b2">
				<div><input type="button" value="주문" id="btnBuy"></div>
				<div><input type="button" value="삭제" id="btnDelete"></div>
			</div>
		</article>
				<%--카트 중단 : 카트 리스트 --%>
			<article class="cart1">
				<%-- 카트 리스트를 테이블로 구성 --%>
				<table class="cart_table">
					<tr>
						<th width="11%"><input type="checkbox" id="choice_all"></th>
						<th width="56%" colspan="2">상품 정보</th>
						<th width="11%">구매 수량</th>
						<th width="11%">상품 금액</th><%-- 구매수량 * 판매가--%>
						<th width="11%">주문/삭제</th><%-- 주문처리, 삭제처리 --%>
					</tr>
					<%-- 카트 하단 : 카트 총정보(총품목 개수(cnt1), 총구매상품 개수(cnt2), 총 상품금액(할인전,tot1), 총 할인금액(d_tot), 최종 결제금액(할인 후)--%>	
					<c:if test="${fn:length(cartList) == 0}">
						<tr><td colspan="6" class="cart_zero">장바구니에 상품이 없습니다.</td></tr>
					</c:if>
					<c:if test="${fn:length(cartList) != 0  }">
						<c:set var="pc" value="${p_count_list }"/>
						<c:set var="cc" value="${check_count }" />
						<c:set var="i" value="${i = -1 }"/>
						<c:forEach var="cart" items="${cartList }">
								<%-- 카트별 주문, 삭제, 수량 변경 : 3가지 처리 --%>
								<form action="" method="post" name="cartOneForm">
									<input type="hidden" name="d_rate" class="d_rate" value="${cart.discount_rate }">
									<input type="hidden" name="b_count" class="b_count" value="${cart.buy_count}">
									<input type="hidden" name="p_price" class="p_price" value="${cart.product_price}">
									<input type="hidden" name="b_price" class="b_price" value="${cart.buy_price}">
									<input type="hidden" name="cart_id" class="cart_id" value="${cart.cart_id}">
								<tr>
									<td class="center"><input type="checkbox" name="choice_one" class="choice_one"></td>
									<td class="center"><a href="/mall/shop/shopContent?product_id=${cart.product_id }"><img src="/sUniform_image/${cart.product_imageF}" width="100" height="150"></a></td>
									<td class="left"><a href="/mall/shop/shopContent?product_id=${cart.product_id }">${cart.product_name }</a></td>
									<td class="center">
									<input type="number" name="buy_count" class="buy_count" value="${cart.buy_count}">개
									<div><input type="button" value="변경" class="btnUpdate"></div>
									<c:if test="${cc[i] == 1}">
										<span class="s_check sc1">구매 가능</span>
									</c:if>
									<c:if test="${cc[i] == 0}">
										<span class="s_check sc2">구매 불가(재고: ${pc[i]})</span>
									</c:if>
									</td>
									<td class="right"><span class="b_prices"><fmt:formatNumber value="${cart.buy_count * cart.buy_price }"/>원</span></td>
									<td class="center td_imgs">
										<img src="../../icon/buy.png" width="25" class="buy_img" title="주문">
										<img src="../../icon/delete.png" width="25" class="delete_img" title="삭제">
									</td>
								</tr>
								</form>
						</c:forEach>
						</c:if>
				</table>
			</article>
			
			<!-- 카트 하단 : 카트 총정보(품목 개수, 구매상품 개수, 총 상품금액(할인전), 총 할인근액, 최종 결제금액(할인 후)-->
			<article class="cart2">
				<table class="cart_table_total">
					<tr>
						<th class="th1">총 상품금액</th>
						<th class="th2">총 할인금액</th>
						<th class="th3">최종 결제금액</th>
					</tr>	
					<tr>
						<td class="td1"><span class="s11 tot1">0</span><span class="s12">원</span></td>
						<td class="td2"><span class="s21 d_tot">0</span><span class="s22">원</span></td>	
					<td class="td3">
						<div class="d31"><span class="s31 tot2">0</span><span class="s32">원</span></div>
						<div class="d32"><span class="s33 cnt1">0</span>종(<span class="s34 cnt2"></span>)개</div>
					</td>	
					</tr>	
				</table>			
			</article>
		</main>
	</div>
	
	
	<%-- 하단:shopBottom.jsp --%>
	<div class="footer">
		<footer>
			<jsp:include page="../common/shopBottom.jsp"/>
		</footer>
	</div>
</div>
</body>
</html>