<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Locale"%>
<%@page import="org.apache.tomcat.jni.Local"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- fmt태그 사용 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>Insert title here</title>
</head>
<body>
JSTL fmt(Formatting) : 숫자, 날짜, 시간을 포매팅 하는 기능과 국제화, 다국어 지원 기능을 제공

<!-- fmt태그 사용 -->
<c:set var="date" value="<%=new Date() %>"></c:set>
fmt사용 : <fmt:formatDate value="${date }"/>
<hr />
fmt미사용 : <c:set var="date" value="<%=new Date() %>"></c:set>
${date } <br />

<hr />
<c:set var="date" value="<%=new Date() %>"></c:set>
<fmt:formatDate value="${date }" type="time"/>

<hr />
<c:set var="date" value="<%=new Date() %>"></c:set>
시간과 날짜 : both <br />
<fmt:formatDate value="${date }" type="both" dateStyle="short"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="medium"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="long"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="full"/> <br />

<hr />
년월일[ a=am/pm, [E]=요일 ]시분초  <br />
<fmt:formatDate value="${date }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="medium" pattern="YYYY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="long" pattern="YYYY-MM-dd[E]"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="full" pattern="YYYY-MM-dd[E] a hh:mm:ss"/> <br />

<hr />
, : <fmt:formatNumber value="100000" />
<hr />
% : <fmt:formatNumber value="100000" type="percent" />
<hr />
\ : <fmt:formatNumber value="100000" type="currency" />
<hr />
\_원 : <fmt:formatNumber value="100000" type="currency" />원
<hr />
#원 : <fmt:formatNumber value="100000" type="currency" pattern="#원"/>
<hr />
###원 : <fmt:formatNumber value="100000" type="currency" pattern="###,###원"/>
<hr />
###>원 : <fmt:formatNumber value="100000" type="currency" pattern="###,###"/>원

<hr />
###.### : <fmt:formatNumber value="100000.123" type="currency" pattern="###,###.###"/>

<hr />
<fmt:setLocale value="en_us"/> <!-- locale : US버전 -->
<fmt:formatDate value="${date }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="medium" pattern="YYYY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="long" pattern="YYYY-MM-dd[E]"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="full" pattern="YYYY-MM-dd[E] a hh:mm:ss"/> <br />

<hr />
<fmt:setLocale value="ko_kr"/> <!-- locale : Kr버전 -->
<fmt:formatDate value="${date }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="medium" pattern="YYYY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="long" pattern="YYYY-MM-dd[E]"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="full" pattern="YYYY-MM-dd[E] a hh:mm:ss"/> <br />

<hr />
국가코드 알아보기 <br />
<c:set var="ics" value="<%=Locale.getAvailableLocales() %>" />
<c:forEach items="${ics }" var="lo">
	${lo },
</c:forEach>

<hr />
<fmt:setLocale value="en_us"/>
<fmt:formatDate value="${date }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="medium" pattern="YYYY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="long" timeZone="America/Los_Angeles"/> <br />
<fmt:formatDate value="${date }" type="both" dateStyle="full" pattern="YYYY-MM-dd[E] a hh:mm:ss"/> <br />

<hr />
timeZone 알아보기 <br />
<c:set var="ts" value="<%=TimeZone.getAvailableIDs() %>" />
<c:forEach items="${ts }" var="t">
	${t },
</c:forEach>



</body>
</html>