<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- �ڹٺ� Ŭ���� import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
    
<html>
<head>
    <title>ȸ������ ����ó��</title>
</head>
<body>
    <%-- �ڹٺ� ���� �׼��±� ��� --%>
    <jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%
        // ���ǿ��� ���̵� ������ MemberBean�� �����Ѵ�.
        String id= (String)session.getAttribute("sessionID"); 
        memberBean.setId(id);
    
        // ������ ȸ�������� ����ִ� MemberBean�� DAO�� �����Ͽ� ȸ������ ������ �Ѵ�.
        MemberDAO dao = MemberDAO.getInstance();
        dao.updateMember(memberBean);
    %>
    
    <br><br>
    <font size="5" color="gray">ȸ�������� �����Ǿ����ϴ�.</font>
    <br><br>
    <input type="button" value="��������" onclick="javascript:window.location='MainForm.jsp'"/>
    
</body>
</html>
