/*헤더 BS 툴팁*/
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
	return new bootstrap.Tooltip(tooltipTriggerEl)
})
/* 헤더) 카트뱃지 */
$(document).ready(function() {
	cartBadge();
});
//카트뱃지정보 확인 펑션 
function cartBadge() {
	$.ajax({
		url: "/store/header",
		dataType: 'json',
		type: "get",
		success: function(result) {
			if (result > 0) {
				$('.cartBadge').removeClass('d-none');
				$('.cartBadge>span').text(result);
			}
		},
	});
}
/* 오류메세지 */
function alertR(msg) {
	document.getElementById('msgboxR').innerHTML = msg;
	const toastmsg = document.getElementById('msgToastR')
	const toast = new bootstrap.Toast(toastmsg);
	toast.show();
}
function alertB(msg) {
	document.getElementById('msgboxB').innerHTML = msg;
	const toastmsg = document.getElementById('msgToastB')
	const toast = new bootstrap.Toast(toastmsg);
	toast.show();
}
function alertY(msg) {
	document.getElementById('msgboxY').innerHTML = msg;
	const toastmsg = document.getElementById('msgToastY')
	const toast = new bootstrap.Toast(toastmsg);
	toast.show();
}


/* 마우스 당근 */
let x = 0,
	y = 0,
	mouseX = 0,
	mouseY = 0,
	angleX = 0,
	angleY = 0,
	fmouseX = 0,
	fmouseY = 0;

$(window).mousemove(function(e) {
	x = e.pageX;
	y = e.pageY;

	mouseX = Math.max(-50, Math.min(50, $(window).width() / 2 - x));
	mouseY = Math.max(-50, Math.min(50, $(window).height() / 2 - y));

	angleX = (12 * mouseX) / 150;
	angleY = (12 * mouseY) / 150;

	fmouseX += (angleX - fmouseX) * 0.1;
	fmouseY += (angleY - fmouseY) * 0.1;

	gsap.to(".carrot", { duration: 0.3, left: x, top: y });

	$(".moveImg").css({ "transform": "perspective(600px) rotateX(" + fmouseX + "deg) rotateY(" + -fmouseY + "deg)" });
});

$(".move-block").mouseover(function() {
	$(".move-img").addClass("moveImg");
})

$(".move-block").mouseout(function() {
	$(".move-img").removeClass("moveImg");
	$(".move-img").css({ "transform": "rotateX(0deg) rotateY(0deg)" });
});




/* 사이드바 스크롤탑 */
let mybutton = document.getElementById("btn-back-to-top");
mybutton.addEventListener("click", backToTop);


function backToTop() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}

/*사이드바 링크복사 */
function copyLink() {
	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alertB("링크가 복사되었습니다. <br> 필요하신 곳에 붙여넣기 하세요!")
};

/* 사이드바 검색 */
		const toastTrigger = document.getElementById('searchSite')
		const toastLiveExample = document.getElementById('searchToast')
		if (toastTrigger) {
		  toastTrigger.addEventListener('click', () => {
		    const toast = new bootstrap.Toast(toastLiveExample);
		    toast.show();
		  })
		}
		function boardCategory(){
		}