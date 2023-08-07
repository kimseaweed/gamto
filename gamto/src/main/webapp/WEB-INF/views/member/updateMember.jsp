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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	
	<%
		String sessionId = (String)session.getAttribute("sessionId");
	%>
	<%-- 
	<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam" password="m1234"/>
	<sql:query var="rs" dataSource="${dataSource}">
		select*from member_function where u_id=?
		<sql:param value="<%=sessionId2%>"/>
	</sql:query> --%>
	
</head>
<body onload="init()"> <!-- 17-17) -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정</h1>
		</div><!-- container -->
	</div><!-- jumbotron -->
	<%-- <c:set var="row" value="${rows}"/>
	<c:choose>
		<c:when test="${fn:length(row) == 1}">
			<c:forEach items="${row}" var="row" > --%>
				<c:set var="row" value="${rows}"/>
				<c:set var="mail" value="${row.u_email}"/>
				<c:set var="mail1" value="${mail.split('@')[0]}"/>
				<c:set var="mail2" value="${mail.split('@')[1]}"/> 
				<div class="container">
					<form action="member/processUpdateMember" method="post" name="newMember" onsubmit="return checkForm()">
						<div class="form-group row ">
							<label class="col-sm-2">아이디</label> 
							<input type="text" class="form-control col-sm-3" name="u_id" placeholder="id" value="<c:out value='${row.u_id}'/>"/>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">비밀번호</label> 
							<input type="text"class="form-control col-sm-3" name="u_pw" placeholder="password" value="<c:out value='${row.u_pw}'/>">
						</div>
						<div class="form-group row">
							<label class="col-sm-2">이름</label> 
							<input type="text" class="form-control col-sm-3" name="u_name" placeholder="name"  value="<c:out value='${row.u_name}'/>"/>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">이메일</label> 
							<input type="text" class="form-control col-sm-3 mr-3" name="mail1" maxleng="50" value="${mail1}">@ 
							<select name="mail2" id="mail2" class="ml-3">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gamil.com">gamil.com</option>
								<option value="nate.com">nate.com</option>
							</select>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">연락처</label> <input type="text"
								class="form-control col-sm-3" name="u_phone" placeholder="phone" value="<c:out value='${row.u_phone}'/>">
						</div>
						<div class="form-group row">
							<label class="col-sm-2">주소</label> <input type="text"
								class="form-control col-sm-3" name="u_address" placeholder="address" value="<c:out value='${row.u_address}'/>">
						</div>
						<input type="hidden" name="u_delete" value="<c:out value='${row.u_delete}'/>">
						<!-- <input type="hidden" name="u_delete" value="0"> -->
						<div class="form-group row">
							<input class="btn btn-success mx-2" type="submit" value="회원수정" /> 
							<a href="deleteMember.jsp" class="btn btn-primary">회원탈퇴</a>
						</div>
					</form>
				</div>
<script>
	function init(){
		
		setComboMailValue("${mail2}");
		
	}
	
	function setComboMailValue(val){
		var selectMail = document.getElementById('mail2');
		for(i=0, j=selectMail.length; i<j; i++){
			if(selectMail.options[i].value== val){
				selectMail.options[i].selected=true;
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