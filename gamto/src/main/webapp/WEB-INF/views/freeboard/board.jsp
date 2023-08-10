<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.jsp</title>
<script>
	function checkForm() {
		if (!document.SearchCategory.f_category.value) {
			alert("카테고리를 선택해주세요");
			return;
		}
		document.SearchCategory.submit();
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main class="container pt-1">
		<form action="/board/SearchCategory" name="SearchCategory"
			method="post" class="mt-5 ms-2">
			<select name="f_category">
				<option value="">카테고리</option>
				<option value="토론회 모집">토론회 모집</option>
				<option value="토론">토론</option>
				<option value="책추천">책추천</option>
				<option value="책교환">책교환</option>
			</select> <input type="button" value="카테고리별 검색" onclick="checkForm()" />
		</form>
		<table class="table table-hover text-center mt-3">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">카테고리</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">추천수</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${board}" var="dto">
					<tr>
						<td>${dto.f_seq_number}</td>
						<td>${dto.f_category}</td>
						<td><a href="/board/view?f_seq_number=${dto.f_seq_number}">${dto.f_title}</a></td>
						<td>${dto.f_writer}</td>
						<td>${dto.f_recommend}</td>
						<td>${dto.f_view}</td>
						<td>${dto.f_regist_day}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<p class="row">
			<a href="board/writeForm" class="col ms-3">글작성</a>
			<a href="/board" class="col ms-auto text-end me-5">목록보기</a> 
		</p> <br>
		<form action="/board/SearchTotal" name="SearchTotal" method="post">
			<select name="item">
				<option value="f_title" selected>제목에서</option>
				<option value="f_content">본문에서</option>
				<option value="f_writer">글쓴이에서</option>
			</select> 
			<input type="text" name="text" /> 
			<input type="submit" value="검색" />
		</form>
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