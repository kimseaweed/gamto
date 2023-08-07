<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
 	<table border="1">
 		<tr>
 			<th>아이디</th>
 			<th>비밀번호</th>
 			<th>이름</th>
 			<th>번호</th>
 			<th>메일</th>
 			<th>주소</th>
 		</tr>
 		<c:forEach items="${list}" var="dto">
 			<tr>
 				<td>${dto.u_id}</td>
 				<td>${dto.u_pw}</td>
 				<td>${dto.u_name}</td>
 				<td>${dto.u_phone}</td>
 				<td>${dto.u_email}</td>
 				<td>${dto.u_address}</td>
 			</tr>
 		</c:forEach>
 	</table>
</body>
</html>