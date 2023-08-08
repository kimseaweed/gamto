<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<%
String cartId = session.getId(); //세션에서 아이디 정보를 얻어와서 cartId로 사용함.
%>
<meta charset="UTF-8">
<title>감토 | 장바구니</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div class="container-fluid px-0">
			<div class="container">
				<h1 class="display-3">장바구니</h1>
			</div>
			<!-- container -->
			<div class="container">
				<div class="row bg-light">
					<table class="table table-hover pt-6">
						<tr>
							<th>상품</th>
							<th>가격</th>
							<th>수량</th>
							<th>소계</th>
							<th>비고</th>
						</tr>
						<c:forEach var="dto" items="${cart}">


							<tr>
								<td><img src="../img/book/${dto.b_filename}" alt=""
									width="100px" /></td>
								<td>${dto.b_price}</td>
								<td>${dto.b_quantity }</td>
								<td>${dto.total}</td>
								<td><a href="/removeCart" class="badge badge-danger">삭제</a>
								</td>
							</tr>

							<tr>
								<th></th>
								<th></th>
								<th>총액</th>
								<th>${dto.sum}</th>
								<th></th>
							</tr>
							</c:forEach>
					</table>
					
				</div>
				<!-- row -->
				<div class="row">
					<!-- 주문하기 버튼에 링크 주소 추가 -->
					<a href="./deleteCart.jsp?cartId=<%=cartId%>"
						class="btn btn-danger float-left">장바구니 리스트 모두 삭제하기</a> <a
						href="./shippingInfo.jsp?cartId=<%=cartId%>"
						class="btn btn-success float-right">주문하기</a>
				</div>
				<!-- row -->
			</div>
			<!-- container -->
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>