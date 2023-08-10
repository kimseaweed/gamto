<%@page import="ch.qos.logback.core.model.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 상점</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<!-- main > 메인헤더 + 케로셀블럭 + 책상점 블럭 + 굿즈블럭  -->
	<main class="b_list container-md bg-light p-5">
		<!-- 메인헤더  -->
		<div class="">
			<h1 class="text-center pb-3 border-bottom mb-3">상점</h1>
		</div>
		<!-- 케로셀블럭  -->
		<div class="py-3 mb-5">
			<div id="carouselExampleDark" class="carousel carousel-dark slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="8000">
						<div class="d-block w-100 h-500px bg-secondary">
							<img src="https://via.placeholder.com/800x400" alt="..."
								class="caro-img">
						</div>
						<div class="carousel-caption d-none d-md-block">
							<h5>책 제목</h5>
							<p>책소개입니다 Lorem ipsum dolor sit amet.</p>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<div class="d-block w-100 h-500px bg-secondary">
							<img src="https://via.placeholder.com/800x400" alt="..."
								class="caro-img">
						</div>
						<div class="carousel-caption d-none d-md-block">
							<h5>책 광고입니다</h5>
							<p>책소개입니다 Lorem ipsum dolor sit amet.</p>
						</div>
					</div>
					<div class="carousel-item">
						<div class="d-block w-100 h-500px bg-secondary"
							data-bs-interval="2000">
							<img src="https://via.placeholder.com/800x400" alt="..."
								class="caro-img">
						</div>
						<div class="carousel-caption d-none d-md-block">
							<h5>굿즈도 광고합니다</h5>
							<p>책소개입니다 Lorem ipsum dolor sit amet.</p>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleDark" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleDark" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!--책상점 블럭  -->
		<div class=" py-3">
			<div class="border-bottom row">
				<h3 class=" ps-5 col">책 상점</h3>
				<p class="col text-end">감토에서 추천하는 책들을 만나보세요</p>
			</div>
			
			<div class="row mt-5 px-4 mb-5">
				<c:forEach var="dto" items="${b_list}" end="5">
			
					<div class="ribbon-wrapp col-xl-4 col-md-6 py-2 px-xl-4 px-1">
						<div class="ribbon">best</div>
						
						<div onclick="location='b_list/view?b_code=${dto.b_code}'; return false;" 
						
							class="row g-0 rounded overflow-hidden flex-md-row shadow-sm-hover h-md-250 position-relative px-3 py-2">
							<div class="col-6">
								<img src="../img/book/${dto.b_filename}"
									class="rounded b_list-thumbnail shadow-sm" width="" />
							</div>
							<div class="col px-md-3 px-5 d-flex flex-column position-static">
								<strong class="fs-7 d-inline-block mb-2 text-primary">[${dto.b_genre}]</strong>
								<h3 class="mb-0 fs-2">${dto.b_name}</h3>
								<div class="fs-7 ms-auto mt-2 text-muted">
									<b>${dto.b_author}</b> 저
								</div>
								<div class="fs-7 ms-auto mb-auto text-muted">
									<b>${dto.b_publisher} </b>출판
								</div>

								<div class="mb-1 text-muted text-end">
									<B>${dto.b_price}</B> 원
								</div>
								<a src="/b_list/addCart" class="btn btn-outline-primary text-center fs-6 addCart" onclick="event.stopPropagation();" id="${dto.b_code}">장바구니	
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 굿즈 블럭(임시) -->
		<div class="py-3">
			<div class="border-bottom row">
				<h3 class="col ps-5">문학 굿즈</h3>
				<p class=" col text-end">감토에서 준비한 굿즈도 확인해보세요</p>
			</div>
			<div class="row mt-5 px-4 mb-5">
				<c:forEach var="dto" items="${b_list}" end="5">
					<div class="col-xl-4 col-md-6 py-2 px-xl-4 px-1">
						<div onclick="location='b_list/view?b_code=${dto.b_code}'"
							class="row g-0 rounded overflow-hidden flex-md-row shadow-sm-hover h-md-250 position-relative px-3 py-2">
							<div class="col-6">
								<img src="../img/book/${dto.b_filename}"
									class="rounded b_list-thumbnail shadow-sm" width="" />
							</div>
							<div class="col px-md-3 px-5 d-flex flex-column position-static">
								<strong class="fs-7 d-inline-block mb-2 text-primary">[${dto.b_genre}]</strong>
								<h3 class="mb-0 fs-2">${dto.b_name}</h3>
								<div class="fs-7 ms-auto mt-2 text-muted">
									<b>${dto.b_author}</b> 저
								</div>
								<div class="fs-7 ms-auto mb-auto text-muted">
									<b>${dto.b_publisher} </b>출판
								</div>

								<div class="mb-1 text-muted text-end">
									<B>${dto.b_price}</B> 원
								</div>
								<%-- <button type="button" class="btn btn-outline-primary text-center fs-6" id="addCart">장바구니 담기
								</button>
								<input type="hidden" value="${dto.g_code}" class="g_code"/> --%>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
			var linkElements = document.querySelectorAll('a.addCart'); // 모든 a 태그 선택

			linkElements.forEach(function(link) {
			  link.addEventListener('click', function(event) {
			    var linkId = link.id; // 클릭한 a 태그의 id 속성 값 가져오기
				 $.ajax({
					  url:"/b_list/addCart",
		               dataType:'json',
		               type:"post",
					data: {'b_code': linkId},
					success: function(result){
						if(result == -1){
							alert("로그인 하세요 ");
							location = '/member/login';
						} else {
							alert("상품이 제대로 담겼다 이 자식아 ");
						}
					},
					error:function(result){  
			           console.log("fail");
					}
				}) 
			  });
			});
				
	</script>
</body>
</html>