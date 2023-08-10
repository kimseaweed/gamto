<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 페이지</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<main class="container pt-5">
	<div class="row">
	<p class="col mt-2">제목 : ${dto.r_title}</p> <p class="col ms-auto text-end me-5">작성자 : ${dto.r_writer}</p>
	<hr>
	</div>
	<div style="padding-bottom:200px;" class="row">
	<p class="col mt-2">내용 : ${dto.r_content}<br></p>
	<p class="col ms-auto text-end me-5"> 
	추천 수 : ${dto.r_recommend} &nbsp;| &nbsp;조회 수 : ${dto.r_view} <br>
	</p>
	</div>
	<hr>
	<div class="row">
	<p class="col mt-2">
		작성 날짜 : ${dto.r_regist_day} <br>
		수정 날짜 : ${dto.r_update_day} <br>
	</p>
	<p class="col ms-auto text-end me-5">
		<c:if test = "${sessionId==u_id}">
			<input type="button" value="수정" class="btnUpdate">
			<input type="button" value="삭제" class="btnDelete">
		</c:if>	
		<input type="button" value="좋아요♡" class="btnGood"/>
	</p>
	<br>
	</div>
	<div class="pb-2">
		<a href="/list" class="pb-5">목록보기</a>
	</div>
	<br>	
	</main>
	<jsp:include page="../footer.jsp" />
<script>
	 $(document).ready(function(){ 
		var btnDelete = $(".btnDelete");
		$(".btnUpdate").click(function(){
			if(!confirm("수정하시겠습니까?")){
				return false;
			}else{
				$(location).attr('href','/list/updateForm?r_seq_number=${dto.r_seq_number}');
			}
		})
		btnDelete.click(function(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}else{
				alert("삭제되었습니다.");
				$(location).attr('href','/list/delete?r_seq_number=${dto.r_seq_number}');
			}
		})
		$(".btnGood").click(function(){
			$(location).attr('href','/list/good?r_seq_number=${dto.r_seq_number}');
			
		})
	}) 
</script>
</body>
</html>
