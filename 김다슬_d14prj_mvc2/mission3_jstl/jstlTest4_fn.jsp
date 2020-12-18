<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %><!-- functions사용 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>jstlTest4_fn.jsp</title>
</head>
<body>
<!-- functions -->
<c:set var="str1" value="   Function   s <태그>를      사용합니다." />
<c:set var="str2" value="사용" />
<c:set var="str3" value="${fn:trim(str1)}" />
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10"/>

length(str1)=${fn:length(str1) } <br /> <!-- 앞의 공백3개까지 합해서 2n+3개 -->
toUpperCase(str1)=${fn:toUpperCase(str1)} <br />
toUpperCase(str1)=${fn:toUpperCase(str1)} <br />
length(str3)=${fn:length(str3) } <br /> <!-- trim이 앞의 공백3개를 안세서 2n개 -->

<hr />
subString(str1,3,6)=${fn:substring(str1,3,6) } <br />
subStringAfter(str1,str2)=${fn:substringAfter(str1,str2) } <br />
subStringBefore(str1,str2)=${fn:substringBefore(str1,str2) } <br />

<hr />
trim(str1)=${fn:trim(str1) } <br /> 
replace(str1,src,dest)=${fn:replace(str1," ","_")} <br /> <!-- 공백을 _로 적어줌 -->
replace(str1,src,dest)=${fn:replace(str1," ","")} <br />

<hr />
indexOf(str1,str2)=${fn:indexOf(str1,str2) } <br />
startsWith(str1,str2)=${fn:startsWith(str1,'Fun') } <br />
endsWith(str1,str2)=${fn:endsWith(str1,str2) } <br />
contains(str1,str2)=${fn:contains(str1,'fun') } <br />
containsIgnoreCase(str1,str2)=${fn:containsIgnoreCase(str1,'fun') } <br />

<hr />

<c:set var="array" value="${fn:split(tokens,',') }" />
join(array,"-")=${fn:join(array,"-") } <br />

<h2>split 사용 예제</h2>
<c:set var="str5" value="java|android|spring|jsp|servlet" />
<c:set var="splitStr" value="${fn:split(str5,'|') }" />
<ul>
<c:forEach var="str" items="${splitStr }" >
<li>${str }</li>
</c:forEach>
</ul>
</body>
</html>