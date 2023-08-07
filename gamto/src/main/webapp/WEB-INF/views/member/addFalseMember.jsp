<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		alert("중복된 아이디입니다.");
	})
	function checkForm(){
		if(!document.newMember.u_id.value){
			alert("아이디를 입력하세요");
				return;
		}
		if(!document.newMember.u_pw.value){
			alert("비밀번호를 입력하세요");
			return;
		}
		document.newMember.submit();
	}	
</script>
</head>
<body>
	<div class="container mt-2">
		<form action="newMember" method="post" name="newMember">
			<div class="form-group row">
				<label class="col-sm-2">회원 아이디</label> 
				<input type="text" class="form-control col-sm-3" name="u_id" placeholder="id">
			</div>
			<div class="form-group row">
				<label class="col-sm-2">회원 비밀번호</label> 
				<input type="text"class="form-control col-sm-3" name="u_pw"placeholder="password">
			</div>
			<div class="form-group row">
				<label class="col-sm-2">회원 이름</label> 
				<input type="text" class="form-control col-sm-3" name="u_name" placeholder="name">
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label> 
				<input type="text" class="form-control col-sm-3 mr-3" name="u_email1" maxleng="50">@ 
				<select name="u_email2" class="ml-3">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gamil.com">gamil.com</option>
					<option value="nate.com">nate.com</option>
				</select>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">연락처</label> <input type="text"
					class="form-control col-sm-3" name="u_phone" placeholder="phone">
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label> <input type="text"
					class="form-control col-sm-3" name="u_address" placeholder="address">
			</div>
			<div class="form-group row">
			<input type="hidden" value="0"name="u_delete"">
			</div>
			<div class="form-group row">
				<input class="btn btn-success mx-2" type="button" onclick="checkForm()" value="회원가입" /> 
				<input class="btn btn-danger mx-2" type="reset" onclick="checkForm()" value="취소" />
			</div>
		</form>
	</div><!-- container -->
</body>
</html>