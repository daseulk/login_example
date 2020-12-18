<%@page import="com.tech.dao.NoticeDao"%>
<%@page import="com.tech.vo.Notice"%>
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
	/* String seq = request.getParameter("c");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	NoticeDao dao = new NoticeDao();
	int af = dao.update2(seq,title,content); */
	
	
	/* 방법1 
	
	Notice n = new Notice();
	n.setSeq(seq);
	n.setTitle(title);
	n.setContent(content);

	NoticeDao dao = new NoticeDao();
	int af = dao.update(n); */
	
	/* if (af > 0) {

		//화면전환 detail 페이지로
		response.sendRedirect("noticeDetail.do?c=" + seq);
	} else {
		out.write("수정오류발생");
	} */
	/* //드라이버로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//접속
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="green";
	String pw="123456";
	
	Connection con=DriverManager.getConnection(url,user,pw);
	//실행
	
	String sql="update notices set title=?, content=?"
	+"where seq="+seq;
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	
	int af=pstmt.executeUpdate();
	if(af>0){
		
	//화면전환 detail 페이지로
	response.sendRedirect("noticeDetail.jsp?c="+seq);
	}else{
		out.write("수정오류발생");
	} */
%>


</head>
<body>
	<h3>noticeEditProc.jsp</h3>
</body>
</html>