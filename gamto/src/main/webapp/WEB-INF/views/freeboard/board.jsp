<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.jsp</title>
</head>
<body>
<jsp:include page="../header.jsp" />
<main>
	<table border="1">
		<tr>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
			<th>추천수</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${board}" var="dto">
			<tr>
				<td>${dto.f_seq_number}</td>
				<td><a href="view?f_seq_number=${dto.f_seq_number}">${dto.f_title}</a></td>
				<td>${dto.f_writer}</td>
				<td>${dto.f_regist_day}</td>
				<td>${dto.f_update_day}</td>
				<td>${dto.f_recommand}</td>
				<td>${dto.f_view}</td>
			</tr>
		</c:forEach>
	</table>
	<p><a href="/board/writeForm">글작성</a></p>
</main>
<jsp:include page="../header.jsp" />
</body>
</html>