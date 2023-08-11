<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<style>
	.c-p-t{
            padding-top: 100px;
        }
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	<%
		String sessionId = (String)session.getAttribute("sessionId");
	%>
</head>

<body onload="init()">
	<c:set var="row" value="${rows}" />
	<c:set var="mail" value="${row.u_email}" />
	<c:set var="mail1" value="${mail.split('@')[0]}" />
	<c:set var="mail2" value="${mail.split('@')[1]}" />
	<jsp:include page="../header.jsp" />
	<main class="main">
			<div class="container-fluid">
                <div class="row">
                    <jsp:include page="../myPageSideBar.jsp"/>
                    <div class="col-md-8 c-p-t">
					<div class="container">
						<form action="processUpdateMember" method="post" name="newMember">
						<div class="form-group row ">
							<label class="col-sm-2">아이디</label> <input type="text" readonly
								class="form-control col-sm-3" name="u_id" placeholder="id"
								value="<c:out value='${row.u_id}'/>" />
						</div>
						<div class="form-group row">
							<label class="col-sm-2">비밀번호</label> <input type="text"
								class="form-control col-sm-3" name="u_pw" placeholder="password"
								value="<c:out value='${row.u_pw}'/>">
						</div>
						<div class="form-group row">
							<label class="col-sm-2">이름</label> <input type="text"
								class="form-control col-sm-3" name="u_name" placeholder="name"
								value="<c:out value='${row.u_name}'/>" />
						</div>
		                  <div class="form-group row">
								<label class="col-sm-2">이메일</label> 
								<input type="text" class="form-control col-sm-3 mr-3 smallletter" id="u_email1" name="u_email1" maxleng="50" value="${mail1}">@
								<select name="mail2" id="mail2" class="col-sm-3 ml-3">
									<option value="Directinput">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gamil.com">gamil.com</option>
									<option value="nate.com">nate.com</option>
								</select>
								<div id="warningMessage" style="color: red;"></div>
							</div>
						<div class="form-group row">
							<label class="col-sm-2">연락처</label> <input type="text"
								class="form-control col-sm-3" name="u_phone" placeholder="phone"
								value="<c:out value='${row.u_phone}'/>">
						</div>
						<div class="form-group row">
							<label class="col-sm-2">주소</label> 
							<input type="text" class="form-control col-sm-3" id="u_address" name="u_address" placeholder="주소" value="<c:out value='${row.u_address}'/>">
							<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" class="col-sm-3 ml-3 "><br>
						</div>
						<input type="hidden" name="u_delete"
							value="<c:out value='${row.u_delete}'/>">	
						<input class="btn btn-success mx-2" type="submit" value="회원수정" />
						<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
					</form>
					</div>
				</div><!-- col-md-8 -->
                </div><!-- row -->
            </div><!-- container-fluid -->
	</main>
	<jsp:include page="../footer.jsp" />
	<script>
		function init() {

			setComboMailValue("${mail2}");

		}

		function setComboMailValue(val) {
			var selectMail = document.getElementById('mail2');
			for (i = 0, j = selectMail.length; i < j; i++) {
				if (selectMail.options[i].value == val) {
					selectMail.options[i].selected = true;
					break;
				}
			}
		}
		function checkForm() {
			if (!document.newMember.u_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (!document.newMember.u_pw.value) {
				alert("비밀번호를 입력하세요.");
				return false;
			}
		}
	</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 API KEY를 사용하세요&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("u_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</body>
</html>