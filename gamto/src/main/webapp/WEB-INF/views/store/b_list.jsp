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
	<main class="b_list container-md bg-light px-5">
	
	<div class="">
	<h1 class="text-center pt-5 pb-3 border-bottom"> 상점 페이지 </h1>
	</div>
	
	/*케로셀*/
	/*베스트 셀러 */
	/*문학 굿즈샵*/
	
	
		<div class="row mt-5 px-4">
			<c:forEach var="dto" items="${b_list}" end="5">
				<div class="ribbon-wrapp col-xl-4 col-md-6 py-2 px-xl-4 px-1">
				<div class="ribbon" >best</div>
					<div onclick="location='b_list/view?b_code=${dto.b_code}'"
						class="row g-0 rounded overflow-hidden flex-md-row shadow-sm-hover h-md-250 position-relative px-3 py-2">
						<div class="col-6">
							<img src="../img/book/${dto.b_filename}" class="rounded b_list-thumbnail shadow-sm" width=""/>
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
							<a href="#" class="btn btn-outline-primary text-center fs-6">장바구니</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>
	<script type="text/javascript">
		
	</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>