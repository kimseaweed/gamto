<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid px-0">
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">로그인</h1>
			</div><!-- container -->
		</div><!-- jumbotron -->
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-4">
					<h3>please sign in</h3>
					<%
						String error = request.getParameter("error");
						if(error != null){
							out.println("<div class='alert alert-danger'>");
							out.println("아이디와 비밀번호를 확인해주세요");
							out.println("</div>");
						}
					%>
					<!-- 17-11)action,name을 수정하고 processLoginMember.jsp로 이동 -->
					<form action="member/processLoginMember" method="post">
						<div class="input-group input-group-lg my-2">
							<input required placeholder="ID" type="text" class="form-control"
								aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg" name="u_id"
								autofocus>
						</div>
						<div class="input-group input-group-lg my-2">
							<input required placeholder="PASSWORD" type="password"
								class="form-control" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg" name="u_pw">
						</div>
						<button class="btn btn-success btn-block btn-lg" type="submit">로그인</button>
					</form>
				</div><!-- col-md-4 col-md-offset-4 -->
			</div>
		</div>
	</div><!-- container-fluid -->
</body>
</html>