<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<div class="col-lg-2 col-12 p-3">
		<h1 class="navbar-expand-lg  text-center pt-3 pb-lg-5 pb-2">관리자<br>페이지</h1>
		<nav class="">
			<ul class=" fs-4 d-flex d-lg-block ps-1 text-center">
			<li class="py-lg-4 flex-fill"> <a href="/admin">회원관리</a> </li>
			<li class="py-lg-4 flex-fill">
				클레임 관리
					<ul>
						<li class="py-1 fs-5 flex-fill text-secondary "><a href="/admin/ask">문의내역</a> </li>
						<li class="py-1 fs-5 flex-fill text-secondary "><a href="/admin/accuse">신고내역</a> </li>
					</ul>				
			</li>
			<li class="py-lg-4 flex-fill"><a href="/admin">게시물관리</a></li>
			<li class="py-lg-4 flex-fill">
				상품 관리
					<ul>
						<li class="py-1 fs-5 flex-fill text-secondary "><a href="/admin/store/list">상품리스트</a> </li>
						<li class="py-1 fs-5 flex-fill text-secondary "><a href="/admin/store/new">상품등록</a> </li>
					</ul>	
			</li>
			</ul>
		</nav>
	</div>
</body>
</html>