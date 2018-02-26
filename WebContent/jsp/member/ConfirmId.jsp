<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="semiJdbc.DBCPInit" %>
<%@ page import="jsp.member.model.MemberDAO" %>

<% 
String id = request.getParameter("id");
MemberDAO dao = MemberDAO.getInstance();
int result = dao.ConfirmId(id);
%>
<html>
<head>
<title>ID 중복 확인</title>
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
<br>
							<br>
							<br>
<div class="row justify-content-md-center">
							
								<button type="submit" onClick='self.close()' class="btn btn-warning">
									<font color="#800080"></font>ID 사용하기<i
										class="fa fa-check spaceLeft"></i>
								</button>
						
							&nbsp;
							&nbsp;
							
								<button type="submit" onClick='self.close()' class="btn btn-danger">
									다른 ID 입력하기<i class="fa fa-times spaceLeft"></i>
								</button>
								</div>
								
								<div class="row justify-content-md-center">
								<br>
								<br> 
								
								<br>
								<br></div> 
							
							
							
</body>
</html>