<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- 17-14)processLoginMember.jsp페이지에서 세션아이디에 저장해놓았던 사용자의 id를 얻어와서 회원이 탈퇴하기를 원하므로 해당 아이디를 이용해 delete sql구문 수행=>logoutMember.jsp로 이동 -->
<%-- <%
		String sessionId = (String)session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam" password="m1234"/>
	
<sql:update dataSource="${dataSource}" var="resultSet">
	delete from member_function where u_id=?
	<sql:param value="<%=sessionId %>"/>
</sql:update>
<c:if test="${resultSet>=1}">
	<c:import url="logoutMember.jsp"/>
	<c:redirect url="resultMember.jsp"/>
</c:if> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMember.jsp</title>
</head>
<body>
	<form action="delete">
		<p>정말로 탈퇴하시겠습니까?</p>
		<label class="col-sm-2">삭제할 아이디</label> 
		<input type="text" class="form-control col-sm-3" name="u_id" />
		<label class="col-sm-2">삭제할 비밀번호</label> 
		<input type="text" class="form-control col-sm-3" name="u_pw" />
		<input type="submit" value="확인" />
	</form>
	<form action="welcome">
		<input type="submit" value="취소" />
	</form>
</body>
</html>