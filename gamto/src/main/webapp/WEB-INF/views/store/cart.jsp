<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style>
.custom-h1 {
	display: inline;
}

.custom-line {
	
}

</style>
<meta charset="UTF-8">
<title>감토 | 장바구니</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		<div class="container-fluid px-0">
			<div class="container">
				<div class="row bg-light">
					<section class="h-100 h-custom">
						<div class="container h-100 py-5">
							<div
								class="row d-flex justify-content-center align-items-center h-100">
								<div class="col">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th scope="col" class="h5">Shopping Bag</th>
													<th scope="col">Quantity</th>
													<th scope="col">Price</th>
													<th scope="col">합계</th>
													<th scope="col"> 
													<a href="/b_list/removeAllCart" class="custom-line my-auto">모두 비우기</a>
													</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="dto" items="${cart}" varStatus="status">
												<c:set var="sum" value="${sum +(dto.b_price * dto.b_quantity)}"></c:set>
										        <fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.b_price}" var="price"/>
										        <fmt:formatNumber type="number" value="${dto.b_quantity}" var="quantity"/>
											    <fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.b_price * dto.b_quantity}" var="total"/>
													<tr>
														<th scope="row">
															<div class="d-flex align-items-center">
																<img src="../img/book/${dto.b_filename}"
																	class="img-fluid rounded-3" style="width: 120px;"
																	alt="Book">
																<div class="flex-column ms-4">
																	<p class="mb-2">${dto.b_name}</p>
																	<p class="mb-0">${dto.b_author}</p>
																</div>
															</div>
														</th>
														<td class="align-middle">
															<div class="d-flex flex-row">
																<button class="btn btn-link px-2"
																	onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
																	<i class="fas fa-minus"></i>
																</button>

																<input id="form1" min="0" name="quantity" value="2"
																	type="number" class="form-control form-control-sm"
																	style="width: 50px;" />

																<button class="btn btn-link px-2"
																	onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
																	<i class="fas fa-plus"></i>
																</button>
															</div>
														</td>
														<td class="align-middle">
															<p class="mb-0" style="font-weight: 500;">${price}원</p>
														</td>
														
														<td class="align-middle">
															<p class="mb-0" style="font-weight: 500;">${total}원</p>
														</td>
														<td class="align-middle ps-5">
														<a href="/b_list/removeCart?b_code=${dto.b_code}">X</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

									<div class="card shadow-2-strong mb-5 mb-lg-0"
										style="border-radius: 16px;">
										<div class="card-body p-4">
											<div class="row">

												<div class="col-lg-4 col-xl-3">
													<div class="d-flex justify-content-between"
														style="font-weight: 500;">
														<p class="mb-2">총합 금액</p>
														<p class="mb-2">${sum}</p>
													</div>

													<div class="d-flex justify-content-between"
														style="font-weight: 500;">
														<p class="mb-0">배송비</p>
														<p class="mb-0">3000원</p>
													</div>

													<hr class="my-4">

													<div class="d-flex justify-content-between mb-4"
														style="font-weight: 500;">
														<p class="mb-2">결제 금액</p>
														<p class="mb-2">${sum+3000}원 </p>
													</div>

													<button type="button"
														class="btn btn-primary btn-block btn-lg">
														<div class="d-flex justify-content-between">
															<span>결제하기</span> <span>${sum+3000}원</span>
														</div>
													</button>

												</div>
											</div>

										</div>
									</div>

								</div>
							</div>
						</div>
					</section>
				</div>
				<!-- row -->
			</div>
			<!-- container -->
	</main>
	<jsp:include page="../footer.jsp" />
</body>
</html>