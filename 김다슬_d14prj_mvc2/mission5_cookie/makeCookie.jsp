<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>Insert title here</title>
</head>
<body>
	<h3>makeCookie.jsp</h3>
	<%
		Cookie cookie = new Cookie("id", "master");
		cookie.setMaxAge(60 * 1); //유효시간 10분
		response.addCookie(cookie);

		out.print("쿠키 1개가 생성되었습니다.");		
		
		%>
		<br />
		<%
		Cookie na = new Cookie("na","euna");
		na.setMaxAge(60*2);
		response.addCookie(na);
		
		out.print("쿠키 2번째가 생성됨");
	%>
	<form action="useCookie.jsp" method="post">
		<input type="submit" value="쿠키확인" />
	</form>

</body>
</html>