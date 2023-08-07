<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- 17-9)select문으로 원하는 아이디와 비번을 가진 행 데이터를 가져와서 rs에 담고, forEach를 이용해서 루프를 돌면서 찾은 후에 연관 행이 있으면 msg매개변수 2를 가지고 resultMember.jsp로 이동, 없으면 error=1을 가지고 loginMember.jsp로 다시 이동 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processLoginMember.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String u_id =(String)request.getAttribute("u_id");
		session.setAttribute("sessionId",u_id);
		request.setAttribute("msg",2);
	%>
	test page
	<c:redirect url="member/resultMember" />
	<%-- <c:redirect url="loginMember.jsp?error=1" /> --%>
</body>
</html>;