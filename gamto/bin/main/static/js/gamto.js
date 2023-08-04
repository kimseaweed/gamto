/*헤더 출팁*/
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})


/* 마우스 당근 */
	let x = 0,
	 y = 0,
	 mouseX = 0,
	 mouseY = 0,
	 angleX = 0,
	 angleY = 0,
	 fmouseX = 0,
	 fmouseY = 0;
 
$(window).mousemove(function(e){
 x = e.pageX;
 y = e.pageY;

 mouseX = Math.max(-50, Math.min(50, $(window).width()/2 - x));
 mouseY = Math.max(-50, Math.min(50, $(window).height()/2 - y));

 angleX = (12*mouseX) / 150;
 angleY = (12*mouseY) / 150;

 fmouseX += (angleX - fmouseX)* 0.1;
 fmouseY += (angleY - fmouseY)* 0.1;
 

 gsap.to(".carrot", {duration: 0.3, left: x, top: y});

/* 제품상세페이지 이미지 */
 $(".moveImg").css({"transform": "perspective(600px) rotateX("+fmouseX+"deg) rotateY("+ -fmouseY+"deg)"});
});

$(".move-block").mouseover(function(){
$(".move-img").addClass("moveImg");
})

$(".move-block").mouseout(function(){
$(".move-img").removeClass("moveImg");
$(".move-img").css({"transform": "rotateX(0deg) rotateY(0deg)"});
});