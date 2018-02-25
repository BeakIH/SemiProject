<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>직원정보 수정</title>
</head>
<body>
 
<div class="col-md-7 col-lg-8 col-xl-8">
            <div class="page-header bordered">
              <h1>정보 수정</h1>
            </div>
            <form method="post" name="info" action="./management_modify.do?adm_id=${id}" onsubmit="return checkValue()">
              <div class="form-group">
                <label> 이름 </label>
                <input type="text" name="name" class="form-control form-control-lg" value="${res.empNm}" autofocus>
              </div>
              <div class="form-group">
                <label> 매장번호 </label>
                <input type="text" name="sNo" class="form-control form-control-lg" value="${res.storeNo}" readOnly>
              </div>
              
              <c:choose>
              	<c:when test="${res.position=='직원'}">
	              <div class="col-sm-5 col-md-5 col-lg-4 col-xl-4">
	              	<div class="form-group">
	             	 <label> 직위 </label>
	              			<select name="position" class="form-control ui-select">
								<option value="">선택하세요</option>
								<option value="직원" selected="selected">직원</option>
								<option value="매니저">매니저</option>
								<option value="주방장">주방장</option>
								<option value="점장">점장</option>
							</select>
						</div>
					</div>
              	</c:when>
              	<c:when test="${res.position=='매니저'}">
	              <div class="col-sm-5 col-md-5 col-lg-4 col-xl-4">
	              	<div class="form-group">
	             	 <label> 직위 </label>
	              			<select name="position" class="form-control ui-select">
								<option value="">선택하세요</option>
								<option value="직원">직원</option>
								<option value="매니저" selected="selected">매니저</option>
								<option value="주방장">주방장</option>
								<option value="점장">점장</option>
							</select>
						</div>
					</div>
              	</c:when>
              	<c:when test="${res.position=='주방장'}">
	              <div class="col-sm-5 col-md-5 col-lg-4 col-xl-4">
	              	<div class="form-group">
	             	 <label> 직위 </label>
	              			<select name="position" class="form-control ui-select">
								<option value="">선택하세요</option>
								<option value="직원">직원</option>
								<option value="매니저">매니저</option>
								<option value="주방장" selected="selected">주방장</option>
								<option value="점장">점장</option>
							</select>
						</div>
					</div>
              	</c:when>
              	<c:when test="${res.position=='점장'}">
	              <div class="col-sm-5 col-md-5 col-lg-4 col-xl-4">
	              	<div class="form-group">
	             	 <label> 직위 </label>
	              			<select name="position" class="form-control ui-select">
								<option value="" selected="selected">선택하세요</option>
								<option value="직원">직원</option>
								<option value="매니저">매니저</option>
								<option value="주방장">주방장</option>
								<option value="점장" selected="selected">점장</option>
							</select>
						</div>
					</div>
              	</c:when>
              </c:choose>
				
              <hr>
              <div class="form-group action">
                <input type="submit" value="등록" class="btn btn-lg btn-primary" />
                <input type="reset" value="다시입력" class="btn btn-lg btn-primary" />
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
