<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=devixe-width,initial-secale=1.0" />
<title>Insert title here</title>
<script>
function closePopup() {
	if (document.getElementById("check").value) {
		setCookie("popupYN5","N",1);
		self.close();
	}
}
function setCookie(name,value,expiredays) {
	var date = new Date();
	date.setDate(date.getDate()+expiredays);
	document.cookie=escape(name)+"="+escape(value)+";expires="+date.toUTCString();
}

</script>

</head>
<body>
<!-- <h3>popup.jsp</h3> -->
<div>
<img src="../img/milk.PNG" alt="milk" />
</div>
<input type="checkbox" id="check" onclick="closePopup()" />
하루에 한번만 보기



</body>
</html>