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
function getCookie(name) {
	//alert(name);
	var cookie=document.cookie;
	if(document.cookie!=""){
		var cookie_array=cookie.split("; ");
		for(var index in cookie_array){
			var cookie_name = cookie_array[index].split("=");
			if (cookie_name[0]=="popupYN5") {
				return cookie_name[i];
			}
		}
	}
}

function openPopup(url) {
	//alert(url);
	var cookieCheck = getCookie("popupYN5");
	alert(cookieCheck);
	if (cookieCheck!="N") {
		window.open(url,'','width=450, height=750, left=100, top=50');
		
	} 
}

</script>


</head>
<body onload="javascript:openPopup('popup.jsp')">

<div>
<img src="../img/main.PNG" alt="main" />
</div>
</body>
</html>