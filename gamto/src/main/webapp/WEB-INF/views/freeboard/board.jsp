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

		<p>
			<a href="/board/writeForm">글작성</a>
		</p>

		<p>카테고리별 검색</p>
		<form action="">
			<select name="f_category">
				<option value="">카테고리</option>
				<option value="토론회 모집">토론회 모집</option>
				<option value="토론">토론</option>
				<option value="책추천">책추천</option>
				<option value="책교환">책교환</option>
			</select>
		</form>
		<td width="100%" align="left">&nbsp;&nbsp; 
		<select name="items"
			class="txt">
				<!--검색버튼을 클릭하면 request 내장객체에 items의 값을 저장 -->
				<option value="subject">제목에서</option>
				<option value="content">본문에서</option>
				<option value="name">글쓴이에서</option>
		</select>
			<input type="submit" class="btn btn-primary " value="검색 " />
		</td>











		<div>
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
	<jsp:include page="../header.jsp" />
</body>
</html>