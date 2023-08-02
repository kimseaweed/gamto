<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 페이지</title>
</head>
<body>
	내용보기 <br>
	<hr>
	제목 : ${dto.f_title}<br>
	작성자 : ${dto.f_writer}<br>
	작성 날짜 : ${dto.f_regist_day} <br>
	수정 날짜 : ${dto.f_update_day} <br>
	추천 수 : ${dto.f_recommend} <br>
	조회 수 : ${dto.f_view} <br>
	내용 : ${dto.f_content}<br>
	<input type="button" value="좋아요♡" class="btnGood"/>
	<input type="button" value="수정" class="btnUpdate">
	<input type="button" value="삭제" class="btnDelete">	
	<br>
	<a href="board">목록보기</a>
	<br>
	<input type="button" value="댓글 달기" class="btnComment">	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	 $(document).ready(function(){ 
		var btnDelete = $(".btnDelete");
		$(".btnUpdate").click(function(){
			if(!confirm("수정하시겠습니까?")){
				return false;
			}else{
				$(location).attr('href','updateForm?f_seq_number=${dto.f_seq_number}');
			}
		})
		btnDelete.click(function(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}else{
				alert("삭제되었습니다.");
				$(location).attr('href','delete?f_seq_number=${dto.f_seq_number}');
			}
		})
		$(".btnGood").click(function(){
			$(location).attr('href','good?f_seq_number=${dto.f_seq_number}');
		})
		$(".btnComment").click(function(){
			$(location).attr('href','viewComment?f_seq_number=${dto.f_seq_number}');
		})
	}) 
</script>
</body>
</html>
