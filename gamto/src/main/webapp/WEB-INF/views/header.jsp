<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감토 | 신개념 독서토론</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<link rel="stylesheet" href="css/HnF.css" />
</head>
<body>
 <header>
      <div class="container-md">
        <div class="logobox">
        <a href="/">
          <img src="img/logo/logo1.png" width="50px" alt="토끼그릠이 그려진 감토 로고" />
          <span>감토</span>
        </a>
        </div>
        <nav>
          <ul>
            <li class="muted"><a href="/write" data-bs-placement="bottom" data-bs-html="true" data-bs-toggle="tooltip" data-bs-title="| 글쓰기 |<br>나의 생각을 적어보세요">나의 생각。</a></li>
            <li class="muted"><a href="/list" data-bs-placement="bottom" data-bs-html="true" data-bs-toggle="tooltip" data-bs-title="| 독후감 |<br>다른 감토님의 생각도 <br>확인해 보세요">너의 생각。</a></li>
            <li class="muted"><a href="/board" data-bs-placement="bottom" data-bs-html="true" data-bs-toggle="tooltip" data-bs-title="| 게시판 |<br>감토님들과 생각을 <br>나눠보세요">우리 생각。</a></li>
          </ul>
          <ul class="loginbox">
            <li>
              <a href="/b_list"><i class="bi bi-cart3"></i></a>
            </li>
            <li>
              <a href="/member"><i class="bi bi-person"></i></a>
            </li>
          </ul>
        </nav>
      </div>
    </header>
<script>
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})
</script>
</body>
</html>