<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="emp.EmpDataBean"%>

<jsp:useBean id="membermanager" class="emp.EmpDBBean"/>

<%
	int storeNo = Integer.parseInt((String)session.getAttribute("storeNo"));
	EmpDataBean dto = membermanager.getData(storeNo);
%>
<html>
<head>
<title>정보수정</title>
</head>
<body>

	<div class="col-md-7 col-lg-8 col-xl-8">
            <div class="page-header bordered">
              <h1>정보 수정</h1>
            </div>
            <form method="post" name="info" action="./management_modify.do" onsubmit="return checkValue()">
              <div class="form-group">
                <label> 이름 </label>
                <input type="text" name="name" class="form-control form-control-lg" placeholder="<%=dto.getEmpNm() %>" autofocus>
              </div>
              <div class="form-group">
                <label> 매장번호 </label>
                <input type="text" name="sNo" class="form-control form-control-lg" placeholder="<%=dto.getStoreNo() %>">
              </div>
              <div class="form-group">
                <label> 직위 </label>
                <input type="text" name="pos" class="form-control form-control-lg" placeholder="<%=dto.getPosition() %>">
              </div>
              <hr>
              <div class="form-group action">
                <input type="submit" value="수정" class="btn btn-lg btn-primary" />
                <input type="button" value="취소" class="btn btn-lg btn-primary" />
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>