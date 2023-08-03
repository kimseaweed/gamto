<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 책 자세히 보기</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main class="b_view container-md bg-light px-5">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">상점</a></li>
    <li class="breadcrumb-item"><a href="#">책</a></li>
    <li class="breadcrumb-item"><a href="#">${dto.b_genre}</a></li>
    <li class="breadcrumb-item active" aria-current="page">${dto.b_name}</li>
  </ol>
</nav>
<hr />
		<form action="" name="buyForm" class="buyForm">
			<div class="row">
				<div class="col-md-7 col-12 text-center">
					<img src="../img/book/${dto.b_filename}" />
				</div>
				<div class="col-md-5 col-12 testbox">
				<h3 class="fs-1 fw-semibold py-3">${dto.b_name}</h3>
				<div class="fs-7 ms-auto mt-2 pb-3 text-muted border-bottom">
						<b>${dto.b_author}</b> 저 &nbsp;| &nbsp; <b>${dto.b_publisher} </b>출판
				</div>
				<table class="row mt-5 mb-3">
				<tr class="text-muted row mb-1">
					<td class="col-6">출간일</td><td class="col-6 text-end">${dto.b_release}</td>
				</tr>
				<tr class="text-muted row">
					<td class="col" >가격</td><td class="col b_price text-end">
						<b><fmt:formatNumber value="${dto.b_price}"/></b> 원
					</td>
				</tr>
				<tr class="countPrice border-top border-bottom py-1 row">
					<td class="col-4">${dto.b_name}</td>
					<td class="col"><div class="input-group row draggable">
							<button class="input-group-text  text-center" type="button" onclick="upCount();">+</button>
							<input type="text" name="b_quantity" class="form-control text-center"
							max="${dto.b_stock}" value="1" onchange="getPrice();"/>
							<button class="input-group-text  text-center" type="button"  onclick="downCount();">-</button>
					</div></td>
						<td class="col-3 b_priceTot text-end">
							<b><fmt:formatNumber value="${dto.b_price}"/></b> 원</td>
				</tr>
				</table>	
					
					</div>
					<div class="d-flex justify-content-end">
						<button class="kkoPay btn btn-outline-warning rounded-pill border-2"></button>
						<button class="btn btn-outline-primary rounded-pill">장바구니</button>
					</div>
				</div>
		</form>

	</main>
	<script>
		function validateCount(){
			let b_quantity = document.buyForm.b_quantity.value;
			const isValid = /^\d+$/.test(b_quantity) && parseInt(b_quantity) >= 1;
			if(!isValid){
				alert(' 1 이상의 숫자만 입력해주세요');
				document.buyForm.b_quantity.value=1;
				return;
			}
		}
		function getPrice() {
			validateCount();
			var b_priceTot =parseInt(document.buyForm.b_quantity.value) * parseInt(document.querySelector('.b_price').innerText.replace(/,/g, ''));
			document.querySelector('.b_priceTot b').innerHTML = b_priceTot.toLocaleString();
		}
		function upCount(){
			document.buyForm.b_quantity.value = parseInt(document.buyForm.b_quantity.value)+1;
			getPrice();
		}
		function downCount(){
			document.buyForm.b_quantity.value = parseInt(document.buyForm.b_quantity.value)-1;
			getPrice();
		}

	</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>