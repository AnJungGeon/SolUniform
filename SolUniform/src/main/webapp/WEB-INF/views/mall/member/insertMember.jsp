<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');
#container{width :1200px; margin:0 auto;}

/*회원가입 폼: 제목, 테이블, 버튼*/
.a_member_form {width:600px; margin:0 auto;}
.a_member_form input[type="text"],
.a_member_form input[type="password"],
.a_member_form input[type="email"],
.a_member_form input[type="date"] {height: 20px;}

.member_title{}
.join_img{width:40px;}
.member_title h3 { text-align: center; font-size: 24px; font-family: 'Sunflower', sans-serif;}
table {width:100%; border:1px solid #868e96; border-collapse: collapse;}
tr {height:60px;}
th, td {border:1px solid black;}
th {font-size: 14px; background: #f1f3f5;}
td {padding-left: 10px;}
.first_row {height: 80px;}
.first_row #btnCheck {width:100px; height:30px; background: #ff5f51; border:none; color:#fff;
font-weight: bold; border-radius: 5px; margin-left: 20px; cursor: pointer;}
.first_row .s_id {font-size: 12px; font-weight: 700;}
.first_row .s_1 {font-size: 12px; color:#c84557; font-weight: 700;}
.first_row .s_0 {font-size: 12px; color:#1e94be; font-weight: 700;}
.end_row {height: 120px;}
.end_row>td>input{margin:3px 0;}
.end_row #btnAddress {width: 100px; height: 30px; background: #1e94be; border:none;
color: #fff; font-weight: bold; border-radius: 10%;  cursor: pointer;}
.btns {text-align: center;}
.btns>input {width: 130px; height: 45px; background: #00a8e6; color: #fff; border:none;
font-weight: bold; font-size: 17px; margin: 20px; border-radius: 5px; cursor: pointer;}
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	let form = document.memberInsertForm;
	form.member_id.focus();
	//회원가입 버튼, 유효성 검사
	let btnInsert = document.getElementById("btnInsert");
	btnInsert.addEventListener("click", function(){
		
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
		if(!form.pwd2.value) {
			alert("비밀번호를 확인하시오");
			form.pwd2.focus();
			return;
		}
		//비밀번호 확인
		if(form.pwd.value != form.pwd2.value) {
			alert("비밀번호를 다시 확인하시오.");
			form.pwd2.focus();
			return;
		}
		
		if(!form.member_name.value) {
			alert("이름을 입력하시오");
			form.member_name.focus();
			return;
		}
		if(!form.birthday.value) {
			alert("생년월일을 입력하시오");
			form.birthday.focus();
			return;
		}
		if(!form.email.value) {
			alert("이메일을 입력하시오");
			form.email.focus();
			return;
		}
		if(!form.tel.value) {
			alert("전화번호를 입력하시오");
			form.tel.focus();
			return;
		}
		if(!form.address1.value) {
			alert("기본주소를 입력하시오");
			form.address1.focus();
			return;
		}
		if(!form.address2.value) {
			alert("상세주소를 입력하시오");
			form.address2.focus();
			return;
		}
		form.submit();
	})
	//중복 아이디 체크
	let btnCheck = document.getElementById("btnCheck");
	btnCheck.addEventListener("click", function(){
		if(!form.member_id.value) {
			alert("ID 중복 체크를 하기 위한 ID를 입력하세요.");
			form.member_id.focus();
			return;
		}
		
		location = "/mall/member/getMemberIdCheck?member_id=" + form.member_id.value;
	})
	
	//주소 찾기 버튼
	let btnAddress = document.getElementById("btnAddress");
	btnAddress.addEventListener("click", function(){
		new daum.Postcode({
			oncomplete: function(data) {
				form.address1.value = data.address;
			}
		}).open();
	})
	//취소 버튼
	let btnCancle = document.getElementById("btnCancle");
	btnCancle.addEventListener("click", function(){
		location = "/mall/shop/shopMain";
	})
})
</script>
</head>
<body>

<div id="container">
	<%--상단:shopTop.jsp --%>
	<div class="header">
		<header>
			<jsp:include page="../common/shopTop.jsp"/>
		</header>
	</div>
	
	<%--중단: 회원가입 화면 --%>
	<div class="main">
		<main>
			<article class="a_member_form">
				<div class="member_title">
				<h3>회원 가입</h3>
				</div>
				<form action="/mall/member/insertMember" method="post" name = "memberInsertForm">
				<table>
					<tr class="first_row">
						<th width="20%">아이디</th>
						<td width="80%">
							<input type="text" name="member_id">
						<input type="button" value="ID 중복체크" id="btnCheck"><br>
							<c:if test="${check == -1 }">
								<span class="s_id">중복 아이디를 체크하시오.</span>
							</c:if>
							<c:if test="${check == 1 }">
								<span class="s_id s_1">사용중인 아이디입니다. 아이디를 다시 입력하시오.</span>
							</c:if>
							<c:if test="${check == 0 }">
								<span class="s_id s_0">사용가능한 아이디입니다.</span>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type = "password" name = "pwd"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type = "password" name = "pwd2"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type = "text" name = "member_name"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type = "date" name = "birthday"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type = "email" name = "email"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<input type="radio" name="gender" id="male" value="남성" checked><label for="male"> 남성</label>&emsp;&emsp;
							<input type="radio" name="gender" id="female" value="여성"><label for="female"> 여성</label>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type = "text" name = "tel"></td>
					</tr>
					<tr class="end_row">
						<th>주소</th>
						<td>
							<input type = "button" value = "주소 찾기" id="btnAddress"><br>
							<input type = "text" name = "address1" size = "63" placeholder="기본주소"><br>
							<input type = "text" name = "address2" size = "63" placeholder="상세주소">
						</td>
					</tr>
				</table>
				<div class = "btns">
					<input type = "button" value = "회원가입" id = "btnInsert">
					<input type = "button" value = "취소" id = "btnCancle">
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