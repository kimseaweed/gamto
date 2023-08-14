<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.jsp</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main class="container pt-1">
		<table class="table table-hover text-center mt-3">
			<thead>
				<tr>
					<th scope="col" col width=10%>생각</th>
					<th scope="col" col width=10%>제목</th>
					<th scope="col" col width=40%>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto">
					<c:set var="day" value="${dto.regist_day}" />
					<c:set var="regist_day" value="${day.split(' ')[0]}" />
					<tr>
						<td>${dto.tablename}</td>
						<td>${dto.title}</td>
						<td><c:out value="${regist_day}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-10"></div>
				<div class="col-2"><a href="board/writeForm" class="col ms-3">글작성</a></div>
			</div>
		</div>
		<div class="text-center mt-2">
			<a href="?pageNo=1">&lt;&lt;</a>

			<c:if test="${page.startNo eq 1}">
				<a href="?pageNo=1">&lt;</a>
			</c:if>
			<c:if test="${page.startNo ne 1}">
				<a href="?pageNo=${page.pageNo-1}">&lt;</a>
			</c:if>
			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				<a href="?pageNo=${i}">${i}</a>
			</c:forEach>

			<a href="?pageNo=${page.pageNo+1}">&gt;</a> <a
				href="?pageNo=${page.totalPage}">&gt;&gt;</a>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>