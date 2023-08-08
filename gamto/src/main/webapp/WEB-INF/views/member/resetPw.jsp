<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 비밀번호 찾기</title>
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<main class="container-md bg-light px-5 pt-4 rounded shadow-sm">
		<form action="" method="post" class="" >
		 	<label>회원가입한 아이디 <input type="text" name="u_id" id="u_id"> </label> <br>
		 	<label>가입시 등록한 이메일 <input type="email" name="u_mail" id="u_mail"> </label>
		 	<input type="button" value="인증메일 받기" onclick="checkMember() ">
		 	<div id="checkBox" style="display:none;'">
		 	<label for=""> 인증번호 <input type="text" name="code" id="code"/></label>
		 	<input type="button" value="인증하기" onclick="checkCode()">
		 	<input type="submit" value="비밀번호 변경"/>
		 	</div>
		</form>
	</main>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		function checkForm(){
			if(	$('#u_id').val() == "" ){
				alert('아이디를 입력해주세요');
			}else if($('#u_mail').val() == "" ){
				alert('이메일을 입력해주세요');
			}else{
				$.ajax({
					url:"send",
					type:"post",
					dataType="json",
					data:{id : $('#u_id').val(),
						email : $('#u_mial').val()},
					success : function(result){
						if(result==2){			
							alert('존재하지 않는 아이디입니다');
						}else if(result==1){
							alert('회원가입시 등록한 이메일과 일치하지 않습니다');
						}else{
							$('#checkBox').css("display","block");
							$('#Confirm').attr("code",result);
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown){
				        alert("서버 요청에 실패했습니다.");
				        loaction='/';
					}
				});
			}
		} //--checkform
		function checkCode(){
			if($('#Confirm').val()==$('#code').val())
			
		}

	</script>
</body>
</html>