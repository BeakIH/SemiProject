<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--    /를 붙여서 경로를 걸었으므로  " / " 가 첫번째 로옴  =>  http://localhost:9108/MVC_board/MVC/list.jsp-->
<!--    /를 안 붙여서 경로를 건 경우  =>  http://localhost:9108/MVC_board/MVC_board/MVC/list.jsp 라는 경로를 요청하게 되어 에러 발생-->
<!--                      
                -->
<% response.sendRedirect("/SemiProject/notice/notice2.do"); %>
</body>
</html>