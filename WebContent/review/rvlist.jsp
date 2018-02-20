<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>방명록 메시지 목록</title>
</head>
<body>
<form action=writeMessage.jsp method=post>
이름: <input type=text name=guestName ><br />
암호: <input type=password name=password><br />
메시지: <textarea name=message cols=30 rows=3></textarea> <br />
<input type=submit value="메시지 남기기">
</form>
<hr>


</body>
</html>
