<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>MainForm</title>
<script>
function logoutProc() {
	location.href="login/logoutPro.jsp";
}

</script>

</head>
<body>
	<h3>MainForm.jsp</h3>
	<%
		if (session.getAttribute("sessionID") == null) {
			//session에 sessionID가 null이면 loginForm.jsp로 이동
			response.sendRedirect("login/loginForm.jsp");
		} else {
	%>
	<!-- 로그인 상태의 jsp -->
	<%=session.getAttribute("sessionID")%> 님 반갑습니다.
	<br /><br />
	<input type="button" value="Logout" onclick="logoutProc()" />	
	
	<%
		}
	%>
	<hr />
	<a href="customer/notice.do">게시판 이동</a>
	
	
</body>
</html>