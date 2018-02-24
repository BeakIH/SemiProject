<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>BABSAZO</title>

<!-- Bootstrap -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans"
	rel="stylesheet" />
<link href="../../../lib/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../../../lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../../lib/animate.css" rel="stylesheet">
<link href="../../../lib/selectric/selectric.css" rel="stylesheet">
<link href="../../../lib/aos/aos.css" rel="stylesheet">
<link href="../../../lib/Magnific-Popup/magnific-popup.css"
	rel="stylesheet">
<link href="../../../css/style.css" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../../lib/jquery-3.2.1.min.js"></script>
<script src="../../../lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../../lib/selectric/jquery.selectric.js"></script>
<script src="../../../lib/aos/aos.js"></script>
<script src="../../../lib/Magnific-Popup/jquery.magnific-popup.min.js"></script>
<script src="../../../lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="../../../lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="../../../lib/lib.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div id="main">


		<article class="container">
			<div class="page-header">
				<h1>
					회원가입 <small> BABSAZO 회원만의 다양한 할인 혜택 및 프로모션이 기다리고 있어요!</small>
				</h1>
			</div>


			<div class="col-md-6 col-md-offset-3">

				<div class="form-group">


					<script type="text/javascript">
					
					
					// 중복처리
						
						function ConfirmId(){
						alert("실행");
						var id = document.getElementById("inputID").value;
							if(document.getElementById("inputID").value == "") {
							alert('사용하실 ID를 입력하세요.');
							return;
						}
							alert(id);
						url = "ConfirmId.jsp?id="+id;
						open(url, "confirm","toolbar=no,location=no,status=no,scrollbars=no,resizable=no");
						}
						
						
						
						// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
						function checkValue() {
							if (!document.userInfo.mem_id.value) {
								alert("아이디를 입력하세요.");
								return false;
							}

							if (!document.userInfo.password.value) {
								alert("비밀번호를 입력하세요.");
								return false;
							}

							// 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
							if (document.userInfo.password.value != document.userInfo.passwordcheck.value) {
								alert("비밀번호를 동일하게 입력하세요.");
								return false;

							}
						}

						// 취소 버튼 클릭시 로그인 화면으로 이동
						function goLoginForm() {
							location.href = "LoginForm.jsp";
						}
					</script>


					<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
					<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
					<form method="get" action="/SemiProject/jsp/member/view/JoinYeah.do" name="userInfo" onsubmit="return checkValue()">

						<table>
							<tr>
								<div class="form-group">
									<label for="birth"><font size="4em" color="52478B">생년월일 또는 기념일</font></label>
									<td id="title"></td> <input type="text" name="mem_no"
										maxlength="4" placeholder="년(4자)" size="6" required>
									<!--  &nbsp;<select name="birthmm">
                            <option value="">월</option>
                            <option value="01" >1</option>
                            <option value="02" >2</option>
                            <option value="03" >3</option>
                            <option value="04" >4</option>
                            <option value="05" >5</option>
                            <option value="06" >6</option>
                            <option value="07" >7</option>
                            <option value="08" >8</option>
                            <option value="09" >9</option>
                            <option value="10" >10</option>
                            <option value="11" >11</option>
                            <option value="12" >12</option>
                        </select>
                     &nbsp; <input type="text" name="birthdd" maxlength="2" placeholder="일" size="6" >
                    </td>  -->
							</tr>
							<p class="help-block">기념일 입력시 쿠폰을 발급해드려요</p>
							</div>

							<br>
                          	<tr>
								<div class="form-group">
									<label for="username"><font size="4em" color="52478B">이름</font></label>
									<td id="title"></td> <input type="text" name="mem_nm"
										maxlength="50" class="form-control" id="username"
										placeholder="이름을 입력해 주세요" required>
								</div>
							</tr>

							<br>
                  			<tr>
								<div class="form-group">
									<label for="username"><font size="4em" color="52478B">회원
											아이디</font></label>
									<td id="title"></td>
									<div class="input-group">
										<input type="text" name="mem_id" maxlength="50"
											class="form-control" id="inputID"
											placeholder="사용하실 아이디를 입력해 주세요" required> <span
											class="input-group-btn">
											<button type="button" class="btn btn-warning" onClick="ConfirmId();">
												<font color="F9FFFF">아이디 중복 체크</font><i
													class="fa fa-edit spaceLeft"></i>
											</button>
										</span>
							</tr>
							</div>

							<br>

							<tr>
								<div class="form-group">
									<label for="InputPassword1"><font size="4em"
										color="52478B">비밀번호</font></label>
									<td id="title"></td> <input type="password" name="mem_pw"
										maxlength="50" class="form-control" id="InputPassword1"
										placeholder="비밀번호" required>
								</div>
							</tr>

							<br>

							<tr>
								<div class="form-group">
									<label for="InputPassword2"><font size="4em"
										color="52478B">비밀번호 확인</font></label>
									<td id="title"></td>
									<!-- name="passwordcheck" -->
									<input type="password" maxlength="50" class="form-control"
										id="InputPassword2" placeholder="비밀번호 확인" required>
									<p class="help-block">비밀번호 확인을 위해 다시한번 입력해주세요</p>
								</div>
							</tr>

							<br>
                      	<div class="form-group">
								<label for="username"><font size="4em" color="52478B">휴대폰 번호</font></label>
								<td id="title"></td> <input type="tel" name="mem_tel"
									class="form-control" id="username" placeholder="- 없이 입력해 주세요" required>
							</div>
					
							<div>
								<input type="checkbox" value="동의">휴대폰 수신에 동의합니다
							</div>
							<div>
								<p class="help-block">(모바일 전용 쿠폰 및 게릴라 할인시 푸시 알림을 받으실 수 있어요)</p>
							</div>

							<!-- 인증번호 전송 기능은 별도 사이트에서 구입필요
            <span class="input-group-btn"> 
                  <button class="btn btn-warning"><font color="#F9FFFFE">인증번호 전송</font><i class="fa fa-mail-forward spaceLeft"></i></button>
                </span> -->

							<br>

							<div class="form-group">
								<label for="username"><font size="4em" color="52478B">주소</font></label>
								<td id="title"></td>
								<div class="input-group">
									<!-- 여기 주소가들어감 -->
									<input type="text" name="address" class="form-control"
										id="roadAddress" placeholder="도로명/지번/동·읍·면" required> <span
										class="input-group-btn"><button onclick="execDaumPostcode()" class="btn btn-warning"><font color="F9FFFF">우편번호
												검색</font><i class="fa fa-mail-forward spaceLeft"></i></button>
									</span>
								</div>
								<div class="form-group">
									<!-- 여기 우편번호가 들어감 -->
									<input type="text" class="form-control" id="zip_code"
										placeholder="우편번호를 입력하세요" required>
								</div>
								<!-- name="chk_info" -->
								<div>
									<input type="checkbox" value="동의">우편으로 BABSAZO 소식지를 받겠습니다
								</div>
								<div>
									<p class="help-block">(BABSAZO 소식지 전용 쿠폰 및 새로운 BABSAZO 제일 먼저 받아보세요)</p>
								</div>

								<br>
                                <div class="form-group">
									<label for="InputEmail"><font size="4em" color="52478B">이메일 주소</label></font>
									<td id="title"></td> <input type="text" name="email"
										class="form-control" id="username" placeholder="이메일을 입력해 주세요" required>
								</div>
								<br>
								
								<!-- 
                         <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>  -->

								<div class="form-group">
									<font size="4em" color="52478B">이메일 수신여부</label></font>
									<td id="title"></td> BABSAZO 이메일 뉴스레터 수신에 동의합니다<br>
							    	 예<input type="radio" name="email_yn" value="y">
                                                                                    아니오<input type="radio" name="email_yn" value="n">
									<p class="help-block">(이메일 BABSAZO 뉴스레터 쿠폰 발급과 이벤트 참여가 가능합니다)</p>
								</div>

								<br>

								<!--  <div class="form-group">
               <label for="username"><font size="4em" color="52478B">성별</label>
               <td id="title"></td> 
              <input type="radio" name="gender" value="남" checked >남
              <input type="radio" name="gender" value="여" checked>여
                  </font>  </td>
                </tr><br><br>  -->
                 			
                 			<div class="form-group">
                 			<label for="username"><font size="4em" color="52478B"> 관심 BABSAZO 메장</font></label>
                 			<br>
							
							
						
						  <div class="checkbox" id="store"> 한식
						  <hr>
			
														
														<input type="checkbox" name="store0" value="조양관" id="store0">
														<label for="store0">조양관</label>
														<input type="checkbox" name="store1" value="석양" id="store1">
														<label for="store1">석양</label>
														<input type="checkbox" name="store2" value="스믓스" id="store2">
														<label for="store2">스믓스</label>
														<input type="checkbox" name="store3" value="오라방" id="store3">
														<label for="store3">오라방</label>
														<input type="checkbox" name="store4" value="큐스닭강정" id="store4">
														<label for="store4">큐스닭강정</label>
														<input type="checkbox" name="store5" value="꽃추장" id="store5">
														<label for="store5">꽃추장</label>
														<input type="checkbox" name="store6" value="태양식당" id="store6">
														<label for="store6">태양식당</label>
														<input type="checkbox" name="store7" value="라연" id="store7">
														<label for="store7">라연</label>
														<input type="checkbox" name="store8" value="원기정" id="store8">
														<label for="store8">원기정</label>
														<input type="checkbox" name="store9" value="한강껍데기" id="store9">
														<label for="store9">한강껍데기</label>
														<input type="checkbox" name="store10" value="밀면집" id="store10">
														<label for="store10">밀면집</label>
														<input type="checkbox" name="store11" value="홍두깨손칼국수" id="store11">
														<label for="store11">홍두깨손칼국수</label>
							
							
							</div>
							
							<div class="checkbox" id="store"> 일식
									  <hr>
						  
														
														<input type="checkbox" name="store12" value="미자카야" id="store12">
														<label for="store12">미자카야</label>
														<input type="checkbox" name="store13" value="가마덴" id="store13">
														<label for="store13">가마덴</label>
														<input type="checkbox" name="store14" value="이치젠" id="store14">
														<label for="store14">이치젠</label>
														<input type="checkbox" name="store15" value="로사미나미" id="store15">
														<label for="store15">로사미나미</label>
														<input type="checkbox" name="store16" value="만뽀" id="store16">
														<label for="store16">만뽀</label>
														<input type="checkbox" name="store17" value="카페나하" id="store17">
														<label for="store17">카페나하</label>
							</div>
							<div class="checkbox" id="store"> 중식 
							<hr>
							
														
														<input type="checkbox" name="store18" value="차이" id="store18">
														<label for="store18">차이</label>
														<input type="checkbox" name="store19" value="동일루" id="store19">
														<label for="store19">동일루</label>
														<input type="checkbox" name="store20" value="경화루" id="store20">
														<label for="store20">경화루</label>
														<input type="checkbox" name="store21" value="가향" id="store21">
														<label for="store21">가향</label>
							</div>
								<div class="checkbox" id="store"> 양식
								<hr>
														
														<input type="checkbox" name="store22" value="엘본더테이블" id="store22">
														<label for="store22">엘본더테이블</label>
														<input type="checkbox" name="store23" value="미스티" id="store23">
														<label for="store23">미스티</label>
														<input type="checkbox" name="store24" value="다이닝비" id="store24">
														<label for="store24">다이닝비</label>
														<input type="checkbox" name="store25" value="문인더랩" id="store25">
														<label for="store25">문인더랩</label>
														<input type="checkbox" name="store26" value="베를린키친" id="store26">
														<label for="store26">베를린키친</label>
														<input type="checkbox" name="store27" value="주오일식당" id="store27">
														<label for="store27">주오일식당</label>
														<input type="checkbox" name="store28" value="파이브테이블즈" id="store28">
														<label for="store28">파이브테이블즈</label>
														<input type="checkbox" name="store29" value="시크릿" id="store29">
														<label for="store29">시크릿</label>
							</div>
							<div class="checkbox" id="store"> 기타
							<hr>
														
														<input type="checkbox" name="store30" value="찍먹닭" id="store30">
														<label for="store30">찍먹닭</label>
														<input type="checkbox" name="store31" value="보라초" id="store31">
														<label for="store31">보라초</label>
														<input type="checkbox" name="store32" value="발리인망원" id="store32">
														<label for="store32">발리인망원</label>
														<input type="checkbox" name="store33" value="프롬하노이" id="store33">
														<label for="store33">프롬하노이</label>
														<input type="checkbox" name="store34" value="라오삐약" id="store34">
														<label for="store34">라오삐약</label>
							</div>
								
									<p class="help-block">해당 매장의 쿠폰 발행시 자동 발급해드립니다</p>
								</div>
									
									<td id="title"></td> <input type="text" name="fvrt_str_1"
										class="form-control" id="username"
										placeholder="BABSAZO 타워에 입점 희망하시는 매장이 있다면 적어주세요">
									
				

								<br>

								<div class="form-group">
									<label for="username"><font size="4em" color="52478B"><label for="username"> 선호하는 음식(중복선택 가능)</font></label>
									<td id="title"></td>
									 </div>
               
  							<div class="checkbox" id="food">
														<input type="checkbox" name="food0" value="면류" id="house">
														<label for="house">면류</label>
														<input type="checkbox" name="food1" value="찌개류" id="house1">
														<label for="house1">찌개류</label>
														<input type="checkbox" name="food2" value="디저트류" id="house2">
														<label for="house2">디저트류</label>
							</div>
							<div class="checkbox" id="food">
														<input type="checkbox" name="food3" value="밥류" id="house3">
														<label for="house3">밥류</label>
														<input type="checkbox" name="food4" value="고기류" id="house4">
														<label for="house4">고기류</label>
														<input type="checkbox" name="food5" value="해산물류" id="house5">
														<label for="house5">해산물류</label>
							</div>
							<div class="checkbox" id="food">
														<input type="checkbox" name="food6" value="찜류" id="house6">
														<label for="house6">찜류</label>
														<input type="checkbox" name="food7" value="튀김류" id="house7">
														<label for="house7">튀김류</label>
							</div>
								</div>
								<input type="text" name="fvrt_str_2" class="form-control"
									id="username" placeholder="기타">
							</div>
							
							
							<!-- <input type="submit" value="가입"/>  
            <input type="button" value="취소" onclick="goLoginForm()">-->


						</table>
						<br>
						<div class="form-group">
							<div data-toggle="buttons">
								<label class="btn btn-info active"> <span class="fa fa-check"></span> 
								<input id="agree" type="checkbox" autocomplete="off" checked >
								</label> <a href="#"><font size="2em">이용약관 및 개인정보 처리방침에동의합니다.(필수)</a></font>
							</div>
						</div>
						<div class="row justify-content-md-center">
							<form action="#">
								<button type="submit" class="btn btn-warning">
									<font color="#800080"></font>회원가입<i
										class="fa fa-check spaceLeft"></i>
								</button>
							</form>
							&nbsp;
							<form action="#">
								<button type="submit" class="btn btn-danger">
									가입취소<i class="fa fa-times spaceLeft"></i>
								</button>
							</form>
						</div>
				</div>
			</div>


<!-- 주소검색 코드 추후에 따로 파일 만들어서 정리 -->
<span id="guide" style="color:#999"></span>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                var sido = data.sido;
                var sigungu = data.sigungu;
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                var remainRoadAddr = fullRoadAddr.replace(sido + " " + sigungu, "");
                var remainjibunAddr = data.jibunAddress.replace(sido + " " + sigungu, "");
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip_code').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                /* document.getElementById('old_zip_code').value = data.postcode; //6자리 우편번호 사용
                document.getElementById('jibunAddress').value = data.jibunAddress;
                document.getElementById('user_selected_type').value = data.userSelectedType; //검색 결과에서 사용자가 선택한 주소의 타입(R(도로명), J(지번))
                document.getElementById('sido').value = sido;
                document.getElementById('sido2').value = sido;
                document.getElementById('sigungu').value = sigungu;
                document.getElementById('sigungu2').value = sigungu;
                document.getElementById('remain_road_addr').value = remainRoadAddr;
                document.getElementById('remain_jibun_addr').value = remainjibunAddr; */
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>

</body>
</html>