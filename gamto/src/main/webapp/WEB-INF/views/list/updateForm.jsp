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
		<input type="hidden" value="${updateForm.r_seq_number}" name="r_seq_number"/>
			<tr>
				<td>작성자</td>
				<td>${updateForm.r_writer}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="r_title" size="100"
					value="${updateForm.r_title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="r_content" size="100"
					value="${updateForm.r_content}" /></td>
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
	    if(!document.updateform.r_title.value){
	       alert("제목을 작성해 주세요");
	       return;
	    }
	    if(!document.updateform.r_content.value){
		   alert("내용을 작성해 주세요");
		   return;
		}
	    document.updateform.submit();
	 }
</script>
</body>
</html>