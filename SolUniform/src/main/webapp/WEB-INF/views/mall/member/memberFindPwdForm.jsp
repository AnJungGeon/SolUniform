<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
#container{width :1200px; margin:0 auto;}

.clear{clear:"both";}
.a_login_form{text-align: center; margin-top: 50px;}
.login_title{margin: 20px 0;font-size:50px; color:#0080ff; font-weight: 700; }
.b1>input, .b2>input, .b3>input{width: 320px; height: 25px; padding:20px; font-size: 24px;color: #0080ff;  border-radius: 5px; margin: 10px;}
.b1>input:focus, .b2>input:focus, .b3>input:focus{outline:none; border: 2px solid #0080ff; box-shadow: 0 0 3px #0080ff;  border-radius: 5px;}
.b4 {margin-top: 30px;}
.b4 [type='button']{width: 360px; height: 60px; background: #0080ff; border-radius: 7px; border: none; color: #fff;
font-weight: 700; cursor: pointer; font-size: 24px; }
.b4{margin-top : 15px; font-size: 20px; padding: 20px; margin: 10px;}
.b5 a{margin: 20px;font-size: 20px; text-decoration: none; color: #000; font-weight: 700;}
.b5 a:hover{color: red; text-decoration: underline; }




</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	let form = document.memberFindPwdForm;
	
	//아이디 찾기 버튼
	let btnFindPwd = document.getElementById("btnFindPwd");
	btnFindPwd.addEventListener("click", function(){
		
		if(!form.member_id.value) {
			alert("아이디를 입력하시오");
			form.member_id.focus();
			return;
		}
		if(!form.member_name.value) {
			alert("이름을 입력하시오");
			form.member_id.focus();
			return;
		}
		if(!form.tel.value) {
			alert("전화번호를 입력하시오");
			form.tel.focus();
			return;
		}
		form.submit();
	})
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

	<article class="a_login_form">
				<div class="login_title" title="메인 쇼핑몰">비밀번호 찾기</div>
					<form action="memberFindPwdPro.jsp" method = "post" name = "memberFindPwdForm">
						<div class="login_box">
							<div class="b1">
								<input type="text" name="member_id" id="member_id" placeholder="아이디를 입력하세요.">
							</div>
							<div class="b2">
								<input type="text" name="member_name" id="member_name" placeholder="이름을 입력하세요.">
							</div>
							<div class="b3">
								<input type="text" name="tel" id="tel" placeholder="전화번호를 입력하세요.">
							</div>
							<div class="b4">
								<input type="button" value="비밀번호 찾기" id="btnFindPwd">
							</div>
							<div class="b5">
								<a href="memberFindIdForm.jsp">아이디 찾기</a> |
								<a href="memberInsertForm.jsp">회원가입</a>
							</div>
						</div>
					</form>
			</article>
			
			<%--하단:shopBottom.jsp --%>
	<div class="footer">
		<footer>
			<jsp:include page="../common/shopBottom.jsp"/>
		</footer>
	</div>
</div>	
</body>
</html>