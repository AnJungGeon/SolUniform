<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Song+Myung&display=swap');
#container{width :1200px; margin:0 auto;}

/*로그인 폼*/
.a_login_form{width:400px; margin: 0 auto; text-align: center; margin-top: 20px;}

.a_login_form .login_title>a{text-decoration: none; color: #000; font-size: 50px; font-weight: 700; font-family: 'Bebas Neue', sans-serif;}

.a_login_form .b1,.a_login_form .b2,.a_login_form .b4 {height:70px; margin: 10px; padding: 5px; line-height: 70px;}

.a_login_form .b3, .a_login_form .b5 {height:30px; margin: 5px; padding: 5px;}

.a_login_form .b1>input, .a_login_form .b2>input { width: 320px; height: 25px; padding:20px; font-size: 24px;color: #0080ff;  border-radius: 5px;}
.a_login_form .b1>input:focus, .a_login_form .b2>input:focus{outline:none; border: 2px solid #0080ff; box-shadow: 0 0 3px #0080ff;  border-radius: 5px;}

.a_login_form .b3 {text-align: left;}
.a_login_form .b3>input {margin-left: 20px;}
.a_login_form .b3>label {font-weight: 700;}

.a_login_form .b4>input {width:370px; height:65px; background: #0080ff; color: #fff; border:none;
font-size:20px; font-weight: 700; border-radius: 5px; cursor: pointer;}

.a_login_form .b5>a {text-decoration: none; margin:0 10px; color: #495057; font-size: 15px; font-weight: 700;}
</style>
<script >
document.addEventListener("DOMContentLoaded", function() {
	let form = document.memberLoginForm;
	form.member_id.focus();
	
	//로그인 버튼
	let btnLogin = document.getElementById("btnLogin");
	btnLogin.addEventListener("click", function(){
		if(!form.member_id.value) {
			alert("아이디를 입력하시오");
			form.member_id.focus();
			return;
		}
		if(!form.pwd.value) {
			alert("비밀번호를 입력하시오");
			form.pwd.focus();
			return;
		}
		form.submit();
	})
	
	// 쿠키 저장 - 아이디 저장 박스를 체크했을 때
	// 쿠키 저장 정보 -> 이름, 값, 유지시간
	// escape(): *, -, _, +, ., /를 제외한 모든 문자를 16진수로 변환하는 함수
	let id_save = document.getElementById("id_save");
	id_save.addEventListener("click", function() {
		let now = new Date(); //오늘 날짜 - 유지 시간
		let name = "cookieId"; // 쿠키 이름
		let value = form.member_id.value //쿠키의 값
		
		if(form.id_save.checked == true) { // 체크박스를 체크했을 때 쿠키 생성
			now.setDate(now.getDate() + 7) //쿠키 유지시간 설정, 7일
			document.cookie = name + "=" + escape(value) + ";path=/;expires=" + now.toGMTString() + ";";
		}else{ //체크박스를 해제했을 때 쿠키 삭제
			now.setDate(now.getDate() + 0); //쿠키 삭제, 유지 시간 0
			document.cookie = name + "=" + escape(value) + ";path=/;expires=" + now.toGMTString() + ";";
		}
		
	})
	
	// 쿠키 사용(확인)
	if(document.cookie.length > 0) {
		let search = "cookieId=";
		let idx = document.cookie.indexOf(search);
		if(idx != -1) { //cookieId가 존재한다면
			idx += search.length;
			let end = document.cookie.indexOf(";", idx);
			if(end == -1) {
				end = document.cookie.length;
			}
			form.member_id.value = document.cookie.substring(idx, end); // 쿠키 값
			form.id_save.checked = true;
			
		}
	}
	
})
</script>


</head>
<body>
<div id="container">
	<%-- 상단: shopTop.jsp --%>
	<div class="header">
		<header>
			<jsp:include page="../common/shopTop.jsp"/>	
		</header>
	</div>
	
	<%--중단:  --%>
	<div class="main">
		<main>
			
					<%--로그인 폼 --%>
			<article class="a_login_form">
				<div class="login_title" title="메인 쇼핑몰"><a href="/mall/shop/shopMain">FCSOL ONLINE</a></div>
					<form action="/mall/member/login" method = "post" name = "memberLoginForm">
						<div class="login_box">
							<div class="b1">
								<input type="text" name="member_id" id="member_id">
							</div>
							<div class="b2">
								<input type="password" name="pwd" id="pwd">
							</div>
							<div class="b3">
								<input type="checkbox" name="id_save" id="id_save">&ensp;
								<label for="id_save">아이디 저장</label>
							</div>
							<div class="b4">
								<input type="button" value="로그인" id="btnLogin">
							</div>
							<div class="b5">
								<a href="/mall/member/memberFindId">아이디 찾기</a> |
								<a href="/mall/member/memberFindPwd">비밀번호 찾기</a> |
								<a href="/mall/member/insertMember">회원가입</a>
							</div>
						</div>
					</form>
			</article>
			
		</main>
	</div>
	
	<%--하단:shopBottom.jsp --%>
	<div class="footer">
		<footer>
			<jsp:include page="../common/shopBottom.jsp"/>
		</footer>
	</div>
</div>	
</body>
</html>