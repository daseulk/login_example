<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
String id=request.getParameter("id");
String pw2=request.getParameter("pw2");
String pwd2=request.getParameter("pwd2");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String birth=String.format("%s-%s-%s",year,month,day);

String isLunar=request.getParameter("isLunar");
String cphone=request.getParameter("cphone");
String email=request.getParameter("email");

String habits[]=request.getParameterValues("habit");
String habit="";
if(habits != null){
	if(habits.length >= 1){
		for(int i=0; i<habits.length; i++){
			habit += habits[i];
			if(habits.length>i+1)
				habit+=",";
		}
	}
}
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="green";
String pw="123456";

Connection con=DriverManager.getConnection(url,user,pw);
String sql="insert into member(id,pw2,name,gender,"
+"birth,is_lunar,cphone,email,habit,regdate) "
+"values(?,?,?,?,?,?,?,?,?,sysdate)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pw2);
pstmt.setString(3, name);
pstmt.setString(4, gender);
pstmt.setString(5, birth);
pstmt.setString(6, isLunar);
pstmt.setString(7, cphone);
pstmt.setString(8, email);
pstmt.setString(9, habit);

/* if(!pw2.equals(pwd2)){//비밀번호입력이 일치하지 않으면
	request.setAttribute("error", "비밀번호 불일치");
	//response.sendRedirect("join.jsp"); //제어권만 joinjsp로 넘김
	request.getRequestDispatcher("join.jsp").forward(request, response); //제어권이 join.jsp로 넘김 by data전달
} */

	List<String> errors=new ArrayList(); //에러내용 담기
	//id체크
	if(id==null || id.equals("")){
		errors.add("아이디입력필요");
	}
	if(!pw2.equals(pwd2)){
		errors.add("패스불일치");
	}
	if(errors.size()>0){ //에러가 존재하면
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("join.jsp").forward(request, response);
	}else{
		pstmt.executeUpdate(); //db에 insert 과정
		response.sendRedirect("../index.jsp");
	}


%>
출력 <br />

<%=id %>
<%=pw2 %>
<%=pwd2 %>
<%=name %>
<%=gender %>
<%=birth %>
<br />
<%=habit %>
</head>
<body>
<h3>joinProc.jsp</h3>

</body>
</html>