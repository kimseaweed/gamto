<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
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
													<th scope="col"><a href="/store/removeAllCart"
														class="custom-line my-auto">모두 비우기</a></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="dto" items="${cart}" varStatus="status">
													<c:set var="sum"
														value="${sum +(dto.cart_price * dto.cart_quantity)}"></c:set>
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${dto.cart_price}" var="price" />
													<fmt:formatNumber type="number"
														value="${dto.cart_quantity}" var="quantity" />
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${dto.cart_price * dto.cart_quantity}" var="total" />
													<tr>
														<th scope="row">
															<div class="d-flex align-items-center">
																<img src="../img/book/${dto.cart_filename}"
																	class="img-fluid rounded-3" style="width: 120px;"
																	alt="Book">
																<div class="flex-column ms-4">
																	<p class="mb-2">${dto.cart_name}</p>
																	<p class="mb-0"><b>${dto.cart_author}</b> 저</p>
																</div>
															</div>
														</th>
														<td class="align-middle">
															<div class="d-flex flex-row">
																<button class="btn btn-link px-2 addCart"
																	onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
																	<i class="fas fa-minus"></i>
																</button>

																<input id="form1" min="0" name="quantity" value="${dto.cart_quantity}"
																	type="number" class="form-control form-control-sm"
																	style="width: 50px;" />

																<button class="btn btn-link px-2 addCart"
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
														<td class="align-middle ps-5"><a
															href="/store/removeCart?b_code=${dto.cart_code}">X</a></td>
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
														<p class="mb-2">${sum+3000}원</p>
													</div>
													<div class="d-flex justify-content-between">
														<form method="post" action="/kakaoPay">
															<button class="kkoPay btn btn-warning btn-lg me-lg-3 me-md-2 me-3"></button>
														</form>
													</div>

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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp23781431'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '주문명 : ${info.item_name}',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: '총액 : ${info.amount.total}',
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: '이름 : ${info.partner_order_id}',
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
			var linkElements = document.querySelectorAll('button.addCart'); // 모든 button 태그 선택
			
			linkElements.forEach(function(link) {
			  link.addEventListener('click', function(event) {
			    var linkId = link.id; // 클릭한 a 태그의 id 속성 값 가져오기
			    var b_quantity = document.buyForm.b_quantity.value;
			    alert(b_quantity + linkId);
				 $.ajax({
					  url:"/store/addCart",
		               dataType:'json',
		               type:"post",
					data: {'b_code': linkId,
						   'b_quantity': b_quantity
						   },
					success: function(result){
						if(result == -1){
							alert("로그인 하세요 ");
							location = '/member/login';
						} else if(result == 0){
						 alert("0");
						}else{
							alert("상품이 제대로 담겼다 이 자식아 ");
						}
					},
					error:function(result){  
			           alert("fail");
					}
				}) 
			  });
			});
				
	</script>
</html>