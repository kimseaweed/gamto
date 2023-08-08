<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
<jsp:include page="../header.jsp" />
<main>
<form action="update" method="post" name="updateform">
		<table border="1">
		<input type="hidden" value="${updateForm.f_seq_number}" name="f_seq_number"/>
			<tr>
				<td>작성자</td>
				<td>${updateForm.f_writer}</td>
			</tr>
			<select name="f_category" value="${updateForm.f_category}">				
				<option value="">카테고리</option>
				<option value="토론회 모집">토론회 모집</option>
				<option value="토론">토론</option>
				<option value="책추천">책추천</option>
				<option value="책교환">책교환</option>
			</select>
			<tr>
				<td>제목</td>
				<td><input type="text" name="f_title" size="100"
					value="${updateForm.f_title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="f_content" size="100"
					value="${updateForm.f_content}" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="수정완료" onclick="checkForm()"/>&nbsp;&nbsp;
				<input type="reset" value="다시작성" />
			</tr>

		</table>
	</form>
</main>
<jsp:include page="../footer.jsp" />
<script>
	function checkForm(){
	    if(!document.updateform.f_category.value){
			   alert("카테고리를 선택해주세요");
			   return;
			}
	    if(!document.updateform.f_title.value){
	       alert("제목을 작성해 주세요");
	       return;
	    }
	    if(!document.updateform.f_content.value){
		   alert("내용을 작성해 주세요");
		   return;
		}
	    document.updateform.submit();
	 }
</script>
</body>
</html>