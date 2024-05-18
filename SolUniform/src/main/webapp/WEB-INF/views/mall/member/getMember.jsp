<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 확인 폼</title>
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

.member_title h3 { text-align: center; font-size: 24px; font-family: 'Sunflower', sans-serif;}
table {width:100%; border:1px solid #868e96; border-collapse: collapse;}
tr {height:60px;}
th, td {border:1px solid black;}
th {font-size: 14px; background: #f1f3f5;}
td {padding-left: 10px;}

.first_row>td>input {color: #0080ff; font-weight: 700; font-size:18px; border:none;}
.first_row>td>input:focus {outLine:none;}
.second_row>td {color: #0080ff; font-weight: 700;}
.end_row {height: 120px;}
.end_row>td>input{margin:3px 0;}
.end_row #btnAddress {width: 100px; height: 30px; background: #1e94be; border:none;
color: #fff; font-weight: bold; border-radius: 10%;  cursor: pointer;}
.btns {text-align: center;}
.btns>input {width: 130px; height: 45px; background: #e6574d; color: #fff; border:none;
font-weight: bold; font-size: 17px; margin: 20px; border-radius: 5px; cursor: pointer;}
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	let form = document.MemberInfoForm;
	//회원정보수정 버튼, 유효성 검사
	let btnUpdate = document.getElementById("btnUpdate");
	btnUpdate.addEventListener("click", function(){
		
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
	
	//주소 찾기 버튼
	let btnAddress = document.getElementById("btnAddress");
	btnAddress.addEventListener("click", function(){
		new daum.Postcode({
			oncomplete: function(data) {
				form.address1.value = data.address;
			}
		}).open();
	})
	//회원탈퇴 버튼
	let btnDelete = document.getElementById("btnDelete");
	btnDelete.addEventListener("click", function(){
		let check = confirm("정말 회원을 탈퇴하시겠습니까?");
		
		if(!check) return;
		form.action = "/mall/member/deleteMember";
		form.submit();
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


	<%--중단 --%>
	<div class="main">
		<main>
			<%--회원 정보 --%>
			<article class="a_member_form">
				<div class="member_title">
				<h3>회원 정보 확인</h3>
				</div>
				<form action="/mall/member/updateMember" method="post" name = "MemberInfoForm">
							<table>
					<tr class="first_row">
						<th width="20%">아이디</th>
						<td width="80%" >
							<input type="text" name="member_id" value="${member.member_id}" readonly>
						</td>
					</tr>
					<tr class="second_row">
						<th>가입일</th>
						<td><fmt:formatDate value="${member.reg_date}" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pwd" value="${member.pwd}"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pwd2"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="member_name" value="${member.member_name}"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" name="birthday" value="${member.birthday}"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email" value="${member.email}"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
						<input type="radio" name="gender" value="남성" id="male" <c:if test="${member.gender == '남성'}">checked></c:if>> <label for="male" >남성</label>&emsp;&emsp;
						<input type="radio" name="gender" value="여성" id="female" <c:if test="${member.gender =='여성'}">checked></c:if>> <label for="female">여성</label>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="tel" value="${member.tel}" ></td>
					</tr>
					<tr class="end_row">
						<th>주소</th>
						<td>
							<input type="button" value="주소 찾기" id="btnAddress"><br>
							<input type="text" name="address1" size="60" placeholder="기본주소 입력" value="${member.address1}"><br>
							<input type="text" name="address2" size="60" placeholder="상세주소 입력" value="${member.address2}">
						</td>
					</tr>
				</table>
				<div class="btns">
					<input type="button" value="회원수정" id="btnUpdate">
					<input type="button" value="회원탈퇴" id="btnDelete"> 
				</div>
				</form>
			</article>
		</main>
	</div>

	<%-- 하단 : shopBottom.jsp --%>
	<div class="footer">
		<footer><jsp:include page="../common/shopBottom.jsp"/></footer>
	</div>

</div>

</body>
</html>