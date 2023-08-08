<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 페이지</title>
<%
	String c_writer = (String)session.getAttribute("sessionId");
%>
<script>
	function checkForm(){
	    if(!document.comment.c_content.value){
	       alert("댓글을 작성해주세요!");
	       return false;
	    }
	    document.comment.submit();
	 }
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<main class="container pt-5">
		*${dto.f_category}<br>
		<div class="row">
		<p class="col mt-2">제목 : ${dto.f_title}</p> <p class="col ms-auto text-end me-5">작성자 : ${dto.f_writer}</p>
		<hr>
		</div>
		<div style="padding-bottom:200px;" class="row">
		<p class="col mt-2">내용 : ${dto.f_content}<br></p>
		<p class="col ms-auto text-end me-5"> 
		추천 수 : ${dto.f_recommend} &nbsp;| &nbsp;조회 수 : ${dto.f_view} <br>
		</p>
		</div>
		<hr>
		<div class="row">
			<p class="col mt-2">
				작성 날짜 : ${dto.f_regist_day} <br>
				수정 날짜 : ${dto.f_update_day} <br>
			</p>
			<p class="col ms-auto text-end me-5">
				<input type="button" value="좋아요♡" class="btnGood"/>
			</p>
		</div>
		<div class="pb-2">
			<a href="/board" class="pb-5">목록보기</a>
		</div><br>
		<input type="button" value="댓글 접기" class="btnComment mb-2">	
		<table border="1"> 
			<c:forEach items="${cDto}" var="cdto">
				<tr>
					<td>${cdto.c_writer}</td>
					<td>${cdto.c_content}</td>
					<td>${cdto.c_regist_day}</td>
					<td>${cdto.c_update_day}</td>
					<td><button type="submit" onClick="location.href='/board/cGoodCnt?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">${cdto.c_recommend}</button></td>
					<td><button type="submit" onClick="location.href='/board/cBadCnt?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">${cdto.c_derecommend}</button></td>
					<td><button type="submit" onClick="location.href='/board/cUpdateForm?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">수정</button></td>
					<td><button type="submit" onClick="location.href='/board/cDelete?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<form action="/board/insertCommend?f_seq_number=${dto.f_seq_number}" method="post" name="comment">
				댓글 : <input type="text" name="c_content" /> &nbsp; 작성자 : <%=c_writer%> &nbsp; 
				<button type="button" onclick="checkForm()">댓글 등록</button>
			<br> 
		</form>
	</main>
	<jsp:include page="../footer.jsp" />
<script>
	 $(document).ready(function(){ 
		$(".btnGood").click(function(){
			$(location).attr('href','/board/good?f_seq_number=${dto.f_seq_number}');
		})
		$(".btnComment").click(function(){
			$(location).attr('href','/board/view?f_seq_number=${dto.f_seq_number}');
		})
	}) 
</script>
<%-- <%
		if(session.getAttribute("u_id")==""||session.getAttribute("u_id")==null) {
    		out.println("<script>alert('로그인이 필요합니다.');</script>");
    		out.println("<script>window.location.href='/login';</script>");
		}
%> --%>
</body>
</html>
