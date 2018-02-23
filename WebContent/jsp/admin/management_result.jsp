<%@ page contentType="text/html; charset=UTF-8"%>

<%	request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dao" class="emp.EmpDBBean"/>
<jsp:useBean id="dto" class="emp.EmpDataBean"/>

<jsp:setProperty property="*" name="bean"/>

<%
	boolean b = dao.modifyEmp(dto);

	if(b){
%>
	<script>

		alert("수정 성공");
		location.href = "jsp/member/Success.jsp";

	</script>	

<% } else { %>
	<script>

		alert("수정 실패!\n관리자에 문의바람");
		history.back();

	</script>	
<%
	}
%>
