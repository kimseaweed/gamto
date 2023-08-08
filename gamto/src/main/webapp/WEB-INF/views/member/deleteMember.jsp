<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMember.jsp</title>
</head>
<body>
	<form action="delete">
		<p>정말로 탈퇴하시겠습니까?</p>
		<label class="col-sm-2">삭제할 아이디</label> 
		<input type="text" class="form-control col-sm-3" name="u_id" />
		<label class="col-sm-2">삭제할 비밀번호</label> 
		<input type="text" class="form-control col-sm-3" name="u_pw" />
		<input type="submit" value="확인" />
	</form>
	<form action="welcome">
		<input type="submit" value="취소" />
	</form>
</body>
</html>