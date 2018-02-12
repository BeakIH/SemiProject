<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>



<style>



.modal {

        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}


.maintext{
	text-align:center;
}
.cancellation{
 	margin-left: 100px;
    margin-right: 6px;
	width:100px;
    padding-right: 6px;
    height: 40px;
    margin-top: 15px;

}
.reservation{
	width:100px;
	padding-right: 6px;
    height: 40px;
    margin-top: 15px;
    margin-left: 2px;
    border-left-width: 2px;
    margin-right: 0px;
}

</style>
<script type="text/javascript">
function setCheckBoxAsRadio(targetObj, inObj){
	 var len = targetObj.length;
	 
	 if(len>1){ // 객체가 배열이라면. 배열이 아니면 그냥 체크박스로 작동
	  for(var i=0; i<len; i++){
	   if(targetObj[i] != inObj)
	    targetObj[i].checked = false;
	  }
	 }
	}
	
function setCheckBoxAsRadio2(targetObj, inObj){
	 var len = targetObj.length;
	 
	 if(len>1){ // 객체가 배열이라면. 배열이 아니면 그냥 체크박스로 작동
	  for(var i=0; i<len; i++){
	   if(targetObj[i] != inObj)
	    targetObj[i].checked = false;
	  }
	 }
	}
	
function setCheckBoxAsRadio3(targetObj, inObj){
	 var len = targetObj.length;
	 
	 if(len>1){ // 객체가 배열이라면. 배열이 아니면 그냥 체크박스로 작동
	  for(var i=0; i<len; i++){
	   if(targetObj[i] != inObj)
	    targetObj[i].checked = false;
	  }
	 }
	}
	
</script>


<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Real Estate</title>

<!-- Bootstrap -->
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans" rel="stylesheet" />
<link href="../../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../lib/animate.css" rel="stylesheet">
<link href="../../lib/selectric/selectric.css" rel="stylesheet">
<link href="../../lib/swiper/css/swiper.min.css" rel="stylesheet">
<link href="../../lib/aos/aos.css" rel="stylesheet">
<link rel="stylesheet" href="../../lib/photoswipe/photoswipe.css"> 
<link rel="stylesheet" href="../../lib/photoswipe/default-skin/default-skin.css"> 
<link href="../../css/style.css" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../lib/jquery-3.2.1.min.js"></script>
<script src="../../lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../lib/selectric/jquery.selectric.js"></script>
<script src="../../lib/swiper/js/swiper.min.js"></script>
<script src="../../lib/aos/aos.js"></script>
<script src="../../lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="../../lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="../../lib/photoswipe/photoswipe.min.js"></script>
<script src="../../lib/photoswipe/photoswipe-ui-default.min.js"></script>
<script src="../../lib/lib.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>


<h1 class="maintext">예약</h1>

		
         
		<div style="overflow:scroll; width:350px; height:600px; padding:10px; background-color:wheat; white-space:nowrap; float:left;">
		<div data-obj-id="yZe8J" data-obj-type="element"
			data-text-editable="true" class=""
		    top: 287px; left: 480px; width: 82px; height: 23px;">
			<div data-text-content="true"
				style="background-color:dimgray; text-align: center; font-size: 17px;"
				class=""><span style="color:white">매장명</span></div>		
		<form name="form1">
 		<label><input type="checkbox" name="store_no" value="매장a" onClick="setCheckBoxAsRadio(form1.store_no, this);"> 매장a</label><br/>
 		<label><input type="checkbox" name="store_no" value="매장b" onClick="setCheckBoxAsRadio(form1.store_no, this);"> 매장b </label><br/>
 		<label><input type="checkbox" name="store_no" value="매장c" onClick="setCheckBoxAsRadio(form1.store_no, this);"> 매장c</label><br/>
		<label><input type="checkbox" name="store_no" value="매장c" onClick="setCheckBoxAsRadio(form1.store_no, this);"> 매장c</label><br/>
		
		</form>
	
			
			</div>
			</div>
			

		
		
		<div style="overflow:scroll; width:180px; height:600px; padding:10px; background-color:wheat; white-space:nowrap; float:left;">
		 <div data-text-content="true" style="background-color:dimgray; 
		text-align: center; font-size: 17px;" class=""><span style="color:white">날짜</span></div></br>
		 	<h2 style="text-align:center">3월</h6>
		 	<form name="form3">
		 	<label><input type="checkbox" name="bk_date2" value="date01" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 1일 목요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date02" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 2일 금요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date03" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:blue;"> 3일 토요일</span></label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date04" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:red;"> 4일 일요일</span></label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date05" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 5일 월요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date06" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 6일 화요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date07" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 7일 수요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date08" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 8일 목요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date09" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 9일 금요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date10" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:blue;"> 10일 토요일</span></label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date11" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:red;"> 11일 일요일</span></label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date12" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 12일 월요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date13" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 13일 화요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date14" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 14일 수요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date15" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 15일 목요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date16" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 16일 금요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date17" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:blue;"> 17일 토요일</span></label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date18" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:red;"> 18일 일요일</span></label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date19" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 19일 월요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date20" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 20일 화요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date21" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 21일 수요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date22" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 22일 목요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date23" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 23일 금요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date24" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:blue;"> 24일 토요일</span></label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date25" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:red;"> 25일 일요일</span></label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date26" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 26일 월요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date27" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 27일 화요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date28" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 28일 수요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date29" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 29일 목요일</label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date30" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"> 30일 금요일 </label><br/>
		 	<label><input type="checkbox" name="bk_date2" value="date31" onClick="setCheckBoxAsRadio3(form3.bk_date2, this);"><span style="color:blue;"> 31일 토요일</span></label><br/>
		 	
		 	</form>
		

	</div>
	 <div style="overflow:scroll; width:150px; height:600px; padding:10px; background-color:wheat; white-space:nowrap; float:left;">
		<div data-obj-id="1mWAj" data-obj-type="element"
			data-text-editable="true" class=""
			top: 499px; left: 305px; width: 82px; height: 23px;">
		<div data-text-content="true"
			style="background-color: dimgray; text-align: center; font-size: 17px;"
			class=""><span style="color:white">이용시간</span></div>
				</div>
				
				<form name="form2">
		 		<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 10:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 11:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 12:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 13:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 14:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 15:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 16:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 17:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 18:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 19:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 20:00 </label><br/>
				<label><input type="checkbox" name="bk_date" value="date" onClick="setCheckBoxAsRadio2(form2.bk_date, this);"> 21:00 </label><br/>
				
				</form>
		</div>
		
		
		 <div style="overflow:scroll; width:350px; height:600px; padding:10px; background-color:wheat; white-space:nowrap; float:left;">
		 <div data-obj-id="yZe8J" data-obj-type="element"
			data-text-editable="true" class=""
		    top: 287px; left: 480px; width: 82px; height: 23px;">
			<div data-text-content="true"
				style="background-color:dimgray; text-align: center; font-size: 17px;"
				class=""><span style="color:white">미리주문</span></div>
			</div>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">크림스파게트</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">봉골레파스타</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">스테이크</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">함박스테이크</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">돈까스</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">커피</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">참이슬</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">맥주</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">와인</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">크림스파게트</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">봉골레파스타</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">스테이크</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">함박스테이크</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">돈까스</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">커피</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">참이슬</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">맥주</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">와인</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">크림스파게트</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">봉골레파스타</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">스테이크</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">함박스테이크</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">돈까스</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">커피</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">참이슬</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">맥주</label><br>
		<label><input type="checkbox" name="음식메뉴" value="음식메뉴">와인</label><br>
			
		 <div data-obj-id="yZe8J" data-obj-type="element"
			data-text-editable="true" class=""
		    top: 287px; left: 480px; width: 82px; height: 23px;">
			<div data-text-content="true"
				style="background-color:dimgray; text-align: center; font-size: 17px;"
				class=""><span style="color:white">예약인원</span></div>	
		<label>예약 인원수</label>
                <select name="nnn" style="width:100px; height:30px;">
                  <option value="1인">1인</option>
                  <option value="1인" selected="selected">2인</option>
                  <option value="1인">3인</option>
                  <option value="1인">4인</option>
                  <option value="1인">5인</option>
                  <option value="1인">6인</option>
                  <option value="1인">7인</option>
                  <option value="1인">8인</option>
                </select>
		<div id="reserve">
		<button type="submit" class="cancellation">취소</button>
		<button type="submit" class="reservation" data-target="#modal" data-toggle="modal">예약</button>
	

	
		</div>
		</div>
	</div>
	
	<div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="modar" aria-hidden="true"> 
  <div class="modal-dialog modal-lg"> 
    <div class="modal-content"> 
      <div class="modal-header"> 
	    <div class="row">
          <div class="col-lg-12">
       	  <button class="close" data-dismiss="modal">&times;</button>
       	  
       	<div class="row">
          <div class="col-lg-12">
          	<div class="page-header bordered">
           	<h1>윤식당<small>예약정보</small></h1>
           	</div>
            </div>
        </div>
        <div class="row">
       	  <div class="col-lg-12">
            <form action="index.php">
              <h2 class="subheadline">매장주소</h2>
              <input type="text" class="form-control form-control-lg" placeholder="" value="서울시 중구 남대문로 120 대일빌딩 3층">
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4">
            <div class="form-group">
              <label><h5 style="padding-top: 15px";> 이름</h5></label>
                <input type="text" class="form-control form-control-lg" placeholder="" value="이수근">
            </div>
          </div>
          <div class="col-lg-4">
            <div class="form-group">
              <label><h5 style="padding-top: 15px";>예약 인원수</h5></label>
              <input type="text" class="form-control form-control-lg" placeholder="" value="2명">
             </div>
           </div>
          <div class="col-lg-4">
            <div class="form-group">
              <label><h5 style="padding-top: 15px";>매장 전화번호</h5></label>
              <input type="text" class="form-control form-control-lg" placeholder="" value="02-4444-4444">
             </div>
           </div>
         </div>
         <div class="row">
           <div class="col-md-6">
             <div class="form-group">
               <label><h5>예약 날짜 및 이용시간</h5></label>
                 <input type="text" class="form-control form-control-lg" placeholder="" value="3월19일 12:00">
             </div>
           </div>
           <div class="col-md-6">
             <div class="form-group">
               <label><h5>예약음식 총 가격</h5></label>
               <input type="text" class="form-control form-control-lg" placeholder="" value="50,000원">
             </div>
           </div>
         </div>
         <div class="row">
           <div class="col-md-12">
             <div class="form-group">
               <label><h5>예약주문한 음식메뉴</h5></label>
               <textarea class="form-control form-control-lg text-editor" placeholder=""></textarea>
             </div>
           </div>
         </div>
         <hr>
           <div class="form-group action">
           <button type="submit" class="btn btn-lg btn-primary">예약하기</button>
         </div>
		</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
	
	
</body>
</html>