<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 비밀번호 찾기</title>
<link href="/css/member.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header.jsp" />
		<main class="findform">
			<div class="reset-pw shadow mt-5 bg-body porsiton-relative d-flex form-v4-content mx-auto animate__animated animate__fadeInLeft">
			<div class="form-left py-5 px-4">
				<p class="text-1 pt-4">가입하실때 입력하셨던 <b class="fw-bold">아이디</b>와 <b class="fw-bold">이메일주소</b>를 알려주시면 이메일로 비밀번호를 변경할 수 있는 링크를 보내드립니다. 발송된 메일은 <b>10분동안</b> 유효합니다.</p>
				<p class="text-2 pt-4 pb-3"><b class="fw-bold ms-2 me-2">아이디가 기억나지 않나요?</b> 아래의 아이디 찾기 버튼을 눌러주시면 이름과 이메일을 확인하고 아이디를 안내해드리겠습니다. </p>
				<div class="form-left-last row px-5">
					<a href="/member/help/id" class="btn btn-light">아이디 찾기</a>
				</div>
			</div>
			<form class="form-detail p-5" method="post" id="myform">
				<h2 class="">비밀번호 찾기</h2>
				<div class="row px-2 pt-4 pb-4">
					<label class="form-label" >아이디</label>
					<input type="text" name="u_id" id="u_id" class="form-control">
				</div>
				<div class="row px-2 pb-5">
						<label for="your_email">이메일 주소</label>
						<input type="email" name="u_email" id="u_email" class="form-control" placeholder="name@example.com" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}">
				</div>
				<div id="spinner" class="d-flex align-items-center pb-5" style="display:none !important" >
				<div>
					  <strong>인증메일을 발송중입니다...</strong>
				  	<div class="spinner-border ms-auto" role="status" aria-hidden="true"></div>
				 </div>
				</div>
				<div class="form-row-last d-flex ">
					<input type="button" id="submit" class="btn btn-warning  ms-auto" value="인증메일 받기">
				</div>
			</form>
			</div>
		</main>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		$('#submit').click(function(){
			$('#spinner').load(location.href+' #spinner>div');
			if(	$('#u_id').val() == "" ){
				alert('아이디를 입력해주세요');
				return false;
			}else if($('#u_email').val() == "" ){
				alert('이메일을 입력해주세요');
				return false;
			}else{
				$('#spinner').css('display','block');
				$.ajax({
					url:"/member/help/pw/check",
					dataType:'json',
					type:"post",
					data: {	"u_id" : $('#u_id').val(),
							"u_email" : $('#u_email').val()},
					success : function(result){
						setTimeout(function(){
						if(result=='2'){			
							$('#spinner').html('<p class="text-danger"> 존재하지않는 아이디입니다<p>');
							return false;
						}else if(result=='1'){
							$('#spinner').html('<p class="text-danger"> 가입시 입력한 이메일과<br>일치하지 않습니다 <p>');
							return false;
						}else{
							location="/member/help/pw/send";
						}
						},500)
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