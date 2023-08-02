<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm</title>
</head>
<body>
<jsp:include page="../header.jsp" />
<main>
	<table border="1">
		<form action="write" method="post">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="f_writer" size="100"/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="f_title" size="100"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="f_content" size="100"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입력"/>&nbsp;&nbsp;
					<a href="board">목록보기</a>
				</td>
			</tr>
		</form>
	</table>
</main>
<jsp:include page="../footer.jsp" />
	<%
		if(session.getAttribute("u_id")==""||session.getAttribute("u_id")==null) {
    		out.println("<script>alert('로그인이 필요합니다.');</script>");
    		out.println("<script>window.location.href='/login';</script>");
		}
%>
</body>
</html>