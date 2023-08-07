<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>감토 | 나의생각</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css">
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<main class="container-md bg-light px-5 pt-4 rounded shadow-sm">
		<form action="" method="post" class="" >
		 	<label>회원가입한 아이디 <input type="text" name="u_id" id="u_id"> </label> <br>
		 	<label>가입시 등록한 이메일 <input type="email" name="u_mail" id="u_mail"> </label>
		 	<input type="button" value="인증메일 받기" onclick="checkMember() sendNumber()">
		</form>
	</main>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		function checkMember(){
			$.ajax({
				url:"",
				type:"post",
				dataType="json",
				data:{u_id : $('#u_id').val(),
					u_mail : $('#u_mial').val()}
			})
		}
		
		function sendNumber(){
			
		}
	</script>
</body>
</html>