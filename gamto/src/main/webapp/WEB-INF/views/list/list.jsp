<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<script>
	.center{
		
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<main class="container">
		<div class="mb-5">
				<h3>너의생각 | 독후감 목록</h3>
			</div>
<form action="/list/SearchTotal" name="SearchTotal" method="post">
			<select name="item">
				<option value="r_title" selected>제목에서</option>
				<option value="r_content">본문에서</option>
				<option value="r_writer">글쓴이에서</option>
			</select> 
			<input type="text" name="text" /> 
			<input type="submit" value="검색" />
		</form>
		<br />
	<table class="row">
		<tr>
			<td class="col col-lg-1">번호</td>
			<td class="col col-lg-1">이미지</td>
			<td class="col col-lg-3">제목</td>
			<td class="col col-lg-1">작성자</td>
			<td class="col col-lg-2">작성일</td>
			<td class="col col-lg-2">수정일</td>
			<td class="col col-lg-1">조회</td>
			<td class="col col-lg-1">추천</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.r_seq_number}</td>
				<td>
					<img src="../img/book/${dto.r_filename}" width="100" height="141">
				</td>
				<td><a href="list/view?r_seq_number=${dto.r_seq_number}">${dto.r_title}</a></td>
				<td>${dto.r_writer}</td>
				<td>${dto.r_regist_day}</td>
				<td>${dto.r_update_day}</td>
				<td>${dto.r_view}</td>
				<td>${dto.r_recommend}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
		<p class="row">
			<a href="list/writeForm" class="col ms-3">글작성</a>
			<a href="/list" class="col ms-auto text-end me-5">목록보기</a> 
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