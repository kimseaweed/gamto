<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>감토 | 나의생각</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<main class="container-md bg-light px-5 pt-4 rounded shadow-sm">
		<form id="writeForm" action="/write/writeBook_report" method="post" class="p-5 mb-4 bg-light rounded-3 needs-validation" 
			enctype="multipart/form-data" novalidate>
			<div class="mb-5">
				<h3>나의생각 | 독후감 작성하기</h3>
				<input type="hidden" name="r_writer" value="${u_id}" />
			</div>
			
				<div class="input-group input-group-lg my-5 ps-4 row">
				<div class="valid-feedback">책정보 등록이 완료되었어요! 하단에서 미리 볼 수 있어요</div>
				<span class="input-group-text col-xl-2 col-6"  >책 정보 추가</span>
				<select class="form-select col-xl-1 col-6" id="select">
				    <option selected value="">전체</option>
				    <option value="title">제목</option>
				    <option value="person">저자</option>
				    <option value="publisher">출판사</option>
				    <option value="isbn">ISBN코드</option>
				  </select>
				<input type="text" class="form-control-lg col-xl-auto col-12" name="reportFooter" id="reportFooter-query" placeholder="책 정보를 검색해보세요.">
				  <button class="btn btn-outline-secondary col-xl-2 col-6" type="button" onclick="resetFooter()">책 정보 삭제</button>
				  <button class="btn btn-outline-secondary col-xl-2 col-6" type="button" id="reportFooter-submit" data-bs-toggle="modal" data-bs-target="#exampleModal">검색하기</button>
			</div>
			
			<div class="mb-3">
				<input name="r_title" class="form-control" type="text"
					id="validationCustomUsername" placeholder="제목을 입력해주세요"
					aria-label="default input example" required>
				<div class="invalid-feedback">제목을 입력해주세요</div>
			</div>
			<div class="input-group mb-3">
			<input name="filename" class="form-control" id="inputGroupFile02" type="file"/>
			 <label class="input-group-text" for="inputGroupFile02">글 표지를 골라주세요 !</label>
			 <div class="valid-feedback">표지를 선택하지 않으면 기본이미지가 선택됩니다. </div>
			</div>
			<div class="invalid-feedback text-end mt-3 fs-5">내용이 비어있어요!</div>
			<textarea name="r_content" class="form-control" id="summernote" required></textarea>
			<input type="hidden" name="footer" id="footer">
			<div id="reportFooter-preview" class="d-none">
			
			</div>
			
			<div class="col-12 pt-4 d-grid gap-2 d-md-flex">
				<button class="btn btn-warning me-md-3" onclick="location='list'; return false;">너의생각으로 이동</button>
				<button class="btn btn-warning me-md-3" onclick="location='board'; return false;">우리생각으로 이동</button>
				<button class="btn btn-primary ms-md-auto p-2 mt-3 mt-md-0" type="submit">작성하기</button>
			</div>
		</form>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">책정보 검색</h1>
        <button type="button" class="btn-close searchClose" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary searchClose" data-bs-dismiss="modal" >닫기</button>
      </div>
    </div>
  </div>
</div>
		
	</main>
	<jsp:include page="../footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"></script>
	<script src="../js/write.js"></script>
</body>
</html>