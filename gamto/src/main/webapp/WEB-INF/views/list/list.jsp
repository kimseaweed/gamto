<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
	<table border="1" width="500">
		<tr>
			<td>번호</td>
			<td>이미지</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>수정일</td>
			<td>조회</td>
			<td>추천</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.r_seq_number}</td>
				<td>
					<img src="../img/book/${dto.r_filename}" width="100" height="141">
				</td>
				<td><a href="view?r_seq_number=${dto.r_seq_number}">${dto.r_title}</a></td>
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
		<form action="/list/SearchTotal" name="SearchTotal" method="post">
			<select name="item">
				<option value="r_title" selected>제목에서</option>
				<option value="r_content">본문에서</option>
				<option value="r_writer">글쓴이에서</option>
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
	
	<p><a href="writeForm">글작성</a></p>
</body>
</html>