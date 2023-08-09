<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 신개념 독서토론</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
<link rel="stylesheet" href="/css/gamto.css" />
</head>
<body>
	<!-- 당근커서. 데스크탑용  -->
	<div class="carrot d-none d-lg-block"></div>
	<!-- 데스크탑헤더 : lg 이상 환경 : 992px이상 -->
	<header class="d-none d-lg-block position-fixed top-0 d-flex justify-content-between">
	<nav class="flex-wrap justify-content-between pt-3 pb-2 d-flex">
			<div class="logobox pb-2">
				<a href="/" class="text-decoration-none d-flex align-items-end">
					<div class="img"></div> <span class="ms-3 link-dark display-5 mb-2">감토</span>
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
				<li class="nav-item dropdown">
				  <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				    <i class="bi bi-person"></i>
				  </a>
				
				  <ul class="dropdown-menu">
				  <% if(session.getAttribute("u_id")==""||session.getAttribute("u_id")==null){ %>
				    <li><a class="dropdown-item" href="/member/loginMemberForm">로그인</a></li>
				    <li><a class="dropdown-item" href="/member/">회원가입</a></li>
				   <% } else { %>
				   	<li><a class="dropdown-item" href="/member/">로그아웃</a></li>
				    <li><a class="dropdown-item" href="/member/">회원수정</a></li>
				   <% } %>
				  </ul>
				</li>
						
			</ul>
		</nav>
	</header>
	<!-- 랩탑,태블릿,모바일 헤더 : md 이상 환경 : 991px이하 -->
	<header class="d-block d-lg-none">
	<nav class="navbar bg-light fixed-top px-5">
			<div class="container-fluid">
				<div class="logobox me-auto">
					<a href="/" class="d-flex">
						<div class="img"></div> <span class="fs-1 pt-3 ps-1">감토</span>
					</a>
				</div>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
					aria-controls="offcanvasNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>
				
				<div class="offcanvas offcanvas-end" tabindex="-1"
					id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header logobox"><div class="img"></div>
						<h3 class="offcanvas-title fs-1 me-auto pt-3" id="offcanvasNavbarLabel">감토</h3>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
							<!-- active -->
							<li class="nav-item"><a class="nav-link fs-2 fw-bold"
								aria-current="page" href="/write"><i class="bi bi-blockquote-left me-3"></i>나의 생각</a></li>
							<li class="nav-item"><a class="nav-link fs-2 fw-bold" href="/board"><i class="bi bi-blockquote-left me-3"></i>너의 생각</a></li>
							<li class="nav-item"><a class="nav-link fs-2 fw-bold" href="/list"><i class="bi bi-blockquote-left me-3"></i>우리 생각</a></li>
							<hr/>
							<li class="nav-item"><a class="nav-link fs-2 fw-bold" href="/b_list"><i
						class="bi bi-cart3 me-3"></i>상점</a></li>
							<li class="nav-item"><a class="nav-link fs-2 fw-bold" href="/member"><i
						class="bi bi-person me-3"></i>나의 공간</a></li>
							<hr/>
					<!-- 		<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> Dropdown </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">Action</a></li>
									<li><a class="dropdown-item" href="#">Another action</a></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><a class="dropdown-item" href="#">Something else
											here</a></li>
								</ul></li> -->
						</ul>
						<form class="d-flex mt-3" role="search">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button>
						</form>
					</div>
				</div>
			</div>
			</nav>
		</header>

</body>
</html>