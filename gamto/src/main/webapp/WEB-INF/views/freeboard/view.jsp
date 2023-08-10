<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세 페이지</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<main class="container pt-5">
	*${dto.f_category}<br>
	<div class="row">
	<p class="col mt-2">제목 : ${dto.f_title}</p> <p class="col ms-auto text-end me-5">작성자 : ${dto.f_writer}</p>
	<hr>
	</div>
	<div style="padding-bottom:200px;" class="row">
	<p class="col mt-2">내용 : ${dto.f_content}<br></p>
	<p class="col ms-auto text-end me-5"> 
	추천 수 : ${dto.f_recommend} &nbsp;| &nbsp;조회 수 : ${dto.f_view} <br>
	</p>
	</div>
	<hr>
	<div class="row">
	<p class="col mt-2">
		작성 날짜 : ${dto.f_regist_day} <br>
		수정 날짜 : ${dto.f_update_day} <br>
	</p>
	<p class="col ms-auto text-end me-5">
		<c:if test = "${sessionId==u_id}">
			<input type="button" value="수정" class="btnUpdate">
			<input type="button" value="삭제" class="btnDelete">
		</c:if>	
		<input type="button" value="좋아요♡" class="btnGood"/>
	</p>
	<br>
	</div>
	<div class="accordion" id="accordionExample">
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          댓글보기
        </button>
      </h2>
      <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <table id="commentTable" border="1"> 
            <c:forEach items="${cDto}" var="cdto">
              <tr>
                <td>${cdto.c_writer}</td>
                <td id="${cdto.c_seq_number}conment">${cdto.c_content}</td>
                <td>${cdto.c_regist_day}</td>
                <td>${cdto.c_update_day}</td>
                <td><button type="submit" onClick="location.href='cGoodCnt?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">${cdto.c_recommend}</button></td>
                <td><button type="submit" onClick="location.href='cBadCnt?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">${cdto.c_derecommend}</button></td>
                <td><button type="button" class="updateComment enable" id="${cdto.c_seq_number}">수정</button></td>
                <td><button type="submit" onClick="location.href='cDelete?f_seq_number=${dto.f_seq_number}&c_seq_number=${cdto.c_seq_number}'">삭제</button></td>
              </tr>
            </c:forEach>
            <tr id="newComment"></tr>
          </table>
          <input type="hidden" name="f_seq_number" value="${dto.f_seq_number}"/>
          <input type="hidden" name="c_writer" value="임시작성자" />
          <div class="form-group">
            <textarea name="c_content" class="form-control" rows="3"></textarea>
          </div>
          <button type="button" class="btn btn-primary btnComment" >Submit</button>
        </div>
      </div>
    </div>
  </div>
	</main>
	<jsp:include page="../footer.jsp" />
<script>
$(document).ready(function() {
	var btnDelete = $(".btnDelete");
	$(".btnUpdate").click(function() {
		if (!confirm("수정하시겠습니까?")) {
			return false;
		} else {
			$(location).attr('href','updateForm?f_seq_number=${dto.f_seq_number}');
			}
		})
		
	btnDelete.click(function() {
		if (!confirm("삭제하시겠습니까?")) {
			return false;
		} else {
			alert("삭제되었습니다.");
			$(location).attr('href','delete?f_seq_number=${dto.f_seq_number}');
			}
		})
		
	$(".btnGood").click(function() {
		$(location).attr('href','good?f_seq_number=${dto.f_seq_number}');
		})
	$(".btnComment").click(function() {
		alert("btnComment요청");
		getCommentList();
		})
		
	function getCommentList(){
		var f_seq_number = $('input[name=f_seq_number]').val();
		var c_writer = $('input[name=c_writer]').val();
		var c_content = $('textarea[name=c_content]').val();
		console.log(f_seq_number+c_writer+c_content);
		$.ajax({
			type:'GET',
			url :'/board/getComentList',
			data : {'f_seq_number': f_seq_number, 
					'c_writer': c_writer,
					'c_content': c_content},
			success:function(result){
				if(result==1) {
					$('#commentTable').load(location.href+' #commentTable');
					console.log("통신성공");
				}else {
					alert("서버문제로 등록에 실패하였습니다.(*DB문제*)");
				}
				
			}, error: function(result){
				console.log("통신실패");
			}
		})
	}
	
	
	$('.updateComment').click(function(){
		alert($(this).attr('class'));
		if($(this).attr('class')=='updateComment enable'){
			alert('수정시작');
		var c_seq_number =  $(this).attr("id");
		$(this).addClass('disable');
		$(this).removeClass('enable');
		var value=document.getElementById(c_seq_number+'conment').innerText;
		
		document.getElementById(c_seq_number+'conment').innerHTML=
		'<input type="text" value="'+value+'"/>';
		}else if($(this).attr('class')=='updateComment disable'){
			var c_seq_number = $(this).attr("id");
			alert('수정값 받을거임~'+c_seq_number);
			$(this).addClass('enable');
			$(this).removeClass('disable');
			//수정한 값 불러옴
			var value=document.getElementById(c_seq_number+'conment').firstChild.value;
			alert(value);
			//완성된값으로 수정함
			document.getElementById(c_seq_number+'conment').innerHTML=value;
			//ajax시작
			alert('ajax시작');
			$.ajax({
				type:'GET',
				url :'/board/cUpdate',
				data : {'c_seq_number': c_seq_number,
						'c_content': value},
				success:function(result){
					if(result==1) {
						$('#commentTable').load(location.href+' #commentTable');
						console.log("통신성공");
					}else {
						alert("서버문제로 등록에 실패하였습니다.(*DB문제*)");
					}
					
				}, error: function(result){
					console.log("통신실패");
				}
			})
		}
	})
})
</script>
</body>
</html>
