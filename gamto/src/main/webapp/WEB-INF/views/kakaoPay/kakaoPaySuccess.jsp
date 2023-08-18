<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 결제 완료</title>
<style type="text/css">
main>table {
	border-collapse: separate;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
<main class="pb-5">
		<table style="width: 580px;" class="shadow mx-auto mt-5 bg-white p-5"
			style="">
			<tr class="px-3">
				<td id="t1" class="text-center py-2 pb-3 bb-2-dash">
					<h1>결제 완료</h1>
				</td>
			</tr>
			<tr>
				<td class="text-center pt-3 pb-5"><img
					src="https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png"
					width="125" height="120" /><br>
					<p class="pt-2">
						<span class="text-muted px-2">주문번호</span>
						${info.partner_order_id}
					</p>
					<h2 class="">
						결제가 정상적으로 <b>완료</b>되었습니다.
					</h2>
					<p class="text-muted">
						주문내역 확인은 <br> <a class="" href="/store/purchaseList"><b>나의공간/주문내역</b></a>에서
						확인하실 수 있습니다.
					</p></td>
			</tr>
			<tr>
				<td>
					<div class="row bb-2-dot py-2 mb-4">
						<p class="mb-1 col-6 fw-bold ">주문 상품</p>
						<p class="mb-1 col-2 fw-bold text-center">수량</p>
						<p class="mb-1 col-4 fw-bold text-end">가격&nbsp;&nbsp;&nbsp;</p>
					</div> <!-- ▼ 여기서 구매목록 반복 -->
                    <c:foreach var="dto" items="${cart}" varStatus="status">
						<div class="row">
							<p class="col-6 ">${dto.cart_name}</p>
							<p class="col-2 text-center">
								<fmt:formatNumber value="${dto.cart_quantity}" pattern="#,### 개" />
							</p>
							<p class="col-4 text-end">
								<fmt:formatNumber value="${dto.cart_price}" pattern="￦ #,###" />
							</p>
						</div>
						<!-- ▲ 여기까지 반복 -->
					</c:foreach> <div class="row bt-2-dot py-2 mt-4">
						<p class="my-2 col-8 fw-bold">배송비</p>
						<p class="my-2 col-4 fw-bold text-end">
							<fmt:formatNumber value="${3000}" pattern="￦ #,###.##" />
						</p>
					</div>
					<div class="row bt-2-dash bb-2-dash py-2 fs-5 mb-4">
						<p class="my-3 col-6 fw-bold">최종 결제금액</p>
						<p class="my-3 col-6 fw-bold text-end fs-5">
							<fmt:formatNumber value="${info.amount.total}" pattern="#,###" />
							<span class="fs-6">원</span>
						</p>
					</div>

				</td>
			</tr>

		</table>
		<table style="width: 580px;" class="shadow mx-auto mt-3 bg-white p-5">
			<tr>
				<th>결제일시</th>
				<td>${info.approved_at}</td>
			</tr>
			<tr>
				<th>결제수단</th>
				<td>${info.payment_method_type}</td>
			</tr>
			<tr>
				<th>배송방법</th>
				<td>택배</td>
			</tr>
			<tr>
				<th>배송지 정보</th>
				<td>${"u_address"}</td>
			</tr>
		</table>
		<table style="width: 580px;"
			class="shadow mx-auto mt-3 mb-5 bg-white p-5 text-center">
			<tr>
				<td>구매해 주셔서 감사합니다.</td>
			</tr>
			<tr><td><h2>[[${rsp}]]</h2></td></tr>
			<tr>
				<td><a href="/store" class="btn btn-primary ">상점으로 돌아가기</a></td>
			</tr>
		</table>
	</main>
	<jsp:include page="../footer.jsp" />
	
</body>
</html>