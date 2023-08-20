<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mrmr.gamto.help.dto.AccuseDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지 | 문의 상세</title>
<style>
.tablehead th{
	width:15%;
}
.td30{
	width:40%;
	background-color: red;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main class="mx-auto p-3">
		<div class="bg-light mb-5 px-2 py-xl-5 py-0">
			<div class="col-auto row pt-3">
				<jsp:include page="adminPageSideBar.jsp" />
				<!--  -->
				<div class="container  col pt-lg-3">
					<div class="p-5">


						<table class="table">
							<tr class="tablehead">
								<th>문의 번호</th>
								<td>${a_seq_number}</td>
							</tr>
							<tr class="tablehead">
								<th>문의유형</th>
								<td>${dto.a_category}</td>
								<th>작성일</th>
								<td class="td30">${dto.a_date}</td>
							</tr>
							<tr>
								<th>답변희망여부</th>
								<td>${dto.a_reception}</td>
								<th>파일첨부</th>
								<td>${dto.a_filename}</td>
							</tr>

							<tr>
								<th>문의자</th>
								<td>${dto.a_id}</td>
								<th>이메일</th>
								<td>${dto.a_email}</td>
							</tr>

							<tr>
								<td colspan="4" class="p-5">${dto.a_content}</td>
							</tr>
							<tr>
								<th>현재 진행상태</th>
								<td class="fs-2">${dto.a_complete}</td>
								<th>변경</th>
								<td>
									<div class="row">
										<div class="col">
											<select class="form-select form-select-lg mb-3">
												<option selected>신규</option>
												<option value="1">진행중</option>
												<option value="2">답변완료</option>
											</select>
										</div>
										<div class="col">
											<input type="text" class="form-control form-control-lg"
												placeholder="담당자" autocomplete="none">
										</div>
									</div> <input type="hidden">
								</td>
							</tr>
							<tr class="">
							<c:choose>
								<c:when test="${dto.a_seq_number+1 < dto.a_total}">
									<th colspan="2" class="text-center py-3 ps-5 fs-3"><a href="/admin/ask/view/${a_seq_number+1}"><i class="bi bi-arrow-down-circle-fill"></i> 다음글</a> </th>
								</c:when>
								<c:otherwise>
									<th colspan="2" class="text-center py-3 ps-5 fs-3"> 가장 최근 문의입니다. </th>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${a_seq_number-1>1}">
									<th colspan="2" class="text-start py-3 ps-5 fs-3"><a href="/admin/ask/view/${a_seq_number-1}"><i class="bi bi-arrow-up-circle-fill"></i> 이전글</a> </th>
								</c:when>
								<c:otherwise>
									<th colspan="2" class="text-center py-3 ps-5 fs-3"> 가장 마지막 문의입니다. </th>
								</c:otherwise>
							</c:choose>
							</tr>
						</table>
						<div class="w-100 pt-5 my-3 px-auto text-end">
							<button type="button" class=" me-5 btn btn-warning btn-lg" onclick="location.href='/admin/ask';" > 목록으로 </button>
							<button type="button" class=" me-5 btn btn-primary btn-lg"> 진행상태 변경 </button>
						</div>
					</div>
				</div>
				<!--  -->
			</div>
		</div>
	</main>

	<jsp:include page="../footer.jsp" />
</body>
</html>