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
	<h3>noticeReg.jsp</h3>

	<form action="noticeRegProc.do" method="post">
		<table class="twidth">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>Write</caption>
			<tbody>
				<tr>
					<th class="left">제목</th>
					<td colspan="3"><input class="inp" type="text" name="title"
						size="50" /></td>
				</tr>
				<tr>

					<th class="left">내용</th>
					<td colspan="3"><textarea class="txt" name="content"></textarea>
					</td>

				</tr>

				<tr>
					<th class="left">첨부</th>
					<td colspan="3"><input type="file" class="inp" size="50" /></td>
				</tr>

			</tbody>

		</table>
		<div>
			<input type="submit" value="save" />
			<input type="button" class="cancel" value="cancel" />
		</div>

	</form>

</body>
</html>