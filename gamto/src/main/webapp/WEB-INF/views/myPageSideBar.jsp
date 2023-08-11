<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
    crossorigin="anonymous">
<style>
@import url('https://fonts.googleapis.com/css?family=Open+Sans');
       .c-text{
           font-size: 1.3vw;
           padding: 15px;
       }
       .c-p{
           padding: 15px;
       }
       .c-h{
           height: 100%;
       }
       a{
            text-decoration: none;
            color: black;
        }
        .text-3vw{
            font-size: 2.8vw;
        }
</style>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div class="col-md-1"></div>
	<div class="col-md-3 p-3 c-h">
		<a href=""><h1 class="c-p text-3vw">마이페이지</h1></a>
		<a href="/member/myPage"><p class="c-text">내정보</p></a>
		<a href="/b_list/purchaseList"><p class="c-text">구매내역</p></a>
		<a href=""><p class="c-text">내 글보기</p></a>
		<a href="/member/updateMember?u_id=${sessionId}"><p class="c-text">회원수정</p></a>
		<a href="/member/deleteMember"><p class="c-text">회원탈퇴</p></a>
	</div>
</body>
</html>