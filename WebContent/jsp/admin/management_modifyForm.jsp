<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.modalPwd{
	position : absolute;
	border-radius : 5px;
	border: 1px solid gray;
	top:200px;
	z-index: 9999;
	width:500px;
	height:150px;
	left:5%;
	display: none;
	background : white;
}
#inputPwd{
	position:relative;
	top:5px;
	left:100px;
	width:300px;
}
.btnDiv{
	margin-top:20px;
	padding-right: 30px;
	float: right;
}
.pwdLabel{
	margin : 10px 0 0 15px;
}
</style>
<div class="col-md-7 col-lg-8 col-xl-8">
	<div class="page-header bordered">
		<h1>정보 수정</h1>
	</div>
	<form method="post" id="modifyForm" name="info" action="./management_modify.do" onsubmit="return checkValue()">
		<div class="form-group">
			<input type="hidden" name="id" value="${res.admId}" />
			<input type="hidden" id="pwd" name="pwd" />
			<input type="hidden" id="eno" name="eno" value="${res.empNo}"/>
			<label> 이름 </label> 
			<input type="text" name="name" id="nameFocus" class="form-control form-control-lg" value="${res.empNm}">
		</div>
		<div class="form-group">
			<label> 매장번호 </label> <input type="text" name="sNo" class="form-control form-control-lg" value="${res.storeNo}" readOnly>
		</div>
		<c:choose>
			<c:when test="${res.position=='직원'}">
				<div class="col-sm-5 col-md-5 col-lg-4 col-xl-4">
					<div class="form-group">
						<label> 직위 </label> <select name="position"
							class="form-control ui-select">
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
						<label> 직위 </label> <select name="position"
							class="form-control ui-select">
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
						<label> 직위 </label> <select name="position"
							class="form-control ui-select">
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
						<label> 직위 </label> <select name="position"
							class="form-control ui-select">
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
			<input type="button" value="수정" id="modifyBtn" class="btn btn-lg btn-primary" />
			<input type="button" value="취소" class="btn btn-lg btn-primary" onClick="location.href='management_list.do?store_no=${res.storeNo}'" />
		</div>
	</form>
		<div class="modalPwd">
			<label class="control-label pwdLabel">관리자 비밀번호 입력 :</label>
			<input type="password" id ="inputPwd" class="form-control"/>
			<div class="btnDiv">
				<button class="pwdCheckBtn btn btn-primary">확인</button>
				<button class="modalCloseBtn btn btn-primary">취소</button>
			</div>
		</div>
</div>
<script>
$(function(){
	if("${param.check}" == 1){
		$(".modalPwd").show();
		$("#inputPwd").focus();
		
	}else{
		var val = $("#nameFocus").val();
		$("#nameFocus").focus().val('').val(val);
	}
});
$(".pwdCheckBtn").click(function(){
	  var inputPwd = $("#inputPwd").val();
	  $("#pwd").val(inputPwd);
	  document.querySelector("#modifyForm").submit();
});
$(".modalCloseBtn").click(function(){
	$(".modalPwd").hide();
});
$("#modifyBtn").click(function(){
	$(".modalPwd").show();
	$("#inputPwd").focus();
});
var a = function(){
	$("#inputPwd").focus();
}
</script>
