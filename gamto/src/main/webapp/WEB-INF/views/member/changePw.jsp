<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 비밀번호 찾기</title>
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<main class="container-md bg-light px-5 pt-4 rounded shadow-sm">
		<form action="/member/reset-pw/token.do" method="post" class="" id="form" >
		<input type="hidden" value="${u_id}"name="u_id"/>
		<input type="text" value="${u_id}" disabled="disabled"/>
		<input type="password" name="u_pw" autocomplete="off"/>
		<input type="submit" value="비밀번호 변경하기">
		</form>
	</main>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
	</script>
</body>
</html>