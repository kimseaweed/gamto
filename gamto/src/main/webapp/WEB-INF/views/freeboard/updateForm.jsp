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
	<form action="update" method="post">
		<table border="1">
		<input type="hidden" value="${updateForm.f_seq_number}" name="f_seq_number"/>
			<tr>
				<td>작성자</td>
				<td>${updateForm.f_writer}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="f_title" size="100"
					value="${updateForm.f_title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="f_content" size="100"
					placeholder="${updateForm.f_content}" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="수정완료"/>&nbsp;&nbsp;
				<input type="reset" value="다시작성" />
					<a href="board">목록보기</a></td>
			</tr>

		</table>
	</form>
</body>
</html>