<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>

<c:set var="passfalse" value="<script type='text/javascript'> alert('비밀번호가 다릅니다.');</script>"/>
<c:set var="idfalse" value="<script type='text/javascript'> alert('아이디가 다릅니다.');</script>"/>
<c:set var="x" value="${check}"/>
<c:choose>
	<!-- -1: 비밀번호 오류 -->
	<c:when test= "${check==-1}">
		<c:out value="${passfalse}" escapeXml = "false" />
		<meta http-equive ="refresh" content="0;URL ='../jsp/member/Jointool.do'">
	</c:when>
	
	<!-- 0: 비회원 -->
	<c:when test= "${check==0}">
		<c:out value="${idfalse}" escapeXml = "false" />
		<meta http-equiv="refresh" content="0;URL='../jsp/member/Jointool.do'">
	</c:when>
	
	<!-- 1: 관리자계정 -->
	<c:when test= "${check==1}">
		<c:out value="${passfalse}" escapeXml = "false" />
		<meta http-equiv="refresh" content="0;URL='../jsp/admin/bookingList.do'">
	</c:when>
	
	<!-- 2: 일반회원계정 -->
	<c:when test= "${check==2}">
		<c:out value="${passfalse}" escapeXml = "false" />
		<meta http-equiv="refresh" content="0;URL='../jsp/storeList/main.do'">
	</c:when>
	
</c:choose>