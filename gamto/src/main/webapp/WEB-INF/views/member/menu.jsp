<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>193_sql</title>
<style>
	.adminNav+.userNav{
		margin-top:50px;
	}
</style>
</head>
<body>
<!-- 17-2)관리자만 보이는 네브 목록 설정 -->
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
	<c:choose>
		<c:when test="${sessionId eq 'admin'}">
			<nav class="navbar navbar-expand-lg navbar-dark fixed-top Strong adminNav" style="background-color:#89C1C9;">
				<ul class="navbar-nav mr-auto">
					<a class="navbar-brand">관리자 모드</a>	
					<li class="nav-item">
						<a class="nav-link text-white" href="memberList">회원 목록</a>
					</li>
				</ul>
			</nav>
		</c:when>
	</c:choose>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark userNav">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav navbar-right">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item">
							<a class="nav-link" href="loginMemberForm">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="addMember">회원가입</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							[<%=sessionId%>님 로그인중]
						</li>
						<li class="nav-item">
							<a class="nav-link" href="logoutMember">로그아웃</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="updateMember?u_id=${sessionId}">회원수정</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="deleteMember">회원탈퇴</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
</body>
</html>