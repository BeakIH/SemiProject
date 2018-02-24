<%@ page language="java" contentType="text/html; charset=UTF-8" %>

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
            <form method="post" name="info" action="./management_modify.do" onsubmit="return checkValue()">
              <div class="form-group">
                <label> 이름 </label>
                <input type="text" name="name" class="form-control form-control-lg" placeholder="${name }" autofocus>
              </div>
              <div class="form-group">
                <label> 매장번호 </label>
                <input type="text" name="sNo" class="form-control form-control-lg" placeholder="아이디에 따라 매장번호 자동">
              </div>
              <div class="col-sm-5 col-md-5 col-lg-4 col-xl-4">
              	<div class="form-group">
             	 <label> 직위 </label>
              			<select name="position" class="form-control ui-select">
							<option value="" selected="selected">선택하세요</option>
							<option value="직원">직원</option>
							<option value="매니저">매니저</option>
							<option value="주방장">주방장</option>
							<option value="점장">점장</option>
						</select>
					</div>
				</div>
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
