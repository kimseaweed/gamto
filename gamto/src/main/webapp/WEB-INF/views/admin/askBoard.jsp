<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지 | 문의 확인</title>
<style>
.c-bd {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	background-color: #D0D3D8;
}

.c-bd1 {
	border-bottom: 1px solid gray;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main class="mx-auto container p-3">
		<div class="bg-light mb-5 px-2 py-xl-5 py-0">
			<div class="col-auto row pt-3">
				<jsp:include page="adminPageSideBar.jsp" />
				
					<div class="col pt-3" >

					<table class="table table-hover text-center mt-3">
						<thead>
							<tr class="c-bd">
								<th scope="col" width=10%>번호</th>
								<th scope="col" width=25%>분류</th>
								<th scope="col" width=25%>문의자</th>
								<th scope="col" width=10%>파일</th>
								<th scope="col" width=15%>답변요청</th>
								<th scope="col" width=15%>진행</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${askList}">
								<tr
									onclick="location.href='/admin/ask/view/${list.a_seq_number}'">
									<td class="">${list.a_seq_number}</td>
									<td class="">${list.a_category}</td>
									<td class=""><c:choose>
											<c:when test="${empty list.a_id}">
												<span class="text-muted">비회원</span>
											</c:when>
											<c:otherwise>${empty list.a_id}"</c:otherwise>
										</c:choose></td>
									<td class=""><c:if test="${not empty list.a_filename}">
											<i class="bi bi-paperclip"></i>
										</c:if></td>
									<td class="">${list.a_reception}</td>
									<td class=""><c:choose>
											<c:when test="${list.a_complete eq 0}">
												<span class="text-muted">완료 (0)</span>
											</c:when>
											<c:when test="${list.a_complete eq 1}">
												<span class="text-danger">미확인 (1)</span>
											</c:when>
											<c:when test="${list.a_complete eq 2}">
												<span class="text-warning">진행중 (2)</span>
											</c:when>
											<c:otherwise>${empty list.a_id}"</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div >
						<nav class="py-5">
							<ul class="pagination d-flex justify-content-center">
								
								<li class="page-item"><a class="page-link" href="/admin/ask/${pageNo}">${pageNo} </a></li>
								
							</ul>
						</nav>
						<script type="text/javascript">
							const pageno = ${pageNo};	
							const maxcontent = ${askList[0].a_tot};
							const maxpageno = Math.ceil(maxcontent/10);
							
							const prevBtn = 
								'<li class="page-item1"><a class="page-link"href="/admin/ask/'+(pageno-1)+'" aria-label="Previous"><spanaria-hidden="true">&laquo;</span></a></li>';
							const nextBtn = 
								'<li class="page-item2"><a class="page-link" href="/admin/ask/'+(pageno+1)+'"aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>';
							const pageBtn =
								'<li class="page-item"><a class="page-link" href="/admin/ask/">'+'</a></li>';
							$(document).ready(function(){
								if(pageno>1){
									$('.pagination').prepend(prevBtn);
								}
								if(maxpageno>pageno){
									$('.pagination').append(nextBtn);
								}
							})//레디 end
							
								
						</script>
					</div>
				</div>
				<!-- col-md-7 -->
			</div>
			<!-- row -->
			</div>
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>