<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<sql:setDataSource var="dataSource" url="jdbc:oracle:thin:@localhost:1521:xe" driver="oracle.jdbc.driver.OracleDriver" user="C##dbexam" password="m1234"/>
	<sql:query var="resultSet" dataSource="${dataSource}">
		select*from member_function
	</sql:query>
</head>
<body>
	<div class="jumbotron">
		<div class="container text-center">
			<h1>회원 목록</h1>
		</div><!-- container -->
	</div><!-- jumbotron -->
	<div class="container">
		<table class="table table-striped">
			<tr>
				<c:forEach var="columnName" items="${resultSet.columnNames}">
					<th><c:out value="${columnName}"/> </th>
				</c:forEach>
			</tr>
			<c:forEach var="row" items="${resultSet.rowsByIndex}">
				<tr>
					<c:forEach var="column" items="${row}" varStatus="i">
						<td>
							<c:if test="${column == null}">
								데이터 없음
							</c:if>
						</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>