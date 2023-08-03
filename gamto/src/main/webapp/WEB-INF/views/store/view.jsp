<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 책 자세히 보기</title>
</head>
<style>
.kkoPay {
	width: 100px;
	height: 36px;
	background-image:
		url("../img/book/kakao/payment_icon_yellow_small_none.png");
	background-size: 95px;
	background-position: top; .
	kkoPay: hover{ 
	background-color:
}
</style>
<body>
	<jsp:include page="../header.jsp" />
	<main class="b_view container-md bg-light px-5">
<nav>
	<ul class="nav">
		<li class="nav-item px-3"><a href="#">상점</a></li><li class="nav-item px-3"><a href="#">책</a></li><li class="nav-item px-3"><a href="#">${dto.b_genre}</a></li>
	</ul>
</nav>
<hr />
		<form action="" name="buyForm">
			<div class="row">
				<div class="col-md-6 col-12 text-center">
					<img src="../img/book/${dto.b_filename}" />
				</div>
				<div class="col-md-6 col-12 ">
					<div class="fs-7 d-inline-block mb-2 text-primary">[${dto.b_genre}]</div>
					<h3 class="fs-3">${dto.b_name}</h3>
					<div class="fs-7 ms-auto mt-2 text-muted">
						<b>${dto.b_author}</b> 저 | <b>${dto.b_publisher} </b>출판
					</div>
					<div class="col b_price">
						<b>${dto.b_price}</b>원
					</div>
					<div class="border-top border-bottom py-1 row">
						<span class="col">${dto.b_name}</span>
						<div class="col-3">
							<input type="number" name="b_quantity" class="form-control"
								min="1" max="${dto.b_stock}" value="1" onchange="getPrice();" />
						</div>
						<div class="col-3 b_priceTot">
							<b>${dto.b_price}</b>원
						</div>
					</div>
					<div class="d-flex justify-content-end">
						<button class="kkoPay btn btn-outline-warning rounded-pill border-2"></button>
						<button class="btn btn-outline-dark rounded-pill">장바구니</button>
					</div>
				</div>
			</div>
		</form>

	</main>
	<script>
		function getPrice() {
			const b_price = parseInt(document.querySelector('.b_price').innerText);
			var b_quantity = document.buyForm.b_quantity.value;
			document.querySelector('.b_priceTot').innerHTML = '<b>'
					+ (b_price * b_quantity).toString().replace(
							/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '</b>'
					+ ' 원';
		}
		$(document).ready(function() {
			getPrice();
		})
	</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>
<%-- 
<div>${dto.b_code}</div>
<div class="">${dto.b_author}</div>
<div>${dto.b_publisher}</div>
<div>${dto.b_release}</div>


<div>${dto.b_price}</div>
<div>${dto.b_description}</div>
 --%>