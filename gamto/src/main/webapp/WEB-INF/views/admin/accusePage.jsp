<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mrmr.gamto.help.dto.AccuseDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지 | 문의 상세</title>
<style>
</style>
</head>
<body>
<div class="d-none">
	<jsp:include page="../header.jsp" />
</div>
	<main class="mx-auto p-3 mt-2">
		<div class="bg-light mb-5 px-2 py-xl-5 py-0">
			<div class="col-auto row pt-3">
				<jsp:include page="adminPageSideBar.jsp" />
				<!--  -->
				<div class="container  col pt-lg-3">
					
					${dto.a_seq_number}
					${dto.a_date}
					${dto.a_id}
					${dto.a_category}
					${dto.a_content}
					${dto.a_filename}
					${dto.a_email}
					${dto.a_reception}
					${dto.a_complete}
					
					
				</div>
				<!--  -->
			</div>
		</div>
	</main>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>