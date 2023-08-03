<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 책 자세히 보기</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<main class="b_view container-md bg-light px-5">
<div></div>
<div>${dto.b_code}</div>
<div>${dto.b_name}</div>
<div>${dto.b_author}</div>
<div>${dto.b_publisher}</div>
<div>${dto.b_release}</div>
<img src="../img/book/${dto.b_filename}"/>
<div>${dto.b_genre}</div>
<div>${dto.b_price}</div>
<div>${dto.b_description}</div>

</main>
<jsp:include page="../footer.jsp"/>
</body>
</html>