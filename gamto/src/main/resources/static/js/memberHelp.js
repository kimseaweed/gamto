

//아이디인증 :  아이디이름 확인 ajax
$('.findid #submit').click(function() {
	$('#spinner').load(location.href + ' #spinner>div');
	if ($('#u_name').val() == "") {
		alertR('이름을 입력해주세요');
		return false;
	} else if ($('#u_email').val() == "") {
		alertR('이메일을 입력해주세요');
		return false;
	} else {
	$('#spinner').css('display', 'block');
		console.log('ajax1.메일발송 시작');
		$.ajax({
			url: "/member/help/id/check",
			dataType: 'json',
			type: "post",
			data: {
				"u_name": $('#u_name').val(),
				"u_email": $('#u_email').val()
			},
			success: function(result) {
				console.log('아이디인증: 성공0,이름불일치1,이메일불일치2 -> ' + result);
				setTimeout(function() {
					if (result == '2') {
						$('#spinner').html('존재하지않는 이메일입니다');
					} else if (result == '1') {
						$('#spinner').html('회원가입시 입력한 이름과 일치하지 않습니다');
					} else { //리턴0
						$('.sendmail').addClass('d-none');
						$('.checkCode').css('display', 'block');
					}
				}, 500);
			},
			error: function() {
				alert("서버 요청에 실패했습니다. 다시 시도해주세요");
				location = '/';
			}
		});
	}
})

//아이디인증 : 인증코드확인 ajax
$('.findid #authSummit').click(function() {
	$('#ceckCode').load(location.href + ' #ceckCode>span');
	$('#ceckCode').css('display', 'block');
	var input = parseInt($('#code').val());
	if (input == "") { return; }
	console.log('아이디인증 : ajax2.인증코드 확인시작');
	$.ajax({
		url: "/member/help/id/check",
		dataType: 'json',
		type: "get",
		data: {
			"code": input,
			"u_email": $('#u_email').val()
		},
		success: function(result) {
			console.log('아이디인증 : 성공0,불일치1,세션만료2:' + result);
			if (result == '0') {
				setTimeout(function() {
					var authSummit = document.getElementById("authSummit");
					var form = document.querySelector('form');
					form.action = "/member/help/id/res";
					form.method = "post";
					form.submit();
				}, 500);

			} else {
				setTimeout(function() {
					var message;
					if (result == '1') {
						message = '인증번호가 틀렸습니다.';
					} else {
						message = '세션이 만료되었거나 잘못된 접근입니다';
					}
					$('#ceckCode').html(message + '<br> 다시 진행해주세요');
					return;
				}, 500);
			}
		},
		error: function() {
			alert("서버 요청에 실패했습니다. 다시 시도해주세요");
			return;
		}
	});
})
//비밀번호 찾기 : 폼제출시 작업
$('.findpw #submit').click(function() {
	$('#spinner').load(location.href + ' #spinner>div');
	if ($('#u_id').val() == "") {
		alert('아이디를 입력해주세요');
		return false;
	} else if ($('#u_email').val() == "") {
		alert('이메일을 입력해주세요');
		return false;
	} else {
		$('#spinner').css('display', 'block');
		$.ajax({
			url: "/member/help/pw/check",
			dataType: 'json',
			type: "post",
			data: {
				"u_id": $('#u_id').val(),
				"u_email": $('#u_email').val()
			},
			success: function(result) {
				setTimeout(function() {
					if (result == '2') {
						$('#spinner').html('<p class="text-danger"> 존재하지않는 아이디입니다<p>');
						return false;
					} else if (result == '1') {
						$('#spinner').html('<p class="text-danger"> 가입시 입력한 이메일과<br>일치하지 않습니다 <p>');
						return false;
					} else {
						location = "/member/help/pw/send";
					}
				}, 500)
			},
			error: function() {
				alert("서버 요청에 실패했습니다.");
				location = '/';
			}
		});
	}
})