<%@page import="com.tech.vo.Notice"%>
<%@page import="com.tech.dao.NoticeDao"%>
<%@page import="java.sql.PreparedStatement"%>
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
<!-- insert into notices (seq,title,content,writer,regdate,hit)
values((select max(to_number(seq))+1 from notices),'title','hong','냉무',sysdate,0); -->
<%
/* String title=request.getParameter("title");
String content=request.getParameter("content"); */

/* //드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="green";
String pw="123456";

Connection con=DriverManager.getConnection(url,user,pw);
//실행

String sql="insert into notices(seq,title,content,writer,regdate,hit) "+
"values((select max(to_number(seq))+1 seqnum from notices),"+
"?,?,'shin',sysdate,0)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);

pstmt.executeUpdate(); */

/* NoticeDao dao=new NoticeDao();


Notice n=new Notice();
n.setTitle(title);
n.setContent(content);

int af=dao.write(n);

if(af>0){
//화면전환 list로 보내기
response.sendRedirect("notice.jsp");
	
} */




%>



</head>
<body>
<h3>noticeRegProc.jsp</h3>


</body>
</html>