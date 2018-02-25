<%@ page contentType="text/html; charset=UTF-8"%>

<%	request.setCharacterEncoding("UTF-8"); %>

<%
	boolean b = (boolean)request.getAttribute("result");

	if(b) {
%>
	<script>

		alert("수정 성공");
		location.href = "./management_list.do?store_no=${storeNo}";

	</script>	

<% } else { %>
	<script>
	
		alert(<%=b%>);
		alert("수정 실패!\n관리자에 문의바람");
		history.back();

	</script>	
<%
	}
%>
