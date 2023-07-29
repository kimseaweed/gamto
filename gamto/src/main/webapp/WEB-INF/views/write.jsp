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
<form action="" method="post" class="p-5 mb-4 bg-light rounded-3" enctype="multipart/form-data">
<!-- 수정 페이지에서 원시 코드 보존을 위한 temp 부분 -->
<div id="temp" style="display: none">${board.contents}</div>
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
window.onload = function () {
    $('#summernote').summernote('code', document.getElementById('temp').innerHTML)
}
$('#summernote').summernote({
  placeholder: '',
  tabsize: 2,
  height: 400,
  lang: 'ko-KR',
});

/* onImageUpload: function (files, editor, welEditable) {
    // 파일 업로드
    for (var i = files.length - 1; i >= 0; i--) {
        var fileName = files[i].name
        var caption = prompt('이미지 설명:', fileName)
        if (caption == '') {
            caption = '이미지'
        }
        uploadSummernoteImageFile(files[i], this, caption)
    }
},
onMediaDelete: function ($target, editor, $editable) {
    // 삭제된 이미지의 파일 이름을 알아내기 위해 split 활용
    if (confirm('이미지를 삭제하시겠습니까?')) {
        var deletedImageUrl = $target.attr('src').split('/').pop()

        // ajax 함수 호출
        deleteSummernoteImageFile(deletedImageUrl)
    }
},
// 이미지 업로드 ajax
function uploadSummernoteImageFile(file, el, caption) {
data = new FormData()
data.append('file', file)
$.ajax({
    data: data,
    type: 'POST',
    url: 'uploadSummernoteImageFile',
    contentType: false,
    enctype: 'multipart/form-data',
    processData: false,
    success: function (data) {
        $(el).summernote('editor.insertImage', data.url, function ($image) {
            $image.attr('alt', caption) // 캡션 정보를 이미지의 alt 속성에 설정
        })
    },
})
}

// 이미지 삭제 ajax
function deleteSummernoteImageFile(imageName) {
data = new FormData()
data.append('file', imageName)
$.ajax({
    data: data,
    type: 'POST',
    url: 'deleteSummernoteImageFile',
    contentType: false,
    enctype: 'multipart/form-data',
    processData: false,
}) */

</script>
</body>
</html>