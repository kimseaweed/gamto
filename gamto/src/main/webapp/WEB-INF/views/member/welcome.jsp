<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<title>13_welcome_bs4.jsp</title>
</head>
<body>
	<%! String greeting="Welcome to Web Shopping Mall";
		String tagline = "Welcome to Web Market!";
	%>
	    <%@ include file="menu.jsp" %>
		<!-- 점보트론 넣기 -->
		<div class="jumbotron">
			<div class="container text-center">
				<h1><%=greeting %></h1>
			</div><!-- container -->
		</div><!-- jumbotron -->
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<h3><%=tagline %></h3>
					<%
						Date day = new java.util.Date();
						String am_pm;
						int hour = day.getHours();
						int minute = day.getMinutes();
						int second = day.getSeconds();
						
						if(hour/12==0){
							am_pm ="AM";
						}else{
							am_pm ="PM";
							hour = hour-12;
						}
						String CT = hour+":"+minute+":"+second+" "+am_pm;
						out.println("현재 접속 시각 : "+CT);
					%>
					
				</div><!-- col -->
			</div><!-- row -->
			<hr>
		</div><!-- container -->
</body>
</html>