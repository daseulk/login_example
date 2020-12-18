<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.db.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("password");

	//DB연결
	Connection con = DBcon.getConnection();

	//실행
	String sql = "select pwd from member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();

	//특정 체크값...?
	String ypass = "";
	int x = -1; //id가 존재하지 않은 상태

	String msg = "";
	if (rs.next()) {
		ypass = rs.getString("pwd");
		if (ypass.equals(pass))
			x = 1; //로그인 성공
		else
			x = 0; //로그인 실패
	}

	System.out.println("login x : " + x);
	if (x == 1) {
		session.setAttribute("sessionID", id);
		msg = "../MainForm.jsp"; //login성공하여 페이지 이동
	} else if (x == 0) { // 0 : 비밀번호 입력이 잘못되었을 때 주소창에 0
		msg = "loginForm.jsp?msg=0";
	} else { //-1 : 아이디 입력 잘못되었을 때 주소창에 -1
		msg = "loginForm.jsp?msg=-1";
	}
	response.sendRedirect(msg);
%>
</head>
<body>
	<h3>loginProc</h3>
</body>
</html>