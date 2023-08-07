<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!-- 17-13)사용자가 입력한 데이터를 매개변수로 받아 db table에 다시 저장하고 resultMember.jsp생성하여 이동하면서 매개변수로 msg-0을 가지고감 -->
<%
	request.setCharacterEncoding("utf-8");
	
	String u_id= request.getParameter("u_id");
	String u_pw= request.getParameter("u_pw");
	String u_name= request.getParameter("u_name");
	String u_phone= request.getParameter("u_phone");
	String u_email= request.getParameter("u_email");
	String u_address= request.getParameter("u_address");
	
%>
<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam" password="m1234"/>
	
<sql:update dataSource="${dataSource}" var="resultSet">
	update member_function set u_pw=?, u_name=?, u_phone=?,u_email=?, u_address=?
	<sql:param value="<%=u_pw %>"/>
	<sql:param value="<%=u_name %>"/>
	<sql:param value="<%=u_phone %>"/>
	<sql:param value="<%=u_email %>"/>
	<sql:param value="<%=u_address %>"/>
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1"/>
</c:if> --%>