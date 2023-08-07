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
	<br>	
	<jsp:include page="../footer.jsp" />
</body>
</html>














