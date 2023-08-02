<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 상점</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<main class="container-md bg-light">
		<div class="row">
			<c:forEach var="dto" items="${b_list}">
				<div class="col-sm-4 col-xs-1">
					<img src="../img/book/${dto.b_filename}" class="row"/>
					<div class="row justify-content-center">${dto.b_code}</div>
					<div class="row justify-content-center">${dto.b_author}</div>	
				</div>
			</c:forEach>
		</div>
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>