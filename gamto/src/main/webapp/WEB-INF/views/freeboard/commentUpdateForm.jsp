<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정 페이지</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<main class="container pt-5">
		*${dto.f_category}<br>
		<div class="row">
		<p class="col mt-2">제목 : ${dto.f_title}</p> <p class="col ms-auto text-end me-5">작성자 : ${dto.f_writer}</p>
		<hr>
		</div>
		<div style="padding-bottom:200px;" class="row">
		<p class="col mt-2">내용 : ${dto.f_content}<br></p>
		<p class="col ms-auto text-end me-5"> 
		추천 수 : ${dto.f_recommend} &nbsp;| &nbsp;조회 수 : ${dto.f_view} <br>
		</p>
		</div>
		<hr>
		<div class="row">
			<p class="col mt-2">
				작성 날짜 : ${dto.f_regist_day} <br>
				수정 날짜 : ${dto.f_update_day} <br>
			</p>
			<p class="col ms-auto text-end me-5">
				<input type="button" value="좋아요♡" class="btnGood"/>
			</p>
		</div>
		<div class="pb-2">
			<a href="/board" class="pb-5">목록보기</a>
		</div><br>
		<input type="button" value="댓글 접기" class="btnComment mb-2">	
		<form method="post">
		<input type="hidden" value="${dto.f_seq_number}" name="f_seq_number"/>
		<input type="hidden" value="${cDto.c_seq_number}" name="c_seq_number"/>
			<table border="1"> 
				<tr>
					<td>${cDto.c_writer}</td>
					<td><input type="text" value="${cDto.c_content}" name="c_content"/></td>
					<td>${cDto.c_regist_day}</td>
					<td>${cDto.c_update_day}</td>
					<td><button type="button">${cDto.c_recommend}</button></td>
					<td><button type="button">${cDto.c_derecommend}</button></td>
					<td><button type="submit" formaction="/board/cUpdate">수정확인</button></td>
					<td><button type="submit" formaction="/board/cDelete">삭제</button></td>
				</tr>
			</table>
		</form>
	</main> <br>	
<script>
	 $(document).ready(function(){ 
		$(".btnGood").click(function(){
			$(location).attr('href','/board/good?f_seq_number=${dto.f_seq_number}');
		})
		$(".btnComment").click(function(){
			$(location).attr('href','/board/view?f_seq_number=${dto.f_seq_number}');
		})
	}) 
</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>














