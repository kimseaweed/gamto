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
						<form action="processUpdateMember" method="post" name="newMember"
						onsubmit="return checkForm()">
						<div class="form-group row ">
							<label class="col-sm-2">아이디</label> <input type="text"
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
		                     <input type="text"
		                        class="form-control col-sm-3 mr-3" name="mail1" maxleng="50"
		                        value="${mail1}">@
		                        <select name="mail2" id="mail2" class="col-sm-3 ml-3 ">
		                              <option value="naver.com">naver.com</option>
		                              <option value="daum.net">daum.net</option>
		                              <option value="gamil.com">gamil.com</option>
		                              <option value="nate.com">nate.com</option>
		                        </select> 
		                  </div>
						<div class="form-group row">
							<label class="col-sm-2">연락처</label> <input type="text"
								class="form-control col-sm-3" name="u_phone" placeholder="phone"
								value="<c:out value='${row.u_phone}'/>">
						</div>
						<div class="form-group row">
							<label class="col-sm-2">주소</label> <input type="text"
								class="form-control col-sm-3" name="u_address"
								placeholder="address" value="<c:out value='${row.u_address}'/>">
						</div>
						<input type="hidden" name="u_delete"
							value="<c:out value='${row.u_delete}'/>">
						<div class="">
							<input class="btn btn-success mx-2" type="submit" value="회원수정" />
							<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
						</div>
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
</body>
</html>