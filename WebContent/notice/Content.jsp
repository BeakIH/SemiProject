<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>공지 사항</title>

<!-- Bootstrap -->
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans" rel="stylesheet" />
<link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../lib/animate.css" rel="stylesheet">
<link href="../lib/selectric/selectric.css" rel="stylesheet">
<link href="../lib/swiper/css/swiper.min.css" rel="stylesheet">
<link href="../lib/aos/aos.css" rel="stylesheet">
<link rel="stylesheet" href="../lib/photoswipe/photoswipe.css"> 
<link rel="stylesheet" href="../lib/photoswipe/default-skin/default-skin.css">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/notice2.css" rel="stylesheet">



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="lib/jquery-3.2.1.min.js"></script>
<script src="lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script src="lib/selectric/jquery.selectric.js"></script>
<script src="lib/swiper/js/swiper.min.js"></script>
<script src="lib/aos/aos.js"></script>
<script src="lib/photoswipe/photoswipe.min.js"></script>
<script src="lib/photoswipe/photoswipe-ui-default.min.js"></script>
<script src="lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="lib/lib.js"></script>

</head>

<body> 
<b>글내용 보기</b>
<br>
<form>
<table class="content"> 
  <tr>
    <td>글번호</td>
    <td>${article.bNo}</td>
    <td>조회수</td>
    <td>${article.bViewCnt}</td>
  </tr>
  <tr>
    <td>작성자</td>
    <td>${article.empNm}</td>
    <td>작성일</td>
    <td>${article.postDate}</td>
  </tr>
  <tr>
    <td>사원번호</td>
    <td>${article.empNo}</td>

  </tr>
  <tr>
    <td>글제목</td>
    <td>${article.bTitle}</td>
  </tr>
  <tr>
    <td>글내용</td>
    <td><pre>${article.bContent}</pre></td>
  </tr>
  <tr>     
    <td>
  <input type="button" value="글수정"
       onclick="document.location.href='/notice/updateForm.do?num=${article.bNo}&pageNum=${pageNum}'">
   &nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" value="글삭제"
       onclick="document.location.href='/notice/deleteForm.do?num=${article.bNo}&pageNum=${pageNum}'">
   &nbsp;&nbsp;&nbsp;&nbsp;
      
   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록"
       onclick="document.location.href='/notice/list.do?pageNum=${pageNum}'">
    </td>
  </tr>
</table>   
</form>     
</body>
</html>    