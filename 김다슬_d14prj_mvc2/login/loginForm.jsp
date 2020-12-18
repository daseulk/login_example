<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="../css/login_style.css" />
<script>
	function checkValue() { //onsubmit과 연결되어 있음
		inputForm = eval("document.loginInfo") /* loginForm에 접근한것 */
		if (!inputForm.id.value) {
			alert("아이디 입력");
			inputForm.id.focus(); //아이디 칸에 커서위치
			return false; // 빈칸일 때 alert창만 띄우고 창변환 없음 
		}
		if (!inputForm.password.value) {
			alert("비밀번호 입력");
			inputForm.password.focus(); //비밀번호 칸에 커서위치
			return false; // 빈칸일 때 alert창만 띄우고 창변환 없음
		}
		return true;
	}
	
	function goJoinForm() { //회원가입 onclick과 연결되어 있음
		location.href="../join/join.jsp";
	}
</script>

</head>
<body>
	<h3>loginForm.jsp</h3>
	<div id="wrap">
		<form action="loginProc.jsp" method="post" name="loginInfo"
			onsubmit="return checkValue()">
			<!-- onsubmit = true:action진행 / false:action진행 안됨 위의 checkValue에서 return값이 false -->


			<!-- 이미지 추가 -->
			<img src="../img/welcome.jpg" id="wel_img" alt="welcome" /> <br />
			<br />
			<table>

				<tr>
					<td bgcolor="#fddcaa">아이디</td>
					<td><input type="text" name="id" maxlength="50" /></td>
				</tr>

				<tr>
					<td bgcolor="#fddcaa">비밀번호</td>
					<td><input type="password" name="password" maxlength="50" /></td>
				</tr>
			</table>
			<br />
			<input type="submit" value="로그인" /> 
			<input type="button" value="회원가입" onclick="goJoinForm()" />



		</form>
	</div>
</body>
</html>