<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>감토 | 나의생각</title>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<main class="container-md bg-light px-5 pt-4 rounded shadow-sm">
		<form id="writeForm" action="/write/writeBook_report" method="post" class="p-5 mb-4 bg-light rounded-3 needs-validation" 
			enctype="multipart/form-data" novalidate>
			<div class="mb-5">
				<h3>나의생각 | 독후감 작성하기</h3>
				<input type="hidden" name="r_writer" value="${u_id}" />
			</div>
			
				<div class="input-group input-group-lg my-5 ps-4 row">
				<div class="valid-feedback">책정보 등록이 완료되었어요! 하단에서 미리 볼 수 있어요</div>
				<span class="input-group-text col-xl-2 col-6"  >책 정보 추가</span>
				<select class="form-select col-xl-1 col-6" id="select">
				    <option selected value="">전체</option>
				    <option value="title">제목</option>
				    <option value="person">저자</option>
				    <option value="publisher">출판사</option>
				    <option value="isbn">ISBN코드</option>
				  </select>
				<input type="text" class="form-control-lg col-xl-auto col-12" name="reportFooter" id="reportFooter-query" placeholder="책 정보를 검색해보세요.">
				  <button class="btn btn-outline-secondary col-xl-2 col-6" type="button" onclick="resetFooter()">책 정보 삭제</button>
				  <button class="btn btn-outline-secondary col-xl-2 col-6" type="button" id="reportFooter-submit" data-bs-toggle="modal" data-bs-target="#exampleModal">검색하기</button>
			</div>
			
			<div class="mb-3">
				<input name="r_title" class="form-control" type="text"
					id="validationCustomUsername" placeholder="제목을 입력해주세요"
					aria-label="default input example" required>
				<div class="invalid-feedback">제목을 입력해주세요</div>
			</div>
			<div class="input-group mb-3">
			<input name="filename" class="form-control" id="inputGroupFile02" type="file"  value="default.png"/>
			 <label class="input-group-text" for="inputGroupFile02">글 표지를 골라주세요 !</label>
			 <div class="valid-feedback">표지를 선택하지 않으면 기본이미지가 선택됩니다. </div>
			</div>
			<div class="invalid-feedback text-end mt-3 fs-5">내용이 비어있어요!</div>
			<textarea name="r_content" class="form-control" id="summernote" required></textarea>
			<input type="hidden" name="footer" id="footer">
			<div id="reportFooter-preview" class="d-none">
			
			</div>
			
			<div class="col-12 pt-4 d-grid gap-2 d-md-flex">
				<button class="btn btn-warning me-md-3" onclick="location='list'; return false;">너의생각으로 이동</button>
				<button class="btn btn-warning me-md-3" onclick="location='board'; return false;">우리생각으로 이동</button>
				<button class="btn btn-primary ms-md-auto p-2 mt-3 mt-md-0" type="submit">작성하기</button>
			</div>
		</form>
		
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">책정보 검색</h1>
        <button type="button" class="btn-close searchClose" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary searchClose" data-bs-dismiss="modal" >닫기</button>
      </div>
    </div>
  </div>
</div>
		
	</main>
	<jsp:include page="../footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"></script>
	<script>
	var createcard1 = function (context) {
		  var ui = $.summernote.ui;
			var card1 = '<div class="row py-3 px-3">'+
				'<div class="col-12 m-auto position-relative rounded shadow-lg" style="background-image: url(\'../img/write/card1.png\'); background-size: cover; width:270px; height:450px;">'+
				'<div class="fs-3 text-white position-absolute start-50 translate-middle" style="top:47%; writing-mode: vertical-lr;"><p  style="margin-bottom:0 !important">여기에 문장을 입력하세요<p></div>'+
				'<div class="fs-6 text-white-50 position-absolute w-100 text-center" style="bottom:10%;"><p style="margin-bottom:0 !important">책이름 | 저자</p></div>'+
				'<div class="fs-7 text-white-50 position-absolute" style="bottom:4%; left:60%;"><p style="margin-bottom:0 !important">p.페이지</p></div>'+
				'</div>	</div> <p><br><br><br></p>';
		  // create button
		  var button = ui.button({
		    contents: '<i class="bi bi-postcard"></i> 카드만들기1',
		    click: function () {
		      context.invoke('pasteHTML', card1 );
		    }		    
		  });

		  return button.render(); 
		}
	var createcard2 = function (context) {
		  var ui = $.summernote.ui;
			var card2 = 
			'<div class="row py-3 px-3"> <div class="col-12 m-auto position-relative  rounded shadow-lg" style="background-image: url(\'../img/write/card2.png\');'+
			'background-size: cover; width:450px; height:300px;">'+
			'<div class="fs-2  position-absolute start-50 translate-middle" style="top:27%;"><p  style="margin-bottom:0 !important">책이름 | 저자</p></div>'+
			'<div class="fs-7  position-absolute" style="top:35%; left:70%;"><p style="margin-bottom:0 !important">p.페이지</p></div>'+
			'<div class="fs-3  position-absolute translate-middle" style="top:68%;left:53%;"><p  style="margin-bottom:0 !important">감명깊었던 문장을 공유해보세요</p></div>'+
			'</div> </div><p><br><br><br></p>';
		  // create button
		  var button = ui.button({
		    contents: '<i class="bi bi-postcard"></i> 카드만들기2',
		    click: function () {
		      context.invoke('pasteHTML', card2 );
		    }		    
		  });

		  return button.render(); 
		}
	var createcard3 = function (context) {
		  var ui = $.summernote.ui;
			var card3 = '<div class="row py-3 px-3">'+
			'<div class="col-12 m-auto position-relative rounded shadow-lg" style="background-image: url(\'../img/write/card3.gif\');'+
			'background-size: cover; width:500px; height:480px;">'+
			'<div class="p-5 fs-4 position-absolute text-white " style="top:16%;"><p  style="margin-bottom:0 !important">마음에드는 구절을 공유해보세요</p></div>'+
			'</div>	</div> </div><p><br><br><br></p>';
		  // create button
		  var button = ui.button({
		    contents: '<i class="bi bi-postcard"></i> 카드만들기3',
		    click: function () {
		      context.invoke('pasteHTML', card3 );
		    }		    
		  });

		  return button.render(); 
		}
	var createcard4 = function (context) {
		  var ui = $.summernote.ui;
			var card4 = '<div class="row py-3 px-3">'+
			'<div class="col-12 m-auto position-relative rounded shadow-lg " style="background-image: url(\'../img/write/card4.gif\');'+
			'background-size: cover; width:500px; height:500px;">'+
			'<div class="p-5 fs-4 position-absolute text-white " style="top:5%; width:480px; height:420px;"><p style="margin-bottom:0 !important">기억에 남는 글을 알려주세요</p></div>'+
			'</div>	</div> </div><p><br><br><br></p>';
		  // create button
		  var button = ui.button({
		    contents: '<i class="bi bi-postcard"></i> 카드만들기4',
		    click: function () {
		      context.invoke('pasteHTML', card4 );
		    }		    
		  });

		  return button.render(); 
		}

	 var fontList = ['궁서체','돋움체','한림명조체','잉크립퀴드체','고딕아니고고딩'];
	$('#summernote').summernote({
		placeholder : '감토님의 생각을 표현해보세요.',
		tabsize : 2,
		height : 500,
		lang : 'ko-KR',
		focus : true,
		disableGrammar: false,
		fontNames: fontList,
        fontNamesIgnoreCheck: fontList,
		toolbar: [
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['fontname'],
		    ['para', ['paragraph']],
		    ['color', ['color']],
		    ['insert',['picture','link']],
		    ['insert',['hr']],
		    ['height', ['height']],
		    ['card', ['card1','card2','card3','card4']],
		  ],
		  buttons:{ 
			    card1: createcard1,
			    card2: createcard2,
			    card3: createcard3,
			    card4: createcard4,
		  }	
		});
		
		// 부트스트랩 유효성
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(() => {
		  'use strict'

		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  const forms = document.querySelectorAll('.needs-validation')

		  // Loop over them and prevent submission
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		      if (!form.checkValidity()) {
		        event.preventDefault()
		        event.stopPropagation()
		      }

		      form.classList.add('was-validated')
		    }, false)
		  })
		})()
		
		
		//펑션 : 책검색 초기화
		function resetFooter(){
			$('#footer').val("");
			$('#reportFooter-preview').load(location.href+' #reportFooter-preview');
		}
		//책검색 모달창 종료시 기존내용 삭제
		$('.searchClose').click(function(){
			$('.modal-body').empty();	
		});
		//평션 : 책검색 
		function searchBook(){
			run=false;
			var search = {
					query: $('#reportFooter-query').val(),
					size : 10,
					page : pageNum,
				}
			if($('#reportFooter-query').val()!='1'){
				search['target']=$('#select').val();
			}
			$.ajax({
				url:"https://dapi.kakao.com/v3/search/book",
				dataType:'json',
				headers: { Authorization: "KakaoAK b8894c164113fcfcd892cc5d6f1ad2a7"},
				data: search,
			}).done(function (res){
				if(res.meta.pageable_count<1){
					$('.modal-body').append('<p class="text-center py-5">검색결과가 없습니다</p>');
					run=false;
				}else{
					if(pageNum==1){
							var rescount=res.meta.pageable_count
							if(res.meta.pageable_count==1000){
								rescount='1000+';
							}
							$('.modal-body').append('<p class="text-center py-2">검색결과는 총 '+rescount+'건 입니다</p>');
					}
					var size = 10;
					if(res.meta.pageable_count<((pageNum)*10)){
						size = res.meta.pageable_count-(10*(pageNum-1));
					}
					pageNum++;
					for(var i=0; i<size; i++){
						$('.modal-body').append(
							'<button type="button" data-bs-dismiss="modal" onclick="getBookCard(this.id)" class="btn btn-outline-warning my-3" id="'+res.documents[i].isbn+'"><div class="card p-4 ms-auto bg-white" style="max-width: 800px;">'+
							'<div class="row g-0"><div class="col-md-4">'+
							'<img src="'+ res.documents[i].thumbnail+'" id="reportFooter-thumbnail" class="img-fluid rounded-start" style="max-width: 450px;">'+
							'</div><div class="col-md-8"><div class="card-body">'+
							'<h5 class="card-title link-dark" id="reportFooter-title">'+res.documents[i].title+'</h5>'+
							'<p class="card-text text-end pe-3 link-dark"><small class="text-muted" id="reportFooter-authors">'+res.documents[i].authors+' 저</small> | '+
							'<small class="text-muted" id="reportFooter-publisher">'+res.documents[i].publisher+' 출판</small></p>'+
							'<p class="card-text text-muted" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 3;-webkit-box-orient: vertical;" id="reportFooter-content">'+
							res.documents[i].contents+'</p></div> </div> </div> </div> </button>'		
						); //append end
					}// for end
					if(pageNum*10>res.meta.pageable_count){
						$('.modal-body').append('<p class="text-center py-5">검색결과가 더이상 없습니다</p>');
						run=false;
					}else{
					 	setTimeout(function(){run = true;},500)
					}					
				}//if isend end
			})//done end
		}//function end
		
		//책검색
		var pageNum;
		$('#reportFooter-submit').click(function(){
			pageNum=1;
			if($('#reportFooter-query').val()==''){
				$('.modal-body').append('검색어가 없습니다');
			}else{
				searchBook();
			}//else end
		})//click function end
		
		//스크롤시 더 불러오기
		var run=true;
		$('.modal-body').scroll(function(){
			if (run&&$('.modal-body').prop('scrollHeight')<$('.modal-body').scrollTop()+$('.modal-body').height()*2) {
				searchBook();
			}//if end
		})//scroll end
		
		//책 선택
		function getBookCard(clicked_id){
			resetFooter();
			var code=clicked_id;
			var indexOfSpace = clicked_id.indexOf(' ');
			if (indexOfSpace !== -1) {
			    code = clicked_id.substring(0, indexOfSpace);
			}
			var search = {
					query: code
				}
			$.ajax({
				url:"https://dapi.kakao.com/v3/search/book",
				dataType:'json',
				headers: { Authorization: "KakaoAK b8894c164113fcfcd892cc5d6f1ad2a7"},
				data: search,
			}).done(function (res){
				$('#reportFooter-preview').append(
					'<div id="reportFooter-card"><hr class="my-3"><div class="card mb-3 p-4 ms-auto" style="max-width: 600px;"> <div class="row g-0"> <div id="" class="col-md-4">'+
					'<img src="'+res.documents[0].thumbnail+'" id="reportFooter-thumbnail" class="img-fluid rounded-start" alt="..." style="max-width: 450px;"></div>'+
					'<div class="col-md-8 d-flex flex-column"><h4 class="card-title text-end mb-auto" id="card-title">'+res.documents[0].title+
					'</h4><div class=""><p class="card-text text-end pe-1 mb-0"><small class="text-muted" id="card-authors"><b>'+res.documents[0].authors+
					'</b> 저</small></p> <p class="card-text text-end pe-1"><small class="text-muted" id="card-publisher"><b>'+res.documents[0].publisher+'</b> 출판</small>  |  <small class="text-muted" id="card-date"><b>'+
					res.documents[0].datetime.substring(0,res.documents[0].datetime.indexOf('T'))+'</b> 출간</small> </p></div></div> <hr class="mt-4 pb-2" > <div class="ps-4"> <b>책 소개</b><div class="pt-2 text-black-50">'+
					'<p class="" id="card-content">'+res.documents[0].contents+'...</p><a href="'+res.documents[0].url+'" class="text-end btn btn-primary btn-sm float-end"> 상세보기 </a></div> </div></div> </div> </div>'		
				);
				$('#reportFooter-preview').removeClass('d-none');
				addCard()
			})//done end
		}//function end
		
	//#reportFooter-card
	function addCard(){
		$('#footer').val($('#reportFooter-card').html());
	}
	</script>
</body>
</html>