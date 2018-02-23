<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO" %>

<% 
System.out.print("그만");
String id = request.getParameter("id");
System.out.print(id);
MemberDAO dao = MemberDAO.getInstance();
int result = dao.ConfirmId(id);
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<% if(result == 1){ %>
<center>
<br /> <br />
<h4> 이미 사용중인 ID 입니다. 다른 ID를 입력해주세요.</h4>
</center>
<% }else{ %>
	<center>
	<br /><br />
	<h4>입력하신 <%=id %>는 사용하실 수 있는 ID입니다.</h4>
	</center>
<% } %>

</body>
</html>