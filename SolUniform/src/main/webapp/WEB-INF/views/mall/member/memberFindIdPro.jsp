<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.member.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 처리</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%
//로그인 폼에서 넘어오는 회원 아이디, 비밀번호 확인
String member_name = request.getParameter("member_name");
String tel = request.getParameter("tel");

//DB연결, 로그인 처리
MemberDAO memberPro = MemberDAO.getInstance();
String member_id = memberPro.findId(member_name, tel);

%>

<script>
alert("찾으시는 아이디는 <%=member_id%> 입니다.");
location.href='memberLoginForm.jsp';
</script>

</body>
</html>