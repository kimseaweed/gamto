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
			<div class="jumbotron">
				<div class="container">
					<h1 class="display-3">장바구니</h1>
				</div>
				<!-- container -->
			</div>
			<!-- jumbotron -->
			<div class="container">
			 <div class="row">
			 <talbe>
                    <tr>
						<th>상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>소계</th>
						<th>비고</th>
					</tr>			 
			 </talbe>
			 </div>
				<div class="row">
				
					<c:forEach var="dto" items="${cart}">
							<table class="table table-hover pt-6">
					
					${dto.total} = ${dto.b_quantity * dto.b_price};
					${dto.sum} = ${dto.sum + dto.total};
		
						<tr>
							<td>${dto.b_filename}</td>
							<td>${dto.b_price}</td>
							<td>${dto.b_quantity }</td>
							<td>${dto.total}</td>
							<!-- 15-30)제품 하나에 대한 데이터를 삭제하는 버튼 구현 -->
							<td> <a href="./removeCart.jsp?id=${dto.b_code}" class="badge badge-danger">삭제</a> </td>
						</tr>

					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th>${dto.sum}</th>
						<th></th>
					</tr>
				</table>
					</c:forEach>
				</div>
				<!-- row -->
				<div class="row">
						<!-- 주문하기 버튼에 링크 주소 추가 -->
							<a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger float-left">장바구니 리스트 모두 삭제하기</a>
							<a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-success float-right">주문하기</a>
				</div>
			</div>
			<!-- container -->
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>