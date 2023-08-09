<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div><!-- container -->		
		<div class="container">
		 
		<%
			String msg = request.getParameter("msg");
			
		
			if(msg != null){
				if(msg.equals("0")) out.print("<h2 class='alert alert-danger text-center'>회원정보가 수정되었습니다.</h2>");
				else if(msg.equals("1")) out.print("<h2 class='alert alert-danger text-center'>회원가입을 축하드립니다. 다시 로그인해주세요</h2>");
				else if(msg.equals("2")) {
					String loginId = (String)session.getAttribute("u_id");
					out.print("<h2 class='alert alert-danger text-center'>"+loginId+ "님 환영합니다.</h2>");
					%>
						<form action="/" method="get">
							<input type="submit" value="홈페이지 바로가기"/>
						</form>
					<%
				}
			}else{
				out.print("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
				%>
					<form action="welcome" method="post">
						<input type="submit" value="홈페이지 바로가기"/>
					</form>
				<%
			}
			
		%>
		</div>
	</div>
</body>
</html>