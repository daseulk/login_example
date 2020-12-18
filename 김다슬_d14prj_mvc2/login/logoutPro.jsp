<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>Insert title here</title>
</head>
<body>
<h3>logout.jsp</h3>
<%
//session.invalidate(); //모두 삭제
session.removeAttribute("sessionID"); //세션일부 삭제
response.sendRedirect("loginForm.jsp");//로그아웃하고 Form으로 이동

%>
</body>
</html>