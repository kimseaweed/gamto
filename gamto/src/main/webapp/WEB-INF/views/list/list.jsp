<%@page import="com.mrmr.gamto.report.dto.Book_reportDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 신개념 독서토론</title>
<%
		String sessionId = (String)session.getAttribute("sessionId");
		List boardList = (List)request.getAttribute("boardList");
		int total_record = (Integer)request.getAttribute("total_record");
		int total_page = (Integer)request.getAttribute("total_page");
		int pageNum = (Integer)request.getAttribute("pageNum");
%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script>
	function checkForm(){
		if(${sessionId==null}){
			alert("로그인해주세요.");
			location.href = "./member/loginMember.jsp";
			return false;
		}
		location.href = "./BoardWriteForm.do?id=<%=sessionId %>";
	}
</script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<main>
<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">너의 생각</h1>
		</div><!-- container -->
	</div><!-- jumbotron -->
	<div class="container">
		<form action='<c:url value="./BoardListAction.do"/>' method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=total_record %>건</span>
				</div>
			</div>
			<div>
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>이미지</th>
						<th>책이름</th>
						<th>작성일</th>
						<th>수정일</th>
						<th>조회</th>
						<th>작성자</th>
						<th>추천</th>
					</tr>
					<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.r_seq_number}</td>
						<td>
							<img src="../resource/images/${dto.r_fileName}" alt="" class="image-fluid" />
						</td>
						<td>
							<a href="./BoardViewAction.do?num=${dto.r_seq_number}&pageNum=<%=pageNum%>">
							${dto.r_title}
							</a>
						</td>
						<td>${dto.r_regist_day}</td>
						<td>${dto.r_update_day}</td>
						<td>${dto.r_view}</td>
						<td>${dto.r_writer}</td>
						<td>${dto.r_recommand}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum %>"/>
				<c:forEach var="i" begin="1" end="<%=total_page %>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}"/>">
						<c:choose>
							<c:when test="${pageNum==i}">
								<b>[${i}]</b>
							</c:when>
							<c:otherwise>
								[${i}]
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			<div align="left">
				<table width="100%">
					<tr>
						<td width="80%" align="left">
							<select name="items">
								<option value="r_title">책이름</option>
								<option value="r_content">본문에서</option>
								<option value="r_writer">작성자</option>
							</select>
							<input type="text" name="text" />
							<input type="submit" value="검색" />
						</td>
						<td width="20%" align="right">
							<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;독후감 작성</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</main>
<jsp:include page="../footer.jsp"/>
</body>
</html>