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
<form action="update" method="post">
		<table border="1">
		<input type="hidden" value="${updateForm.f_seq_number}" name="f_seq_number"/>
			<tr>
				<td>작성자</td>
				<td>${updateForm.f_writer}</td>
			</tr>
			<select name="f_category" value="${updateForm.f_category}">				
				<option value="">카테고리</option>
				<option value="mozip">토론회 모집</option>
				<option value="toron">토론</option>
				<option value="recomend">책추천</option>
				<option value="change">책교환</option>
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
				<input type="submit" value="수정완료"/>&nbsp;&nbsp;
				<input type="reset" value="다시작성" />
			</tr>

		</table>
	</form>
</main>
<jsp:include page="../footer.jsp" />
</body>
</html>