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
	<h3>if</h3>

	<c:forEach var="i" begin="1" end="10" varStatus="st">
		${i }
	<c:if test="${not st.last }">,</c:if>
	</c:forEach>

	<hr />

	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="10" varStatus="st">
		${i }
	<c:set var="sum" value="${sum+i }" />
		<c:if test="${not st.last }">,</c:if>
	</c:forEach>
	<br /> sum:${sum } <br />
	<hr /> <hr />

	<h3>choose</h3>
	<%
		int ranNum = (int) (Math.random() * 10);
		String grade = "a" + ranNum;
		System.out.println(grade);
	%>
	<c:set value="<%=grade%>" var="grade" />
	<c:choose>
		<c:when test="${grade=='a1' }">
		등급은 A1
		</c:when>
		
		<c:when test="${grade=='a2' }">
		등급은 A2
		</c:when>
		
		<c:when test="${grade=='a3' }">
		등급은 A3
		</c:when>
		
		<c:otherwise>
		등급은 기타등등
		</c:otherwise>
		
	</c:choose>

</body>
</html>