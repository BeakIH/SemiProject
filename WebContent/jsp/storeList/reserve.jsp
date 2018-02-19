<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<script src="../../lib/jquery-3.2.1.min.js"></script>


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
<script type="text/javascript">
$( document ).ready(function() {
	
	/* 날짜  */
 var a = new Date();
 $('#monthText').html((a.getMonth()+1) + "월");
 var b = [];
 var c = a.getMonth()+1;
 var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
 
 for(var i = a.getDate()+1; i <= 31; i++){
	 a.setDate(a.getDate()+1);
	 if(a.getMonth() == c) break;
	 b.push(new Date(a.getFullYear() + "-" + (a.getMonth()+1) + "-" + i));

	 }
 var from3_text = "";
 for(var i = 0; i < b.length; i++){
	 var d = b[i].getDay();
	 var e = b[i].getFullYear() + "-" + (b[i].getMonth()+1) + "-" + b[i].getDate();
	 if(b[i].getDay() == 0) from3_text = from3_text + "<input type='radio' value='" + e + "' name='chk1' /><span style='color:red;'>" + b[i].getDate() + "일 " + week[b[i].getDay()] + "</span><br />";
	 else if(b[i].getDay() == 6) from3_text = from3_text + "<input type='radio' value='" + e + "' name='chk1' /><span style='color:blue;'>" + b[i].getDate() + "일 " + week[b[i].getDay()] + "</span><br />";
	 else from3_text = from3_text + "<input type='radio' value='" + e + "' name='chk1' />" + b[i].getDate() + "일 " + week[b[i].getDay()] + "<br />";
	 
 }
 //div id로 바꾸고 이름정해주기
 $('form[name="form3"]').html(from3_text);

 /* 시간 */
 var from2_text = "";
 var sto_open_Time = $('#oTime').val().split(" ~ ")[0];
 var sto_close_Time = $('#oTime').val().split(" ~ ")[1];
 
 for(var i = sto_open_Time.split(":")[0] * 1; i <= sto_close_Time.split(":")[0] * 1 - 1; i++){
	 if(i < 10) from2_text = from2_text + "<input type='radio' value='0" + i + ":00' name='chk2' />0" + i + ":00<br />"; 
	 else from2_text = from2_text + "<input type='radio' value='" + i + ":00' name='chk2' />" + i + ":00<br />"; 
 }
 
 $('form[name="form2"]').html(from2_text);
 
 
 /* 인원 수 */
 var avl = $('#avl_tbl_cnt').val() * 4;
 $('#bk_cnt').html('');
 for(var i = 1; i <= avl; i++){
 	$('#bk_cnt').append('<option value="' + i + '">' + i + '인</option>');
 	if(i == 40) break;
 }
 
 /* 테이블 수 */
 var avl_tbl_cnt = $('#avl_tbl_cnt').val();
 $('#bk_tbl_cnt').html('');
 for(var i = 1; i <= avl_tbl_cnt; i++){
	 	$('#bk_tbl_cnt').append('<option value="' + i + '">' + i + '개 테이블</option>');
	 	if(i == 10) break;
	 }
 
 /* raido 이벤트 */
 var bk_date = ["",""];
 $('#bk_date').val(bk_date[0] + " " + bk_date[1]);
 
 $('input[name="chk1"]').bind('click',function(i){
	 var data = $(i)[0].target;
	 bk_date[0] = $(data).val().split("-")[1] + "월 " + $(data).val().split("-")[2] + "일";
	 $('#bk_date').val(bk_date[0] + " " + bk_date[1]);
 });
 
 $('input[name="chk2"]').bind('click',function(i){
	 var data = $(i)[0].target;
	 bk_date[1] = $(data).val();
	 $('#bk_date').val(bk_date[0] + " " + bk_date[1]);
 });
 
 
 
 /* 인원 수 이벤트 */
 var useCnt = "1명";
 $('#useCnt').val(useCnt);
 
 $('#bk_cnt').bind('change',function(i){
	 var data = $(i)[0].target;
	 $('#useCnt').val($(data).val() + "명");
 });
 
 useTbl
 
 /* 테이블수 이벤트*/
 
  var useTbl = "";
 $('#useTbl').val(useTbl);
 
 $('#bk_tbl_cnt').bind('change',function(i){
	 var data = $(i)[0].target;
	 $('#useTbl').val($(data).val() * 1);
 });
 
 
 /* 메뉴 이벤트 */
 	var menuName = "";
 	var menuSum = "0원";
 	
 	$('#menuName').html(menuName);
 	$('#menuSum').val(menuSum);
 	
 	$('#chkBox').children('label').find('#bk_menu').bind('click',function(){
 		var menuSumTemp = 0;
 		menuName = "";
 		$('input[name="bk_menu"').each(function(i,item){
 			if($(item).prop("checked")){
 				if(menuName == "") menuName = $(item).val().split("/")[0];
 				else menuName = menuName + ", " + $(item).val().split("/")[0];
 				menuSumTemp = menuSumTemp * 1 + $(item).val().split("/")[1] * 1;
 			}
 		});
 		$('#menuName').html(menuName);
 	 	$('#menuSum').val(menuSumTemp + "원");
 	});
});



</script>
</head>
<body>

<h1 class="maintext">예약</h1>
	 <c:forEach var="article" items="${articleList}">
	   <input type="hidden" value="${article.store_octime }" id="oTime" />
	   <input type="hidden" value="${article.avl_tbl_cnt }" id="avl_tbl_cnt" /> --%>
      <div style="overflow:scroll; width:350px; height:600px; padding:10px; background-color:wheat; white-space:nowrap; float:left;">
      <div data-obj-id="yZe8J" data-obj-type="element"
         data-text-editable="true" class=""
          top: 287px; left: 480px; width: 82px; height: 23px;">
         <div data-text-content="true"
            style="background-color:dimgray; text-align: center; font-size: 17px;"
            class=""><span style="color:white">매장명</span></div>
                 
      <form name="form1">
      
      <label><input name="store_nm" style="background-color:white; height: 56px; width: 309px; text-align:center; font-size:30px;" value="${article.store_nm}"></label><br/>
    
       
      </form>
   
         
         </div>
         </div>
         

      
      
      <div style="overflow:scroll; width:180px; height:600px; padding:10px; background-color:wheat; white-space:nowrap; float:left;">
       <div data-text-content="true" style="background-color:dimgray; 
      text-align: center; font-size: 17px;" class=""><span style="color:white">날짜</span></div></br>
          <h2 id="monthText" style="text-align:center"></h2>
          <form name="form3">
     
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

		<div id="chkBox">
      <c:forEach var="menu" items="${article.menuList}" varStatus="status">
      <label>
      	<input type="checkbox" name="bk_menu" id="bk_menu" value="${menu.menu_nm1}/${menu.menu_nm1_sal}">
      	${menu.menu_nm1} : ${menu.menu_nm1_sal}원</label><br>
      </c:forEach>
      </div>
      
       <div data-obj-id="yZe8J" data-obj-type="element"
         data-text-editable="true" class=""
          top: 287px; left: 480px; width: 82px; height: 23px;">
         <div data-text-content="true"
            style="background-color:dimgray; text-align: center; font-size: 17px;"
            class=""><span style="color:white">예약인원</span></div>   
      <label>예약 인원수</label>
                <select name="bk_cnt" id="bk_cnt" style="width:100px; height:30px;">
             
                </select>
                
      <div data-obj-id="yZe8J" data-obj-type="element"
         data-text-editable="true" class=""
          top: 287px; left: 480px; width: 82px; height: 23px;">
         <div data-text-content="true"
            style="background-color:dimgray; text-align: center; font-size: 17px;"
            class=""><span style="color:white">예약테이블</span></div>
            <div data-text-content="true"
            style="background-color:dimgray; text-align: center; font-size: 17px;"
            class=""><span style="color:white">최대 4인기준 1개 테이블입니다.</span></div>
      <label>예약 테이블</label>
                <select name="bk_tbl_cnt" id="bk_tbl_cnt" style="width:100px; height:30px;">
             
                </select>
      
      
      <div id="reserve">
      <button type="submit" class="cancellation" >취소</button>
      <button type="submit" class="reservation" data-target="#modal" data-toggle="modal">예약</button>
   

   	
      </div>
      </div>
   </div>
   </c:forEach>
  <form action="./reserveInsert.do">
 <c:forEach var="article" items="${articleList}">
	   <input type="hidden" value="${article.store_octime }" name="oTime" />
	   <input type="hidden" value="${article.avl_tbl_cnt }" name="avl_tbl_cnt" />
	   <input type="hidden" value="${article.store_nm }" name="store_nm" />
	   <input type="hidden" value="${article.store_no }" name="store_no" />
	   
	   
   <div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="modar" aria-hidden="true"> 
  <div class="modal-dialog modal-lg"> 
    <div class="modal-content"> 
      <div class="modal-header"> 
       <div class="row">
          <div class="col-lg-12">
            <button class="close" data-dismiss="modal">&times;</button>
            
          <div class="row">
          <div class="col-lg-12">
             <div class="page-header bordered" >
              <h1>${article.store_nm }<small>예약정보</small></h1>
              </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
              <h2 class="subheadline">매장주소</h2>
              <input type="text" id="store_plc" name="store_plc"class="form-control form-control-lg" placeholder="" value="${article.store_plc }">
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3">
            <div class="form-group">
              <label><h5 style="padding-top: 15px";> 이름</h5></label>
                <input type="text" id="useName" name="mem_nm"class="form-control form-control-lg" placeholder="" value="이수근">
            </div>
          </div>
           <div class="col-lg-3">
            <div class="form-group">
              <label><h5 style="padding-top: 15px";>예약테이블수</h5></label>
              <input type="text" id="useTbl" name="bk_tbl_cnt"class="form-control form-control-lg" placeholder="" value="1개">
             </div>
           </div>
          <div class="col-lg-3">
            <div class="form-group">
              <label><h5 style="padding-top: 15px";>예약 인원수</h5></label>
              <input type="text" id="useCnt" name="bk_cnt" class="form-control form-control-lg" placeholder="" value="1명">
             </div>
           </div>
          <div class="col-lg-3">
            <div class="form-group">
              <label><h5 style="padding-top: 15px";>매장 전화번호</h5></label>
              <input type="text" id="store_tel" name="store_tel"class="form-control form-control-lg" placeholder="" value="${article.store_tel }">
             </div>
           </div>
           
         </div>
         <div class="row">
           <div class="col-md-6">
             <div class="form-group">
               <label><h5>예약 날짜 및 이용시간</h5></label>
                 <input id="bk_date" name="bk_date" type="text" class="form-control form-control-lg" placeholder="" value="3월19일 12:00">
             </div>
           </div>
           <div class="col-md-6">
             <div class="form-group">
               <label><h5>예약음식 총 가격</h5></label>
               <input type="text"  id="menuSum" name="bk_pri_sum"class="form-control form-control-lg" placeholder="" value="50,000원">
             </div>
           </div>
         </div>
         <div class="row">
           <div class="col-md-12">
             <div class="form-group">
               <label><h5>예약주문한 음식메뉴</h5></label>
               <textarea id="menuName" name="bk_menu"class="form-control form-control-lg text-editor" placeholder=""></textarea>
             </div>
           </div>
         </div>
         <hr>
           <div class="form-group action">
           <button type="submit" class="btn btn-lg btn-primary" >예약하기</button>
         </div>
          <div class="form-group action">
           <button class="btn btn-lg btn-primary" style="width: 114px;" data-dismiss="modal" >취소</button>
         </div>
      </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </c:forEach>
  </form>
</div>
   
   
<%-- </c:forEach>
 --%>

</body>
</html>