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
<title>관리자 페이지 | 신고 상세</title>
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
<div class="d-none">
	<jsp:include page="../header.jsp" />
</div>
	<main class="mx-auto p-3 mt-2">
		<div class="bg-light mb-5 px-2 py-xl-5 py-0">
			<div class="col-auto row pt-3">
				<jsp:include page="adminPageSideBar.jsp" />
				<!--  -->
				<div class="container  col pt-lg-3">
					<div class="p-5">


						<table class="table">
							<tr class="tablehead ">
								<th>신고 번호</th>
								<td>${dto.ac_seq_number}</td>
							</tr>
							<tr class="tablehead">
								<th>신고유형</th>
								<td>${dto.ac_category}</td>
								<th>작성일</th>
								<td class="td30">${dto.ac_date}</td>
							</tr>
							<tr>
								<th>신고대상</th>
								<td colspan="3">${dto.ac_target}</td>
							</tr>

							<tr>
								<th>신고자</th>
								<td>${dto.ac_id}</td>
								<th>파일첨부</th>
								<td>${dto.ac_filename}</td>
							</tr>

							<tr class="table-group-divider">
								<td colspan="4" class="p-5">${dto.ac_content}</td>
							</tr>
							<tr class="table-group-divider">
								<th class="align-middle">현재 진행상태</th>
								<td class="align-middle fs-2">${dto.ac_complete}</td>
								<th class="align-middle">변경</th>
								<td>
									<div class="row">
										<div class="col">
											<select id="selectwork" name="selectwork" class=" align-middle form-select form-select-lg text-center" >
												<option value="1">신규</option>
												<option value="2">진행중</option>
												<option value="0">답변완료</option>
											</select>
										</div>
									</div> 
								</td>
							</tr>
						</table>
						<div class="d-flex w-100 pt-5 my-3 px-auto text-end">
						<div class="pt-3">
							<c:choose>
								<c:when test="${dto.ac_seq_number+1 < dto.ac_total}">
									<a class="btn btn-secondary" href="/admin/accuse/view/${dto.ac_seq_number+1}"><i class="bi bi-arrow-up-circle-fill"></i> 이전글</a>
								</c:when>
								<c:otherwise>
									<span class="btn btn-secondary"> 가장 최근 신고입니다. </span>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${dto.ac_seq_number-1>1}">
									<a class="btn btn-secondary" href="/admin/accuse/view/${dto.ac_seq_number-1}"><i class="bi bi-arrow-down-circle-fill"></i> 다음글</a>
								</c:when>
								<c:otherwise>
									<span class="btn btn-secondary"> 가장 마지막 신고입니다. </span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class = "ms-auto">
							<button type="button" class=" me-5 btn btn-warning btn-lg" onclick="location.href='/admin/accuse';" > 목록으로 </button>
							<button type="button" class=" me-5 btn btn-primary btn-lg"> 진행상태 변경 </button>
						</div>
						</div>
					</div>
				</div>
				<!--  -->
			</div>
		</div>
	</main>
<script type="text/javascript">
var compleate = '${dto.ac_complete}';

$(document).ready(function(){
	if(compleate=="신규"){
		$('select > option').eq(0).attr('selected');
	}else if('답변완료'){
		$('select > option').eq(2).attr('selected');
	}else{
		$('select > option').eq(1).attr('selected');
	}
})


</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>