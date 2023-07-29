<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 나의생각</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css">
<style>
	
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<main class="container-md pt-3 pb-5">
<form action="" method="post" class="p-5 mb-4 bg-light rounded-3">
<div class="mb-3">
<input class="form-control" type="text" id="validationCustomUsername" placeholder="제목을 입력해주세요" aria-label="default input example">
 <div class="valid-feedback">제목을 입력해주세요</div>
</div>
<div  class="form-control" id="summernote"></div>
  <div class="col-12 py-4 pe-3">
    <button class="btn btn-warning float-end" type="submit">작성하기</button>
  </div>
</form>
</main>
<jsp:include page="footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
$('#summernote').summernote({
  placeholder: '',
  tabsize: 2,
  height: 400,
  lang: 'ko-KR',
});
</script>
</body>
</html>