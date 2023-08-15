<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
 		<tr>
 			<th>아이디</th>
 		</tr>
 		<c: items="${list}" var="dto">
 			<tr>
 				<td>${dto.u_id}</td>
 			</tr>
 		</c:>
 	</table>
</body>
</html>