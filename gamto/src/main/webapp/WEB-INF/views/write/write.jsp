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
%> --%>
	<jsp:include page="../header.jsp" />

	<main class="container-md pt-3 pb-5">
		<form id="writeForm" method="post" class="p-5 mb-4 bg-light rounded-3"
			enctype="multipart/form-data">
			<input type="hidden" name="r_writer" value="" />
			<div class="mb-5">
				<h3>나의생각 | 글 작성하기</h3>
			</div>
			<div class="mb-3">
				<select name="table" class="form-select" aria-label="Default select example" onchange="showHeader();">
					<option value="book_report" selected>너의생각 | 독후감</option>
					<option value="free_board">우리생각 |</option>
				</select>
			</div>
			<div class="mb-3">
				<select name="f_header" class="form-select" aria-label="select example" disabled>
					<option selected></option>
					<option value="나의공간" >[나의 공간 | 비공개]</option>
					<option value="토론회 모집" >[토론회 모집]</option>
					<option value="토론 진행" >[토론 진행]</option>
					<option value="도서 추천" >[도서 추천]</option>
					<option value="책 교환" >[책 교환]</option>
				</select>
			</div>
			<div class="mb-3">
				<input name="r_title" class="form-control" type="text"
					id="validationCustomUsername" placeholder="제목을 입력해주세요"
					aria-label="default input example">
				<div class="valid-feedback">제목을 입력해주세요</div>
			</div>
			<div class="mb-3">
			<input name="filename" class="form-control" type="file" />
			</div>
			<textarea name="r_content" class="form-control" id="summernote"></textarea>
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
		/*테이블선택시 말머리셀렉트 오픈*/
		function showHeader(){
		    if (document.getElementById("writeForm").table.value == "free_board") {
		    	document.getElementById("writeForm").f_header.disabled = false;
		    	document.getElementById("writeForm").f_header.options[0].style.display = "none";
		    	document.getElementById("writeForm").f_header.options[1].selected = true;
		      } else {
		    	  document.getElementById("writeForm").f_header.disabled = true;
		    	  document.getElementById("writeForm").f_header.options[0].style.display = "block";
		    	  document.getElementById("writeForm").f_header.options[0].selected = true;
			}
		};
		
		/*submit시 업로드할 테이블 선택과정*/
        document.getElementById("writeForm").addEventListener("submit", function(event) {
        event.preventDefault();
        var form = event.target;
        
        if(table=='book_report'){
        	form.action='write/writeBook_report';
        }else{
        	form.r_writer.setAttribute('name', 'f_writer');
        	form.r_title.setAttribute('name', 'f_title');
        	form.r_content.setAttribute('name', 'f_content');
        	form.action='write/writeFree_board';
        }
        form.submit(); 
    	});
	</script>
</body>
</html>