<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 페이지</title>
</head>
<body>
	내용보기
	<br>
	<hr>
	제목 : ${dto.f_title}
	<br> 작성자 : ${dto.f_writer}
	<br> 작성 날짜 : ${dto.f_regist_day}
	<br> 수정 날짜 : ${dto.f_update_day}
	<br> 추천 수 : ${dto.f_recommend}
	<br> 조회 수 : ${dto.f_view}
	<br> 내용 : ${dto.f_content}
	<br>
	<input type="button" value="좋아요♡" class="btnGood" />
	<input type="button" value="수정" class="btnUpdate">
	<input type="button" value="삭제" class="btnDelete">
	<br>
	<a href="board">목록보기</a>
	<p>댓글달기</p>
	<table border="1"> 
		<c:forEach items="${cDto}" var="cdto">
			<tr>
				<td>${cdto.c_writer}</td>
				<td>${cdto.c_content}</td>
				<td>${cdto.c_regist_day}</td>
				<td>${cdto.c_update_day}</td>
				<td><button type="submit" onClick="location.href='cGoodCnt?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">${cdto.c_recommend}</button></td>
				<td><button type="submit" onClick="location.href='cBadCnt?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">${cdto.c_derecommend}</button></td>
				<td><button type="submit" onClick="location.href='cUpdateForm?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">수정</button></td>
				<td><button type="submit" onClick="location.href='cDelete?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form action="insertCommend?f_seq_number=${dto.f_seq_number}" method="post">
			댓글 : <input type="text" name="c_content" /> <br>
			작성자 : 로그인한 세션 아이디를 담은 c_writer; <br>
			<!-- <input type="submit" value="댓글 등록" class=""/> -->
			<button type="submit">댓글 등록</button>
		<br> 
	</form>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			var btnDelete = $(".btnDelete");
			$(".btnUpdate").click(function() {
				if (!confirm("수정하시겠습니까?")) {
					return false;
				} else {
					$(location).attr('href','updateForm?f_seq_number=${dto.f_seq_number}');
					}
				})
				
			btnDelete.click(function() {
				if (!confirm("삭제하시겠습니까?")) {
					return false;
				} else {
					alert("삭제되었습니다.");
					$(location).attr('href','delete?f_seq_number=${dto.f_seq_number}');
					}
				})
				
			$(".btnGood").click(function() {
				$(location).attr('href','good?f_seq_number=${dto.f_seq_number}');
				})
			})
	</script>
</body>
</html>
