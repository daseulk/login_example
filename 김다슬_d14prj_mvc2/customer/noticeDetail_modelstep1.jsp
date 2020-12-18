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
String seq=request.getParameter("c");

Class.forName("oracle.jdbc.driver.OracleDriver");
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


//모델개념의 데이터 처리
String seq2=rs.getString("seq");
String title=rs.getString("title");
String writer=rs.getString("writer");
String content=rs.getString("content");
Date regdate=rs.getDate("regdate");
int hit=rs.getInt("hit");



rs.close();
st.close();
con.close();


%>

<h3>noticeDetail</h3>
<table class="twidth">
<colgroup>	<col width="15%"/>
	<col width="35%"/>
	<col width="15%"/>
	<col width="35%"/>
</colgroup>
<caption>Detail</caption>
<tbody>
	<tr>
	<th class="left">글번호</th>
	<td><%=seq2 %></td>
	<th class="left">조회수</td>
	<td><%=hit %></td>
	
	</tr>
	<tr>
	<th class="left">작성자</th>
	<td><%=writer%></td>
	<th class="left">작성시간</th>
	<td><%=regdate %></td>
	</tr>
	
	<tr>
	<th class="left">제목</th>
	<td colspan="3"><%=title %></td>
	</tr>
	<tr>
	<th class="left">내용</th>
	<td colspan="3" id="content"><%=content %></td>
	</tr>
	
	<tr>
	<th class="left">첨부</th>
	<td colspan="3" id="addfile">cilp.png</td>
	</tr>
	
</tbody>
</table>
<div>
	<a href="notice.jsp">목록</a>
	<a href="noticeEdit.jsp?c=<%=seq2%>">수정</a>
	<a href="noticeDelProc.jsp?c=<%=seq2 %>">삭제</a>
</div>
</body>
</html>
