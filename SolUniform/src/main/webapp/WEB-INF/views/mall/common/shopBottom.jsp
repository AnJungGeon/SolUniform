<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 하단</title>
<style>
<style>
.footer1, .footer2 {width:1200px;}
.bottom_line { border: 1px solid #868e96; margin-bottom: 30px; clear: both;}

/* footer1 */
.footer1 { font-size: 17px; background: #e2e6ea;}
.footer1 a { text-decoration: none; color: #868e96;}
.f_box1 { width: 16%; display: inline-block; margin: 1%; border-right: 1px solid #ced4da;}
.f_box1 div { margin: 20px 0; height: 20px;}
.f_box1 .ft1 { font-size: 20px; font-weight: 700; color: #343a40;}
.f_box1 .fs1 { display: inline-block; font-size: 11px; width: 15px; height: 15px; 
padding: 1px; background: #ced4da; border-radius: 50%; text-align: center;}
.fb1 { margin-left: 50px;}
.fb5 { border: none;}
.fb4 {text-align:center; margin:20px; float:right; width:370px;margin-right:80px;}
.fb4>div{margin:15px;}
.fb4>div:nth-child(1){font-weight:700; font-size:18px; }
.fb4>div:nth-child(3){font-weight:700;}
.fb4>div:nth-child(4){font-weight:700;}
.membership {width:250px; height: 70px;font-weight:700; font-size:25px; background:#000; color:#fff; cursor:pointer;}
.fb4_imgs {width: 350px; }
.fb4 img { width: 50px; margin:5px;}

/* footer2 */
.footer2 { font-size: 13px;}
.footer2 a { text-decoration: none; color: #868e96;}
.fb7 { width: 120px; font-family: 'Bebas Neue', sans-serif; font-size: 50px; float: right; color:#868e96;
line-height: 45px; margin-top: 15px;}
/* ? */
.fb6 { width: 33%; text-align: left; float: left; position: relative;}
.fs2 { background: #ced4da; display: inline-block; width: 220px; border-radius: 20px; text-align: left;
padding: 10px 0 10px 20px; font-size: 15px; position: absolute; right: 150px;}


.fb6 { width: 66%; margin-top: 10px; margin-bottom: 30px; float: left;}
.fb6>div { margin: 10px 0;}
.fb6>div>div { display: inline-block; margin: 0 5px;}
.fb6>div>div:nth-child(1) { margin-left: 0;}
}


.fs3 { font-size: 14px; font-weight: 700; color: #343a40;}
.fs4 { font-weight: 700;}
.fs5 { display: inline-block; padding: 3px; border: 1px solid #868e96; border-radius: 5px;
font-size: 11px; color: #343a40;}
.

</style>
</head>
<body>
<%-- 모든 페이지 하단에서 활용 --%>
<hr class="bottom_line">
<div class="footer1">
	<div class="f_box1 fb1">
		<div><a href="#" class="ft1">회원혜택 </a></div>
		<div><a href="#">Prestige Lounge</a></div>
		<div><a href="#">신규회원 혜택</a></div>
		<div><a href="#">등급별 혜택</a></div>
		<div><a href="#">출석체크</a></div>
		<div><a href="#">&nbsp;</a></div>
		<div><a href="#">&nbsp;</a></div>
	</div>
	<div class="f_box1 fb2">
		<div><a href="#" class="ft1">서비스</a></div>
		<div><a href="#">안전한 쇼핑</a></div>
		<div><a href="#">배달 & 배송</a></div>
		<div><a href="#">배송 후 365일 이내 반환</a></div>
		<div><a href="#">&nbsp;</a></div>
		<div><a href="#">&nbsp;</a></div>
		<div><a href="#">&nbsp;</a></div>
	</div>
	<div class="f_box1 fb3">
		<div><a href="#" class="ft1">정보 </a></div>
		<div><a href="#">내 계정</a></div>
		<div><a href="#">회사 소개</a></div>
		<div><a href="#">&nbsp;</a></div>
		<div><a href="#">&nbsp;</a></div>
		<div><a href="#">&nbsp;</a></div>
		<div><a href="#">&nbsp;</a></div>
	</div>
	<div class="fb4">
		<div>판매, 새로운 아이템 등에 대한 최신 정보 업데이트 받기</div>
		<div><a href="/mall/member/login"><input type="button" value="회원 가입" class="membership"></a></div>
		<div>팔로우하세요</div>
		<div class="fb4_imgs">
		<a href="#"><img src="<spring:url value='/icon/facebook.png'/>"></a> 
		<a href="#"><img src="<spring:url value='/icon/twiter.png'/>"></a>  
		<a href="#"><img src="<spring:url value='/icon/instargram.png'/>"></a>
		<a href="#"><img src="<spring:url value='/icon/youtube.png'/>"></a>
		</div>
	</div>
</div>
<div class="footer2">
	<div class="f_box2 fb6">
		<div>
		 	<div><a href="#">개인정보 보호 정책</a></div> | 
			<div><a href="#">이용약관</a></div> | 
			<div><a href="#">사이트 맵</a></div> | 
			<div><a href="#">쿠키 정책 및 관리</a></div> | 
	 	</div>
		<div>대표이사 : 안중건 | 서울특별시 종로구 관철동 13-13 종로코아빌딩 5층 | 사업자등록번호 : 111-11-11111</div>
		<div><span class="fs4">대표전화 : 1555-5555(발신자 부담전화)</span> | FAX : 0555-555-5555(지역번호 공통)</div>
		<div>서울특별시 통신판매업신고번호 : 제555호 <a href="#"> <span class="fs5">사업자정보확인 &gt</span></a></div>
		<div>&nbsp;</div>
		<div>ⓒ FCSOL CENTRE</div>
	</div>
	
	<div class="f_box2 fb7">
		<div><a href="#">FCSOL<br>ONLINE</a></div>
	</div>
	</div>
<div class="clear"></div>
</body>
</html>