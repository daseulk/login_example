<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- core태그 사용 / core는 c로 받아서 사용(prefix=c) -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>Insert title here</title>
</head>
<body>

	<!-- for each문 -->
	<c:forEach begin="1" end="5">
		<!--1부터 5까지=5번 반복-->
		1 <br />
	</c:forEach>

	<hr />

	<%
		List<String> list = new ArrayList<String>(Arrays.asList("홍", "박", "김"));
		request.setAttribute("list", list);
	%>
	<!-- list를 EL표현법으로 받을 수 있음 -->
	<c:forEach var="name" items="${list }" varStatus="status">
		<!-- varStatus = 순서번호 -->
		<%-- ${name } <br /> --%>
		${status.count } : <c:out value="${name }" />
		<br />
	</c:forEach>


	<hr />

	<c:forTokens items="홍,강,김,최,박" delims=",">
		100 <br />
	</c:forTokens>

	<hr />

	<c:forTokens var="name" items="홍,강,김,최,박" delims=",">
		<c:out value="${name }" />
	</c:forTokens>

	<hr />

	<c:forTokens var="name" items="김,나,박,이,하" delims="," varStatus="st">
		index : ${st.index } <br />
		current : ${st.current } <br />
		count : ${st.count } <br />
		first : ${st.first } <br />
		last : ${st.last } <br />
		begin : ${st.begin } <br />
		end : ${st.end } <br />
		step : ${st.step } <br />
		<br />


	</c:forTokens>

	<hr />

	<c:forTokens var="name" items="강1,강2,강3,강4,강5" delims="," varStatus="st"
		begin="1" end="3" step="2">
		
		index : ${st.index } <br />
		current : ${st.current } <br />
		count : ${st.count } <br />
		first : ${st.first } <br />
		last : ${st.last } <br />
		begin : ${st.begin } <br />
		end : ${st.end } <br />
		step : ${st.step } <br />
		<br />

	</c:forTokens>

	<hr />

	<c:forTokens var="name" items="홍/20,강/30,김/40" delims=",/" varStatus="st">
		
		index : ${st.index } <br />
		current : ${st.current } <br />
		count : ${st.count } <br />
		first : ${st.first } <br />
		last : ${st.last } <br />
		begin : ${st.begin } <br />
		end : ${st.end } <br />
		step : ${st.step } <br />
		<br />

	</c:forTokens>


</body>
</html>