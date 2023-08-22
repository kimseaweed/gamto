<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String cartId = (String) session.getAttribute("u_id"); //세션에서 아이디 정보를 얻어와서 cartId로 사용함.

String bookName = (String)request.getParameter("bookName");
String bookQuantity = (String)request.getParameter("bookQuantity");
String stotalCost = (String)request.getParameter("totalCost");
String orderCode = (String)request.getParameter("orderCode");
System.out.println("bookName: "+bookName);
System.out.println("bookQuantity: "+bookQuantity);
System.out.println("stotalCost: "+stotalCost);
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 책 자세히 보기</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main class="b_view container-md bg-light px-5 pt-4 rounded shadow-sm">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item link-primary"><a href="/store">상점</a></li>
				<li class="breadcrumb-item link-primary"><a href="#">책</a></li>
				<li class="breadcrumb-item link-primary"><a href="#">${dto.b_genre}</a></li>
				<li class="breadcrumb-item active" aria-current="page">${dto.b_name}</li>
			</ol>
		</nav>
		<hr class="pb-5" />
		<form action="" name="buyForm" class="buyForm">
			<div class="move-block row">
				<div class="col-md-7 col-12 text-center mb-5">
					<img src="../img/book/${dto.b_filename}" class="move-img shadow" />
				</div>
				<div class="col-md-5 col-12">
					<h3 class="fs-1 fw-semibold py-3">${dto.b_name}</h3>
					<div class="fs-7 ms-auto mt-2 pb-3 text-muted border-bottom">
						<b>${dto.b_author}</b> 저 &nbsp;| &nbsp; <b>${dto.b_publisher}
						</b>출판
					</div>
					<table class="row mt-5 mb-3">
						<tr class="text-muted row mb-1">
							<td class="col-6 fw-bold ">출간일</td>
							<td class="col-6 text-end">${dto.b_release}</td>
						</tr>
						<tr class="text-muted row pb-3">
							<td class="col fw-bold ">가격</td>
							<td class="col b_price text-end"><b><fmt:formatNumber
										value="${dto.b_price}" /></b> 원</td>
						</tr>
						<tr class="countPrice border-top border-bottom py-3 row">
							<td class="col-lg-8 col-md-4 col-8 fw-bold ">구매수량</td>
							<td class="col"><div class="input-group row draggable">
									<button class="input-group-text  text-center" type="button"
										onclick="downCount();">-</button>
									<input type="text" name="b_quantity"
										class="form-control text-center" max="${dto.b_stock}"
										value="1" onchange="getPrice();" />
									<button class="input-group-text  text-center" type="button"
										onclick="upCount();">+</button>
								</div></td>
						</tr>
						<tr class="row my-3">
							<td class="fw-bold col-6">총 상품금액</td>
							<td class="b_priceTot col-6 text-end"><b><fmt:formatNumber
										value="${dto.b_price}" /></b> 원</td>
						</tr>
						<tr class="row mt-5 mt-lg-5 mt-md-4 mb-3">
							<td class="b_priceTot col text-end">

								<a class="btn btn-primary btn-lg addCart" id="${dto.b_code}">장바구니
									담기</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
		<hr class="mt-3 md-5" />
		<div class="pt-5 px-5">
			<div class=" pb-5">
				<h3 class="border-bottom pb-2 mb-2">상품 소개</h3>
				<p class="px-3">${dto.b_description}</p>
			</div>
			<div class=" pb-3">
				<h3 class="border-bottom pb-2 mb-2">상품 정보</h3>
				<div class="p-5">
					<table
						class="b-table table table-hover border-secondary border-opacity-25">
						<tr>
							<th class="bg-gray">책 제목</th>
							<td>${dto.b_name}</td>
						</tr>
						<tr>
							<th class="bg-gray">장르</th>
							<td>${dto.b_genre}</td>
						</tr>
						<tr>
							<th class="bg-gray">책 코드</th>
							<td>${dto.b_code}</td>
						</tr>
						<tr>
							<th class="bg-gray">저자</th>
							<td>${dto.b_author}저</td>
						</tr>
						<tr>
							<th class="bg-gray">출판사</th>
							<td>${dto.b_publisher}</td>
						</tr>
						<tr>
							<th class="bg-gray">출판일</th>
							<td>${dto.b_release}</td>
						</tr>
						<tr>
							<th class="bg-gray">가격</th>
							<td>${dto.b_price}원</td>
						</tr>
						<tr>
							<th class="bg-gray">보유재고</th>
							<td>${dto.b_stock}개</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

	</main>
	<script>
		function validateCount() {
			let b_quantity = document.buyForm.b_quantity.value;
			const isValid = /^\d+$/.test(b_quantity)
					&& parseInt(b_quantity) >= 1;
			if (!isValid) {
				alert(' 1 이상의 숫자만 입력해주세요');
				document.buyForm.b_quantity.value = 1;
				return;
			}
		}
		function getPrice() {
			validateCount();
			var b_priceTot = parseInt(document.buyForm.b_quantity.value)
					* parseInt(document.querySelector('.b_price').innerText
							.replace(/,/g, ''));
			document.querySelector('.b_priceTot b').innerHTML = b_priceTot
					.toLocaleString();
		}
		function upCount() {
			document.buyForm.b_quantity.value = parseInt(document.buyForm.b_quantity.value) + 1;
			getPrice();
		}
		function downCount() {
			document.buyForm.b_quantity.value = parseInt(document.buyForm.b_quantity.value) - 1;
			getPrice();
		}
	</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		var linkElements = document.querySelectorAll('a.addCart'); // 모든 a 태그 선택

		linkElements.forEach(function(link) {
			link.addEventListener('click', function(event) {
				var linkId = link.id; // 클릭한 a 태그의 id 속성 값 가져오기
				var b_quantity = document.buyForm.b_quantity.value;
				$.ajax({
					url : "/store/addCart",
					dataType : 'json',
					type : "post",
					data : {
						'b_code' : linkId,
						'b_quantity' : b_quantity
					},
					success : function(result) {
						if (result == -1) {
							alert("로그인 하세요 ");
							location = '/member/login';
						} else if (result == 0) {
							alert("0");
						} else {
							console.log("상품이 제대로 담겼다 이 자식아 ");
							cartBadge();
						}
					},
					error : function(result) {
						alert("fail");
					}
				})
			});
		});
		
		/* $("#check_module").click(function () { */
		var IMP = window.IMP; // 생략가능
		IMP.init('imp23418340');
		console.log('test:<%=stotalCost%>');
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		if(<%=bookQuantity%>=='1'){
		   IMP.request_pay({
		      pg: 'kakao',
		      pay_method: 'card',
		      merchant_uid: 'merchant_' + new Date().getTime(),
		      /* 
		       *  merchant_uid에 경우 
		       *  https://docs.iamport.kr/implementation/payment
		       *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		       */
		      name: '주문명 : <%=bookName%>',
		      
		      // 결제창에서 보여질 이름
		      // name: '주문명 : ${auction.a_title}',
		      // 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
		      amount: <%=stotalCost%>,
		      // amount: ${bid.b_bid},
		      // 가격 
		      buyer_name: '이름',
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
		}else{
		   IMP.request_pay({
		      pg: 'kakao',
		      pay_method: 'card',
		      merchant_uid: 'merchant_' + new Date().getTime(),
		      /* 
		       *  merchant_uid에 경우 
		       *  https://docs.iamport.kr/implementation/payment
		       *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		       */
		      name: '주문명 : <%=bookName%> 외 총<%=bookQuantity%>권',
		      
		      // 결제창에서 보여질 이름
		      // name: '주문명 : ${auction.a_title}',
		      // 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
		      amount: <%=stotalCost%>,
		      // amount: ${bid.b_bid},
		      // 가격 
		      buyer_name: '이름',
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
		}
		   
		   

		/* }); */
	</script>
	<jsp:include page="../footer.jsp" />
</body>
</html>