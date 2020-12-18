<%@page import="com.tech.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.dao.NoticeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<title>notice.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
<%
	/* NoticeDao dao = new NoticeDao();
	List<Notice> list = dao.getNotices(); */
%>

</head>
<h3>김다슬 리스트</h3>
<body>
	<!-- 검색구성 -->
	<form action="notice.do" method="get">
		<input type="hidden" name="pg" value="1" />
		<!-- 전달된 상태값을 보존하겠다는 뜻 -->

		<select name="f">
			<option value="title" ${param.f=="title"?"selected":"" }>제목</option>
			<option value="content" ${param.f=="content"?"selected":"" }>내용</option>
		</select> 
			<input type="text" name="q" value="${param.q }" />	<!-- 검색한 내용이 검색창에 남아있게 하는 것 -->
		<input type="submit" value="검색" />
	</form>


	<table class="twidth">
		<colgroup>
			<col width="9%" />
			<col width="28%" />
			<col width="12%" />
			<col width="38%" />
			<col width="13%" />

		</colgroup>
		<caption>List</caption>

		<tbody>
			<tr>
				<th class="left">번호</th>
				<th class="left">제목</th>
				<th class="left">작성자</th>
				<th class="left">작성일</th>
				<th class="left">조회수</th>
			</tr>

			<c:forEach var="n" items="${list }">
				<tr>

					<td><center>${n.seq}</center></td>
					<td><center>
							<a href="noticeDetail.do?c=${n.seq}">${n.title}</a>
						</center></td>
					<td><center>${n.writer}</center></td>
					<td><center>${n.regdate}</center></td>
					<td><center>${n.hit}</center></td>

				</tr>
			</c:forEach>

		</tbody>

	</table>
	<a href="noticeReg.do">Write</a>
	<br />
	
	<!-- 이전으로 이동할 곳이 없을 때는 링크없이 prev만 출력 -->
	<c:if test="${start==1 }">
		<span>prev</span> 
	</c:if>

	<!-- 이전으로 이동하는 링크 만들기 -->
	<c:if test="${start!=1 }">
		<span>
		<a href="notice.do?pg=${(page-(page-1)%5)-5 }&f=${param.f==null?'title':param.f}&q=${param.q}">prev</a>		
		<!-- (page-(page-1)%5) - 5 = 이전으로 이동하는 링크에서 시작할 번호 / f,q= 해당 링크에서 가져올 내용과 설정들 -->
		</span>
	</c:if>
	
	<!-- 페이지 번호마다 페이지로 이동하는 링크 만들기 -->
	<c:forEach begin="${(page-(page-1)%5) }" end="${(page-(page-1)%5)+4 }" var="i">
	<!-- begin에 0에서 (page-(page-1)%5)로 내용 바꿈 // end = 4에서 (page-(page-1)%5)+4로 내용 바꿈 -->
		<c:if test="${i<=end }">
			<c:if test="${i==page }">
				<strong> 
					<a id="red"	href="notice.do?pg=${i }&f=${param.f==null?'title':param.f}&q=${param.q}">${i }&nbsp;</a>
					<!-- 위에 시작이 1이기 때문에 i+1에서 i로 수정됨 -->
				</strong>
			</c:if>
			<c:if test="${i!=page }">			
					<a	href="notice.do?pg=${i }&f=${param.f==null?'title':param.f}&q=${param.q}">${i }&nbsp;</a>
			</c:if>
		</c:if>
	</c:forEach>
	
	
	<!-- 다음으로 이동하는 링크만들기 -->
	<c:if test="${start+4>=end }">
		<span>next</span> <!-- 더이상 다음으로 이동할 링크가 없을 때 next_글만 나옴 -->
	</c:if>

	
	<c:if test="${start+4<end }">
		<span> <!-- 다음으로 이동할 곳이 없을 때는 링크없이 next만 출력 -->
		<a href="notice.do?pg=${(page-(page-1)%5)+5 }&f=${param.f==null?'title':param.f}&q=${param.q}">next</a>		
		<!-- (page-(page-1)%5) + 5 = 다음으로 이동하는 링크에서 시작할 번호 / f,q= 해당 링크에서 가져올 내용과 설정들 -->
		</span>
	</c:if>
	
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span>${page }/${end }</span>page
	
	<style>
	a{
	text-decoration : none;
	}
	#red{
	color : red;
	}
	</style>
</body>
</html>
