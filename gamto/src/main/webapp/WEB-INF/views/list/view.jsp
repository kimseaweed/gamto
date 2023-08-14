<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 페이지</title>
<style>
	.out{
		outline: none;
		border: none;
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp" />
	<main class="container pt-5">
	<div>
		<div class="row">
			<p>제목 : ${dto.r_title}</p> <span class="col col-lg-6" style="float: left;">작성자 : ${dto.r_writer}</span>
			<span class="text-end col col-lg-6">추천 수 : ${dto.r_recommend} &nbsp;| &nbsp;조회 수 : ${dto.r_view}</span>
		</div>
	</div>
	<hr>
	<div style="padding-bottom:200px;">
	<img src="../userUpload/${dto.r_filename}" width="150" height="212" style="float: left; margin-right: 20px;">
	<p class="col mt-2">내용 : ${dto.r_content}<br></p>
	</div>
	<hr>
	<div class="row">
	<p class="col mt-2">
		작성 날짜 : ${dto.r_regist_day} <br>
		수정 날짜 : ${dto.r_update_day} <br>
	</p>
	<p class="col ms-auto text-end me-5">
		<%String r_writer=(String)session.getAttribute("u_id");%>
		<c:set var="userId" value="<%=r_writer%>" />
				<c:if test="${dto.r_writer==userId}">
					<input type="button" value="수정"
						class="btnUpdate btn btn-outline-success">
					<input type="button" value="삭제"
						class="btnDelete btn btn-outline-danger">
				</c:if>
		<i class="bi bi-hand-thumbs-up btn btn-outline-warning btnGood">추천</i>
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
	 $(document).ready(function(){ 
		var btnDelete = $(".btnDelete");
		$(".btnUpdate").click(function(){
			if(!confirm("수정하시겠습니까?")){
				return false;
			}else{
				$(location).attr('href','/report/updateForm?r_seq_number=${dto.r_seq_number}&r_writer=${dto.r_writer}');
			}
		})
		btnDelete.click(function(){
			if(!confirm("삭제하시겠습니까?")){
				return false;
			}else{
				alert("삭제되었습니다.");
				$(location).attr('href','/report/delete?r_seq_number=${dto.r_seq_number}');
			}
		})
		$(".btnGood").click(function(){
			$(location).attr('href','/report/good?r_seq_number=${dto.r_seq_number}');
			
		})
	}) 
</script>
</body>
</html>
