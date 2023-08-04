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
<%-- <%
if(session.getAttribute("u_id")==""||session.getAttribute("u_id")==null) {
    out.println("<script>alert('로그인이 필요합니다.');</script>");
    out.println("<script>window.location.href='/login';</script>");
}

Stirng userid = session.getAttribute("u_id");
%> --%>
	<jsp:include page="../header.jsp" />

	<main class="container-md bg-light px-5 pt-4 rounded shadow-sm">
		<form id="writeForm" action="/write/writeBook_report" method="post" class="p-5 mb-4 bg-light rounded-3 needs-validation" 
			enctype="multipart/form-data" novalidate>
			<input type="hidden" name="r_writer" value="" />
			<div class="mb-5">
				<h3>나의생각 | 독후감 작성하기</h3>
			</div>
			<div class="mb-3">
				<input name="r_title" class="form-control" type="text"
					id="validationCustomUsername" placeholder="제목을 입력해주세요"
					aria-label="default input example" required>
				<div class="invalid-feedback">제목을 입력해주세요</div>
			</div>
			<div class="input-group mb-3">
			<input name="filename" class="form-control" id="inputGroupFile02" type="file"  value="default.png"/>
			 <label class="input-group-text" for="inputGroupFile02">표지를 골라주세요 !</label>
			 <div class="valid-feedback">표지를 선택하지 않으면 기본이미지가 선택됩니다. </div>
			</div>
			<textarea name="r_content" class="form-control" id="summernote" required></textarea>
			<div class="invalid-feedback text-end mt-3 fs-5">내용이 비어있어요!</div>
			<div class="col-12 pt-4 d-grid gap-2 d-md-flex">
				<button class="btn btn-warning me-3" onclick="location='list'; return false;">너의생각으로 이동</button>
				<button class="btn btn-warning me-3" onclick="location='board'; return false;">우리생각으로 이동</button>
				<button class="btn btn-primary ms-auto p-2" type="submit">작성하기</button>
			</div>
		</form>
	</main>
	<jsp:include page="../footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$('#summernote').summernote({
			placeholder : '감토님의 생각을 표현해보세요.',
			tabsize : 2,
			height : 500,
			lang : 'ko-KR',
			focus : true,
			disableGrammar: false,
			toolbar: [
				    ['fontname',['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','hr']],
				    ['view', ['fullscreen','codeview']]//codeview 삭제예정
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			,
			});	
		
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(() => {
		  'use strict'

		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  const forms = document.querySelectorAll('.needs-validation')

		  // Loop over them and prevent submission
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		      if (!form.checkValidity()) {
		        event.preventDefault()
		        event.stopPropagation()
		      }

		      form.classList.add('was-validated')
		    }, false)
		  })
		})()
	</script>
</body>
</html>