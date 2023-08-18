<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shippingInfo.jsp</title>

</head>
<body>
	<div class="container-fluid px-0">
		<%@ include file="../header.jsp" %>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">배송 정보</h1>
			</div><!-- container -->
		</div>
		<div class="container">
		<!-- 14-2) form 양식 입력 -->
		<form action="./processShippingInfo.jsp" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>"/>
			<!-- 14-3)다음 페이지로 가져가야하는 데이터를 form의 input type=hidden으로 숨겨서 가져갈 수 있다. -->
			<div class="form-group row">
			    <label class="col-sm-2">성명</label>
			    <input name="name" type="text" class="form-control col-sm-3">
			 </div> <!-- row -->
			 <div class="form-group row">
			    <label class="col-sm-2">배송일</label>
			    <input name="shippingDate" type="text" class="form-control col-sm-3">
			 </div> <!-- row -->
			 <div class="form-group row">
			    <label class="col-sm-2">국가명</label>
			    <input name="country" type="text" class="form-control col-sm-3">
			 </div> <!-- row -->
			 <div class="form-group row">
			    <label class="col-sm-2">우편번호</label>
			    <input name="zipCode" type="text" class="form-control col-sm-3">
			 </div> <!-- row -->
			 <div class="form-group row">
			    <label class="col-sm-2">주소</label>
			    <input name="adressName" type="text" class="form-control col-sm-3">
			 </div> <!-- row -->
			 <div class="form-group row">
			 <!-- 14-4)이전, 등록, 취소 버튼 작성=>submit되면 processShippingInfo.jsp 이동-->
			   <div class="col">
			   		<a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-secondary">이전</a>
			   		<input type="submit" class="btn btn-primary" value="등록"/>
			   		<a href="./chenkOutCancelled.jsp" class="btn btn-secondary">취소</a>
			   </div>
			 </div> <!-- row -->
		</form>
		</div> <!-- container -->
	</div><!-- container-fluid -->
</body>
</html>