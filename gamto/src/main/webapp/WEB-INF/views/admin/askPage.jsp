<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 | 문의 상세</title>
<style>
	.out{
		outline: none;
		border: none;
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
	<main class="container m-5">
	<div class=" m-5" >
		<div class="row">
			<p>제목 : ${dto.r_title}</p> <span class="col col-lg-6" style="float: left;">작성자 : ${dto.r_writer}</span>
			<input type="hidden" id="r_seq_number" value="${dto.r_seq_number}" />
			<p id="good" class="text-end col col-lg-6">
				<span>추천 수 : ${dto.r_recommend} &nbsp;| &nbsp;조회 수 : ${dto.r_view}</span>
			</p>
		</div>
	</div>
	<hr>
	<div style="padding-bottom:200px;">

	<p class="col mt-2">${dto.r_content}<br></p>
	</div>
	<hr>
	<div class="row">
	<p class="col mt-2">
		작성 날짜 : ${dto.r_regist_day} <br>
		수정 날짜 : ${dto.r_update_day} <br>
	</p>
	<p class="col ms-auto text-end me-5">
		<c:set var="userId" value=">" />
				<c:if test="${dto.r_writer==userId}">
					<input type="button" value="수정"
						class="btnUpdate btn btn-outline-success">
					<input type="button" value="삭제"
						class="btnDelete btn btn-outline-danger">
				</c:if>
				<i class="bi bi-hand-thumbs-up btn btn-outline-warning btnGood" id="goode">추천</i>
	</p>
	<br>
	</div>
	<div class="pb-2">
		<a href="/report" class="btn btn-outline-primary">목록보기</a>
	</div>
	<br>	
	</main>
	<jsp:include page="../footer.jsp" />
<script>
</script>
</body>
</html>
