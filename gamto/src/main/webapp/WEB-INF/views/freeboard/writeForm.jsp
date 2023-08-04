<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeForm</title>
<script>
	function checkForm(){
	    if(!document.newWrite.f_writer.value){
	       alert("작성자는 세션 아이디");
	       return;
	    }
	    if(!document.newWrite.f_category.value){
			   alert("카테고리를 선택해주세요");
			   return;
			}
	    if(!document.newWrite.f_title.value){
	       alert("제목을 작성해 주세요");
	       return;
	    }
	    if(!document.newWrite.f_content.value){
		   alert("내용을 작성해 주세요");
		   return;
		}
	    document.newWrite.submit();
	 }
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
<main>
	<table border="1">
		<form name="newWrite" action="write" method="post">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="f_writer" size="100"/></td>
			</tr>
			<select name="f_category">				
				<option value="">카테고리</option>
				<option value="토론회 모집">토론회 모집</option>
				<option value="토론">토론</option>
				<option value="책추천">책추천</option>
				<option value="책교환">책교환</option>
			</select>
			<tr>
				<td>제목</td>
				<td><input type="text" name="f_title" size="100"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type="text" name="f_content" size="100"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="입력" onclick="checkForm()"/>&nbsp;&nbsp;
					<a href="board">목록보기</a>
				</td>
			</tr>
		</form>
	</table>
</main>
<jsp:include page="../footer.jsp" />
	<%
		if(session.getAttribute("u_id")==""||session.getAttribute("u_id")==null) {
    		out.println("<script>alert('로그인이 필요합니다.');</script>");
    		out.println("<script>window.location.href='/login';</script>");
		}
%>
</body>
</html>