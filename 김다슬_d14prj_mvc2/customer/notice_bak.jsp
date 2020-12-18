<%@page import="com.tech.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.dao.NoticeDao"%>
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
<title>notice.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
<%
	/* NoticeDao dao = new NoticeDao();
	List<Notice> list = dao.getNotices(); */
%>

</head>
<body>
	<h3>notice</h3>

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
			<%-- <%while(rs.next()){ %> --%>
			<%
				List<Notice> list = (List<Notice>) request.getAttribute("list");
				for (Notice n : list) {
					pageContext.setAttribute("n", n);
			%>
			<tr>

				<td><center>${n.seq}</center></td>
				<td><center>
						<a href="noticeDetail.do?c=${n.seq}">${n.title}</a>
					</center></td>
				<td><center>${n.writer}</center></td>
				<td><center>${n.regdate}</center></td>
				<td><center>${n.hit}</center></td>

			</tr>
			<%
				}
			%>


		</tbody>

	</table>
	<a href="noticeReg.do?c=3">Write</a>
</body>
</html>
