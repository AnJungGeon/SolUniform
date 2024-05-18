<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mall.member.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 처리</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%
//비밀번호 찾기에서 넘어오는 값들 받기
String member_id = request.getParameter("member_id");
String member_name = request.getParameter("member_name");
String tel = request.getParameter("tel");

//DB연결, pwd 받아오기
MemberDAO memberPro = MemberDAO.getInstance();
String pwd = memberPro.findPwd(member_id, member_name, tel);

%>

<script>
alert("찾으시는 비밀번호는 <%=pwd%> 입니다.");
location.href='memberLoginForm.jsp';
</script>

</body>
</html>