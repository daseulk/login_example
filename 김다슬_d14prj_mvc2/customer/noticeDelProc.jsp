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
<%
/* String seq=request.getParameter("c");

NoticeDao dao=new NoticeDao();
int af=dao.delete(seq); */


/* //드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="green";
String pw="123456";

Connection con=DriverManager.getConnection(url,user,pw);

//실행
//String sql="delete from notices where seq="+seq;
String sql="delete from notices where seq=?";

PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, seq);

int af=pstmt.executeUpdate(); */
/* if(af>0){
	response.sendRedirect("notice.jsp");
}else{
	out.write("삭제오류발생");
}
  */
%>
</head>
<body>


<h3>noticeDelProc.jsp</h3>

</body>
</html>