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
		<form action="" method="post" class="" id="form" >
		 	<label>회원가입한 아이디 <input type="text" name="u_id" id="u_id"> </label> <br>
		 	<label>가입시 등록한 이메일 <input type="email" name="u_mail" id="u_mail"> </label>
		 	<input type="button" value="인증메일 받기" id="submit"/> 
		</form>
		<div id="spinner" class="d-flex align-items-center" style="display:none !important;">
		  <strong>Loading...</strong>
		  <div class="spinner-border ms-auto" role="status" aria-hidden="true"></div>
		</div>
	</main>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		$('#submit').click(function(){
			if(	$('#u_id').val() == "" ){
				alert('아이디를 입력해주세요');
				return false;
			}else if($('#u_mail').val() == "" ){
				alert('이메일을 입력해주세요');
				return false;
			}else{
				$('#spinner').css('display','block');
				$.ajax({
					url:"/member/reset-pw/matching",
					dataType:'json',
					type:"post",
					data: {	"u_id" : $('#u_id').val(),
							"u_email" : $('#u_mail').val()},
					success : function(result){
						if(result=='2'){			
							alert('존재하지 않는 아이디입니다');
							$('#spinner').css('display','none');
							return false;
						}else if(result=='1'){
							alert('회원가입시 등록한 이메일과 일치하지 않습니다');
							$('#spinner').css('display','none');
							return false;
						}else{
							$('#spinner').css('display','block');
							location="/member/reset-pw/send";
						}
					},
					error : function(){
				        alert("서버 요청에 실패했습니다.");
				        location='/'; 
					}
				});
			}
		})
	</script>
</body>
</html>