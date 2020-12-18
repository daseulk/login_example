<%@page import="com.tech.vo.Notice"%>
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
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" />

<%
/* String seq=request.getParameter("c");

NoticeDao dao=new NoticeDao();
Notice n=dao.getNotice(seq); */


/* Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="green";
String pw="123456";

Connection con=DriverManager.getConnection(url,user,pw);

Statement st= con.createStatement();

String sql="select seq,title,writer,content,regdate,hit "+
"from notices "+
"where seq="+seq;
ResultSet rs=st.executeQuery(sql);
rs.next();
 */

%>


</head>
<body>
<h3>noticeEdit.jsp</h3>
<form action="noticeEditProc.do" method="post">
<table class="twidth">
<colgroup>	
	<col width="15%"/>
	<col width="35%"/>
	<col width="15%"/>
	<col width="35%"/>
</colgroup>
<caption>Edit</caption>
<tbody>
	<tr>
	<th class="left">글번호</th>
	<td>${n.seq}</td>
	<th class="left">조회수</td>
	<td>${n.hit }</td>
	
	</tr>
	<tr>
	<th class="left">작성자</th>
	<td>${n.writer}</td>
	<th class="left">작성시간</th>
	<td>${n.regdate }</td>
	</tr>
	
	<tr>
	<th class="left">제목</th>
	<td colspan="3">
	<input class="inp" name="title" value="${n.title }"  />
	</td>
	</tr>
	<tr>
	<th class="left">내용</th>
	<td colspan="3" id="content">
		<textarea class="txt" name="content">${n.content }</textarea>
	</td>
	</tr>
	
	<tr>
	<th class="left">첨부</th>
	<td colspan="3" id="addfile">cilp.png</td>
	</tr>
	
</tbody>
</table>
<div>
<input type="hidden" name="c" value="${n.seq }" />
<input type="submit"  value="save"/>
<a href="noticeDetail.do?c=${n.seq }">취소</a>
</div>

</form>
</body>
</html>