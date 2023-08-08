<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 신개념 독서토론</title>
</head>
<body>
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<jsp:include page="header.jsp"/>
<main>
<h1 class="text-center mx-10 my-5">웰컴페이지를 준비중입니다</h1>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>