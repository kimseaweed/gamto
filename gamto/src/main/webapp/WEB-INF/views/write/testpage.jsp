<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<main>
		
		<input type="text" id="search"/><button id="submit"> 검색 </button>
		<div id="result">
		
		</div>
	</main>
	<script type="text/javascript">
	$('#submit').click(function(){
		$.ajax({
			url:"https://dapi.kakao.com/v3/search/book",
			dataType:'json',
			headers: { Authorization: "KakaoAK b8894c164113fcfcd892cc5d6f1ad2a7" },
			data: {
				query: $('#search').val(),
				page : 10,
				size : 10
			},
		}).done(function (res){
			$('#result').append("<img src='"+res.documents[0].thumbnail+"'/>");
			$('#result').append(res.documents[0].title);
			$('#result').append(res.documents[0].authors);
			$('#result').append(res.documents[0].publisher);
			$('#result').append(res.documents[0].contents);
			
		})
	});
	</script>
</body>
</html>