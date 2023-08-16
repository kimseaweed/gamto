<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 아이디 찾기</title>
<link href="/css/member.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
		<main class="mb-5 findform">
			<div class="find-id shadow mt-5 bg-body porsiton-relative d-flex form-v4-content mx-auto animate__animated animate__fadeInRight">

			<form class="form-detail p-5"  method="post" id="myform" action="/member/help/id/res">
				<h2 class="">아이디 찾기</h2>
				<div class="sendmail">
				<div class="row px-2 pt-4 pb-4">
					<label class="form-label" >이름</label>
					<input type="hidden"/>
					<input type="text" name="u_name" id="u_name" class="form-control">
				</div>
				<div class="row px-2 pb-5">
						<label for="">이메일 주소</label>
						<input type="hidden"/>
						<input type="email" name="u_email" id="u_email" class="form-control" placeholder="name@example.com" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">
				</div>
				<div id="spinner" class="d-flex align-items-center pb-5" style="display:none !important;">
				<div>
					  <strong>인증메일을 발송중입니다...</strong>
				  	<div class="spinner-border ms-auto" role="status" aria-hidden="true"></div>
				 </div>
				</div>
				<div class="form-row-last d-flex ">
				
					<input type="button" id="submit" class="btn btn-warning  ms-auto" value="인증메일 받기">
				</div>
				</div>
				<div class="checkCode" style="display:none;">
				<div class="row px-2 pb-4">
						<p class="pt-5 fs-4 pb-2">인증번호가 발송되었습니다.</p>
						<label class=" pb-2">인증번호</label>
						<input type="hidden"/>
						<input type="text" id="code" name="code" class="form-control" autocomplete="off" >
						<p id="ceckCode" class="text-danger" style="display:none;"><span></span></p>
				</div>
					<div class="form-row-last d-flex ">
					<input type="submit" id="authSummit" class="btn btn-warning  ms-auto" value="인증하기">
				</div>
				</div>
			</form>
						<div class="form-left py-5 px-4">
				<p class="text-1 pt-4">가입하실때 입력하셨던 <b class="fw-bold">이름</b>과 <b class="fw-bold">이메일주소</b>를 알려주시면 이메일로 인증번호를 보내드립니다.</p>
				<p class="text-2 pt-4 pb-3"><b class="fw-bold ms-2 me-2">비밀번호가 기억나지 않나요?</b> 아래의 비밀번호 찾기 버튼을 눌러주시면 아이디와 이메일을 확인하고 비밀번호를 변경해드리겠습니다. </p>
				<div class="form-left-last row px-5">
					<a href="/member/help/pw" class="btn btn-light">비밀번호 찾기</a>
				</div>
			</div>
			</div>
		</main>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
	
	
		// 아이디이름 확인 ajax
		$('#submit').click(function(){
			 $('#spinner').load(location.href+' #spinner>div');
 			 $('#spinner').css('display','block');
			if(	$('#u_name').val() == "" ){
				alert('이름을 입력해주세요');
				return false;
			}else if($('#u_email').val() == "" ){
				alert('이메일을 입력해주세요');
				return false;
			}else{
				console.log('ajax1.메일발송 시작');
					$.ajax({
						url:"/member/help/id/check",
						dataType:'json',
						type:"post",
						data: {	"u_name" : $('#u_name').val(),
								"u_email" : $('#u_email').val()},
						success : function(result){
							console.log('ajax1.메일발송 성공코드 : '+result);
							setTimeout(function(){
							if(result=='2'){
									$('#spinner').html('존재하지않는 이메일입니다');
							}else if(result=='1'){
									$('#spinner').html('회원가입시 입력한 이름과 일치하지 않습니다');
							}else{ //리턴0
									$('.sendmail').addClass('d-none');
									$('.checkCode').css('display','block');
							}
								}, 500);
						},
						error : function(){
					        alert("서버 요청에 실패했습니다. 다시 시도해주세요");
					        location='/'; 
						}
					});
			} 
		})
		
		//인증코드확인 ajax
		$('#authSummit').click(function (){
			 $('#ceckCode').load(location.href+' #ceckCode>span');
 			 $('#ceckCode').css('display','block');
			var input = parseInt($('#code').val());
 			 if(input==""){return false;}
			console.log('ajax2.인증번호 확인시작');
			$.ajax({
				url:"/member/help/id/check",
				dataType:'json',
				type:"get",
				data: {"code" : input},
				success : function(result){
					console.log('ajax2.인증번호 확인코드 :'+result);		
					setTimeout(function(){
						if(result=='0'){
							$('form').submit();
							/////////////////
							return;
						}else{
							var message;
							if(result=='1'){
								message='인증번호가 틀렸습니다.';
							}else{
								message='세션이 만료되었거나 잘못된 접근입니다';
							}
							$('#ceckCode').html(message+'<br> 다시 진행해주세요');
						}
					}, 500);
				},
				error : function(){
			        alert("서버 요청에 실패했습니다. 다시 시도해주세요");
			        
				}
			});
			return false;
		})
			
	</script>
</body>
</html>