<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<html>
<head>
    <title>�α׾ƿ�</title>

</head>
<body>
    <%
        session.invalidate(); // ��缼������ ����
        response.sendRedirect("../login/logout.jsp"); // �α��� ȭ������ �ٽ� ���ư���.
    %>
</body>
</html>