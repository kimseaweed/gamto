<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 신개념 독서토론</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
<link rel="stylesheet" href="/css/gamto.css" />
</head>
<body>
	<div class="carrot"></div>
	<header class="container flex-wrap justify-content-cente mb-3">
		<div class="pt-4 pb-1 d-flex justify-content-between">
			<div class="logobox pb-2">
				<a href="/" class="text-decoration-none d-flex align-items-end">
					<div class="img"></div> <span class="ms-3 link-dark">감토</span>
				</a>
			</div>
			<ul class="nav-pills d-flex align-items-end mb-1">
				<li class="nav-item"><a href="/write"
					class="px-3 mx-1 link-dark link2 link2_green"
					data-bs-placement="left" data-bs-html="true"
					data-bs-toggle="tooltip" data-bs-title="| 글쓰기 |<br>나의 생각을 적어보세요">나의
						생각</a></li>
				<li class="nav-item"><a href="/list"
					class="px-3 mx-1 link-dark link2 link2_blue"
					data-bs-placement="left" data-bs-html="true"
					data-bs-toggle="tooltip"
					data-bs-title="| 독후감 |<br>다른 감토님의 생각도 <br>확인해 보세요">너의 생각</a></li>
				<li class="nav-item"><a href="/board"
					class="px-3 mx-1 link-dark link2 link2-purple link"
					data-bs-placement="left" data-bs-html="true"
					data-bs-toggle="tooltip"
					data-bs-title="| 게시판 |<br>감토님들과 생각을 <br>나눠보세요">우리 생각</a></li>
				<li class="nav-item ms-5"><a href="/b_list"
					class="me-4 link-dark" data-bs-placement="bottom"
					data-bs-html="true" data-bs-toggle="tooltip" data-bs-title="상점 "><i
						class="bi bi-cart3"></i></a></li>
				<li class="nav-item"><a href="/member" class="me-4 link-dark"
					data-bs-placement="bottom" data-bs-html="true"
					data-bs-toggle="tooltip" data-bs-title="로그인 "><i
						class="bi bi-person"></i></a></li>
			</ul>
		</div>
	</header>
</body>
</html>