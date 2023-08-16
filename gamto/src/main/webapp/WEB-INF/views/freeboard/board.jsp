<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.jsp</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main class="container pt-3">
		<div class="row mt-5">
			<form action="/board/SearchTotal" name="SearchTotal" method="post" class="col">
				<select name="item">
					<option value="f_title" selected>제목에서</option>
					<option value="f_content">본문에서</option>
					<option value="f_writer">글쓴이에서</option>
				</select> 
				<input type="text" name="text" /> 
				<input type="submit" value="검색" />
			</form>
			<form action="/board/SearchCategory" name="SearchCategory"
				method="post" class="col ms-auto text-end">
				<select name="f_category">
					<option value="토론회 모집">토론회 모집</option>
					<option value="토론">토론</option>
					<option value="책추천">책추천</option>
					<option value="책교환">책교환</option>
					<option value="자유로운 이야기" selected>자유로운 이야기</option>
				</select> 
				<input type="submit" value="카테고리별 검색" />
			</form>
		</div>
		<table class="table table-hover text-center mt-5">
			<thead>
				<tr>
					<th scope="col" col width=10%>번호</th>
					<th scope="col" col width=10%>카테고리</th>
					<th scope="col" col width=40%>제목</th>
					<th scope="col" col width=10%>작성자</th>
					<th scope="col" col width=10%>추천수</th>
					<th scope="col" col width=10%>조회수</th>
					<th scope="col" col width=10%>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${board}" var="dto">
					<c:set var="day" value="${dto.f_regist_day}" />
					<c:set var="regist_day" value="${day.split(' ')[0]}" />
					<tr>
						<td>${dto.f_seq_number}</td>
						<td>${dto.f_category}</td>
						<td><a href="/board/view?f_seq_number=${dto.f_seq_number}">${dto.f_title}</a></td>
						<td>${dto.f_writer}</td>
						<td>${dto.f_recommend}</td>
						<td>${dto.f_view}</td>
						<td><c:out value="${regist_day}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<p class="row">
			<a href="board/writeForm" class="col ms-3">글작성</a>
			<a href="/board" class="col ms-auto text-end me-5">목록보기</a> 
		</p> <br>
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