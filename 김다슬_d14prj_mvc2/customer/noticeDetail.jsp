<%@page import="com.tech.dao.NoticeDao"%>
<%@page import="com.tech.vo.Notice"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
	<%
	/* request안에 아래의 코드가 들어있음 그래서 ${n.테이블명}으로 적어서 내용을 가져옴 */
		/* String seq = request.getParameter("c");

		NoticeDao dao = new NoticeDao();
		Notice n = dao.getNotice(seq); //dao에 getnotice를 호출 */
	%>

	<h3>noticeDetail</h3>
	<table class="twidth">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>Detail</caption>
		<tbody>
			<tr>
				<th class="left">글번호</th>
				<td>${n.seq}</td>
				<th class="left">조회수</th>
				<td>${n.hit}</td>

			</tr>
			<tr>
				<th class="left">작성자</th>
				<td>${n.writer}</td>
				<th class="left">작성시간</th>
				<td>${n.regdate }</td>
			</tr>

			<tr>
				<th class="left">제목</th>
				<td colspan="3">${n.title }</td>
			</tr>
			<tr>
				<th class="left">내용</th>
				<td colspan="3" id="content">${n.content }</td>
			</tr>

			<tr>
				<th class="left">첨부</th>
				<td colspan="3" id="addfile">cilp.png</td>
			</tr>

		</tbody>
	</table>
	<div>
		<a href="notice.do">목록</a> 
		<a href="noticeEdit.do?c=${n.seq }">수정</a>
		<a href="noticeDelProc.do?c=${n.seq }">삭제</a>
	</div>
</body>
</html>
