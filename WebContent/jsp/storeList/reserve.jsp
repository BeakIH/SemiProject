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

//자기자신창을 닫습니다.
function javascript(){
    self.close(); 
}



</script>


<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>밥은 먹고 다니니</title>

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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
$( document ).ready(function() {
	
//예약메뉴 체크여부 이벤트
  /* $('#submit_button').click(function() {
  if (!$("input[name='bk_menu']:checked").val()) {
  	alert('Nothing is checked!');
	return false;
  }
  else {
  alert('One of the radio buttons is checked!');
  }
  }); */
  
 	//라디오버튼 체크여부 이벤트
	  $('#submit_button').click(function() {
	    if (!$("input[name='chk1']:checked").val()) {
	       alert('예약 날짜를 선택해주세요.');
	        return false;
	    }
	    else {
	   
	    }
	  });
  
 	$('#submit_button').click(function() {
	    if (!$("input[name='chk2']:checked").val()) {
	       alert('예약시간을 선택해주세요.');
	        return false;
	    }
	    else {
	     
	    }
	  });
 
	//셀렉트박스 체크여부 이벤트
 	$('#submit_button').click(function() {
	if(!$('#bk_tbl_cnt > option:selected').val()) {
    alert("테이블수를 선택해주세요.");
    	return false;
	}else{
		
	}
	});
	//인원수 셀렉트박스 체크여부 이벤트
 	$('#submit_button').click(function() {
 		if(!$('#bk_cnt > option:selected').val()) {
 	    alert("인원수를 선택해주세요.");
 	    	return false;
 		}else{
 			
 		}
 		});
	
 	/* 날짜  */
 	 var a = new Date();
 	 var b = [];
 	 var c = a.getMonth()+1;
 	 
 	 var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
 	 
 	 var d = new Date();
 	 d.setDate(d.getDate()+1);
 	 $('#monthText').html((d.getMonth()+1) + "월");
 	 
 	 if(d.getMonth() * 1 != c){
 	      for(var i = a.getDate()+1; i <= 31; i++){
 	       a.setDate(a.getDate()+1);
 	       if(a.getMonth() == c) break;
 	       b.push(new Date(a.getFullYear() + "-" + (a.getMonth()+1) + "-" + i));
 	      
 	       }
 	 }else{
 	    for(var i = 1; i <= 31; i++){
 	       a.setDate(a.getDate()+1);
 	       if(a.getMonth() == (c + 1)) break;
 	       b.push(new Date(a.getFullYear() + "-" + (a.getMonth()+1) + "-" + i));
 	       }
 	 }

 	    
 	 var from3_text = "";
 	 for(var i = 0; i < b.length; i++){
 	    var d = b[i].getDay();
 	    var e = b[i].getFullYear() + "-" + (b[i].getMonth()+1) + "-" + b[i].getDate();
 	    if(b[i].getDay() == 0) from3_text = from3_text + "<label><input type='radio' style='width:35px;' value='" + e + "' name='chk1' /><span style='color:red; font-weight:bold; font-size: 16px;'>" + b[i].getDate() + "일 " + week[b[i].getDay()] + "</span></label><br />";
 	    else if(b[i].getDay() == 6) from3_text = from3_text + "<label><input type='radio' style='width:35px;' value='" + e + "' name='chk1' /><span style='color:blue; font-weight:bold; font-size: 16px;'>" + b[i].getDate() + "일 " + week[b[i].getDay()] + "</span></label><br />";
 	    else from3_text = from3_text + "<label><input type='radio' style='width:35px;' value='" + e + "' name='chk1' /><span style='font-weight:bold; font-size: 16px;'>" + b[i].getDate() + "일 " + week[b[i].getDay()] + "</span></label><br />";
 	    
 	 }
 //div id로 바꾸고 이름정해주기
 $('form[name="form3"]').html(from3_text);

 /* 시간 */
 var from2_text = "";
 var sto_open_Time = $('#oTime').val().split(" ~ ")[0];
 var sto_close_Time = $('#oTime').val().split(" ~ ")[1];
 
 for(var i = sto_open_Time.split(":")[0] * 1 + 1; i <= sto_close_Time.split(":")[0] * 1 - 1; i++){
	 if(i < 10) from2_text = from2_text + "<label><input type='radio' style='text-align:center;width: 35px;' value='0" + i + ":00' name='chk2' /><span style='font-weight:bold; font-size: 16px;'>0" + i + ":00</span></label><br />"; 
	 else from2_text = from2_text + "<label><input type='radio' style='text-align:center; width: 35px;' value='" + i + ":00' name='chk2' /><span style='font-weight:bold; font-size: 16px;'>" + i + ":00</span></label><br />"; 
 }
 
 $('form[name="form2"]').html(from2_text);
 
 
 /* 인원 수 */
 var avl = $('#avl_tbl_cnt').val() * 4;
 $('#bk_cnt').html('');
 for(var i = 1; i <= avl -5*4; i++){
 	$('#bk_cnt').append('<option value="' + i + '">' + i + '인</option>');
 	if(i == 20) break;
 }
 
 /* 테이블 수 */
 var avl_tbl_cnt = $('#avl_tbl_cnt').val();
 $('#bk_tbl_cnt').html('');
 for(var i = 1; i <= avl_tbl_cnt-5; i++){
	 	$('#bk_tbl_cnt').append('<option value="' + i + '">' + i + '개 테이블</option>');
	 	if(i == 5) break;
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
 
/* 	$('#chkBox').children('label').find('#bk_menu').bind('click',function(){ */

  
 /* 인원 수 이벤트 */
 var useCnt = 1;
 $('#useCnt').val(useCnt);
 
 $('#bk_cnt').bind('change',function(i){
	 var data = $(i)[0].target;
	 $('#useCnt').val($(data).val()*1);
 });
 
 useTbl
 
 /* 테이블수 이벤트*/
 
  var useTbl = 1;
 $('#useTbl').val(useTbl);
 
 $('#bk_tbl_cnt').bind('change',function(i){
	 var data = $(i)[0].target;
	 $('#useTbl').val($(data).val() * 1);
 });
 /* 숫자 콤마 찍기 이벤트*/
 /* function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
 
//콤마풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
 
//값 입력시 콤마찍기
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
<input type="text" onkeyup="inputNumberFormat(this)" /> */
 
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
 				/* alert($(item).val()); */
 				if(menuName == "") menuName = $(item).val().split("/")[0];
 				else menuName = menuName + "\n " + $(item).val().split("/")[0];
 				menuSumTemp = menuSumTemp * 1 + $(item).val().split("/")[1] * 1;
 				/* alert(menuSumTemp); */
 			}
 		});
 		$('#menuName').html(menuName);
 	 	$('#menuSum').val(menuSumTemp * 1);
 	});
});
//수량 이벤트
/* $(function(){ 
	  $('.bt_up').click(function(){ 
	    var n = $('.bt_up').index(this);
	    var num = $(".num:eq("+n+")").val();
	    num = $(".num:eq("+n+")").val(num*1+1); 
	  });
	  $('.bt_down').click(function(){ 
	    var n = $('.bt_down').index(this);
	    var num = $(".num:eq("+n+")").val();
	    num = $(".num:eq("+n+")").val(num*1-1); 
	  });
	}) 
 */
</script>
</head>
<body>


<h1 class="maintext">예약 신청 하기</h1>
	 <c:forEach var="article" items="${articleList}">
	   <input type="hidden" value="${article.store_exp }" id="oTime" />
	   <input type="hidden" value="${article.avl_tbl_cnt }" id="avl_tbl_cnt" />
      <div style="overflow:scroll; width:350px; height:600px; padding:10px; background-color:#f5f5f5; white-space:nowrap; float:left;">
      <div data-obj-id="yZe8J" data-obj-type="element"
         data-text-editable="true" class=""
          top: 287px; left: 480px; width: 82px; height: 23px;">
          <!-- 메뉴바 컬러 기존 꺼  #563d7c  -->
         <div data-text-content="true"
            style="background-color:#FFBB00; text-align: center; font-size: 17px;"
            class=""><span style="color:white; font-weight: bold">매장명</span></div>
                
      <form name="form1">
      
    <input type="hidden"><h1 name="store_nm"style="text-align:center; font-size:45px; padding-top: 25px;" >${article.store_nm}</h1><br/>
       
      </form>
   
         
         </div>
         </div>
         

      
      
      <div style="overflow:scroll; width:180px; height:600px; padding:10px; background-color:#f5f5f5; white-space:nowrap; float:left;">
       <div data-text-content="true" style="background-color:#FFBB00; 
      text-align: center; font-size: 17px;" class=""><span style="color:white;font-weight: bold">날짜</span></div></br>
          <h2 id="monthText" style="text-align:center"></h2>
          <form name="form3">
     
          </form>
      

   </div>
    <div style="overflow:scroll; width:150px; height:600px; padding:10px; background-color:#f5f5f5; white-space:nowrap; float:left;">
      <div data-obj-id="1mWAj" data-obj-type="element"
         data-text-editable="true" class=""
         top: 499px; left: 305px; width: 82px; height: 23px;">
      <div data-text-content="true"
         style="background-color: #FFBB00; text-align: center; font-size: 17px;"
         class=""><span style="color:white;font-weight: bold">이용시간</span></div>
            </div>
            
            <form name="form2">
          
            </form>
      </div>
      
      
       <div style="overflow:scroll; width:350px; height:600px; padding:10px; background-color:#f5f5f5; white-space:nowrap; float:left;">
       <div data-obj-id="yZe8J" data-obj-type="element"
         data-text-editable="true" class=""
          top: 287px; left: 480px; width: 82px; height: 23px;">
         <div data-text-content="true"
            style="background-color:#FFBB00; text-align: center; font-size: 17px;"
            class=""><span style="color:white;font-weight: bold">미리주문</span></div>
         </div>
   
        
		<div id="chkBox">
      <c:forEach var="menu" items="${article.menuList}" varStatus="status">
      <label>
      	<input type="checkbox" name="bk_menu" id="bk_menu" value="${menu.menu_nm}/${menu.menu_price}">
      	<span style="font-weight: bold;font-size:16px;" >${menu.menu_nm} : ${menu.menu_price}원</span></label><br>
      </c:forEach>
      
       <div data-obj-id="yZe8J" data-obj-type="element"
         data-text-editable="true" class=""
          top: 287px; left: 480px; width: 82px; height: 23px;">
         <div data-text-content="true"
            style="background-color:#FFBB00; text-align: center; font-size: 17px;"
            class=""><span style="color:white;font-weight: bold">예약인원</span></div>   
      <label><span style='font-weight:bold; font-size: 16px;'>예약 인원수</span></label>
                <select name="bk_cnt" id="bk_cnt" style="width:100px; height:30px; font-weight:bold; font-size: 16px;">
             
                </select>
                
      <div data-obj-id="yZe8J" data-obj-type="element"
         data-text-editable="true" class=""
          top: 287px; left: 480px; width: 82px; height: 23px;">
         <div data-text-content="true"
            style="background-color:#FFBB00; text-align: center; font-size: 17px;"
            class=""><span style="color:white;font-weight: bold">예약테이블</span></div>
            <div data-text-content="true"
            style="background-color:#563d7c; text-align: center; font-size: 17px;"
            class=""><span style="color:white;font-weight: bold">최대 4인기준 1개 테이블입니다.</span></div>
      <label><span style='font-weight:bold; font-size: 16px;'>예약 테이블</span></label>
                <select name="bk_tbl_cnt" id="bk_tbl_cnt" style="width:120px; height:30px; font-weight:bold; font-size: 16px;">
                </select>
      
      
      <!--  <div id="reserve">
      <button type="submit" class="btn btn-lg btn-primary"onclick='javascript()' style="width: 100px;height: 48px;margin-left: 103px;margin-top: 15px; ">취소</button>
      <button type="submit" id="submit_button" class="btn btn-lg btn-primary" style="width: 100px;height: 48px;margin-top: 15px;"data-target="#modal" data-toggle="modal">다음</button>
       
   </div> -->
      <div class="row justify-content-md-center" style="margin-top: 30px;margin-left: 130px;" >
				<button class="btn btn-danger" onclick='javascript()' data-dismiss="modal" style="margin-right: 20px;">취소<i class="fa fa-times spaceLeft"></i></button>
		
	 	   
	 	   
		
		
			<button type="submit" id="submit_button" class="btn btn-warning" style="background:#1DDB16; border-color: #1DDB16; color:white;" 
			data-target="#modal" data-toggle="modal"><font color="#47C83E"></font>다음<i class="fa fa-check spaceLeft"></i></button>
		   </disv> 
		   
   
   
  
   </div>
   </div>
   </c:forEach>
   
  
  <form action="./reserveInsert.do" method="get">
  
 <c:forEach var="article" items="${articleList}" >
	   <input type="hidden" value="${article.store_exp }" name="oTime" />
	   <input type="hidden" value="${article.avl_tbl_cnt }" name="avl_tbl_cnt" />
	   <input type="hidden" value="${article.store_nm }" name="store_nm" />
	   <input type="hidden" value="${article.store_no }" name="store_no" />
	   <input type="hidden" value="${article.emp_no }" name="emp_no" />
	   
   <div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="modar" aria-hidden="true" data-backdrop="static" data-keyboard="false"> 
  <div class="modal-dialog modal-lg"> 
    <div class="modal-content"> 
      <div class="modal-header" style="max-width:550px;"> 
      <div class="row">
          <div class="col-lg-12">
           <!--  <button class="close" data-dismiss="modal">&times;</button> -->
            
          <div class="row">
          <div class="col-lg-12">
             <div class="page-header bordered" >
              <div style="background-color: #FFBB00; text-align: center; font-size: 17px;"
         class=""><label><h2 style="padding-top: 15px; color:white; font-weight: bold">예약 신청 결과</h2></label></div>
             
             
              <%-- <h1>${article.store_nm }<small>예약정보</small></h1> --%>
              </div>
            </div>
        </div>
        
        <!-- 매장명 -->
        <div class="row">
            <div class="col-lg-4">
          	<div style="margin-bottom: 12px; max-height :48.5px; background-color: white; text-align: center; font-size: 17px;" class="">
          	<label><h5 style="padding-top: 15px; color:black; font-weight: bold">매장명</h5></label>
          	</div>
        </div>
        <br>
        <br>
        <div class="col-lg-8">
        <input type="text" id="store_nm" name="store_nm" class="form-control form-control-lg" style="text-align: center;" placeholder="" value="${article.store_nm}">
        </div>
        </div>
        <!-- 예약자명 -->
        <!-- 히든값 -->
	   	   <c:forEach var="article2" items="${articleList2}">
	   	    <input type="hidden" value="${article2.mem_no }" name="mem_no" />
	   	    <input type="hidden" value="${article2.mem_tel }" name="mem_tel" />
	   	    
   		   <!-- 히든값 -->
        <div class="row">
            <div class="col-lg-4">
          	<div style="margin-bottom: 12px; max-height :48.5px; background-color:white; text-align: center; font-size: 17px;" class="">
          	<label><h5 style="padding-top: 15px; color:black; font-weight: bold">예약자 성함</h5></label>
          	</div>
        </div>
        <div class="col-lg-8">
        <input type="text" id="mem_nm" name="mem_nm" class="form-control form-control-lg" style="text-align: center;" placeholder="" value="${article2.mem_nm}">
        </div>
        </div>
        </c:forEach>
        <!-- 이용시간 -->
        <div class="row">
            <div class="col-lg-4">
          	<div style="margin-bottom: 12px; max-height :48.5px; background-color: white; text-align: center; font-size: 17px;" class="">
          	<label><h5 style="padding-top: 15px; color:black; font-weight: bold">이용시간</h5></label>
          	</div>
        </div>
        <div class="col-lg-8">
        <input type="text" id="bk_date" name="bk_date" class="form-control form-control-lg" style="text-align: center;" placeholder="" value="">
        </div>
        </div>
        <!-- 예약테이블수 -->
        <div class="row">
            <div class="col-lg-4">
          	<div style="margin-bottom: 12px; max-height :48.5px; background-color: white; text-align: center; font-size: 17px;" class="">
          	<label><h5 style="padding-top: 15px; color:black; font-weight: bold">예약테이블수</h5></label>
          	</div>
        </div>
        <div class="col-lg-8">
        <input type="text" id="useTbl" name="bk_tbl_cnt" class="form-control form-control-lg" style="text-align: center;" placeholder="" value="">
        </div>
        </div>
        <!-- 예약인원수 -->
        <div class="row">
            <div class="col-lg-4">
          	<div style="margin-bottom: 12px; max-height :48.5px; background-color: white; text-align: center; font-size: 17px;" class="">
          	<label><h5 style="padding-top: 15px; color:black; font-weight: bold">예약인원수</h5></label>
          	</div>
        </div>
        <div class="col-lg-8">
        <input type="text" id="useCnt" name="bk_cnt" class="form-control form-control-lg" style="text-align: center;" placeholder="" value="">
        </div>
        </div>
        <!-- 매장전화번호 -->
        <div class="row">
            <div class="col-lg-4">
          	<div style="margin-bottom: 12px; max-height :48.5px; background-color: white; text-align: center; font-size: 17px;" class="">
          	<label><h5 style="padding-top: 15px; color:black; font-weight: bold">매장전화번호</h5></label>
          	</div>
        </div>
        <div class="col-lg-8">
        <input type="text" id="store_tel" name="store_tel" class="form-control form-control-lg" style="text-align: center;" placeholder="" value="${article.store_tel}">
        </div>
        </div>
        <!-- 주문한 메뉴 -->
        <div class="row">
            <div class="col-lg-4">
          	<div style="margin-bottom: 12px; max-height :48.5px; background-color: white; text-align: center ; font-size: 17px;" class="">
          	<label><h5 style="padding-top: 15px; color:black; font-weight: bold">주문한 메뉴</h5></label>
          	</div>
        </div>
        <div class="col-lg-8">
        	<textarea id="menuName" name="bk_menu"class="form-control form-control-lg text-editor" style="text-align: center; height: 125px; "placeholder=""></textarea>
        </div>
        </div>
        <!-- 분리 라인 -->
        <div class="row">
        <div class="col-md-12">
        <div class="page-header bordered" style="margin-top: 0px;">
        </div>
        </div>
        </div>
        <!-- 총가격 -->
        <div class="row">
         <div class="col-md-12">
       
             <div class="form-group">
             <div style="background-color: #FFBB00; text-align: center; font-size: 17px;"
         class=""><label><h5 style="padding-top: 15px; color:white; font-weight: bold">예약음식 총 가격</h5></label></div>
              
               <!-- <label><h5>예약음식 총 가격</h5></label> -->
               
               <input type="text"  id="menuSum" name="bk_pri_sum"class="form-control form-control-lg" style="text-align: center;" placeholder="" value="50,000원">
             </div>
           </div>
          
         </div>
        <div class="row">
         <div class="col-md-6">
           <div class="row justify-content-md-center" style="margin-right: 15px; padding-left:50%"  >
				<button class="btn btn-danger" data-dismiss="modal" >예약신청취소<i class="fa fa-times spaceLeft"></i></button>
		   </div>
	 	</div>
				
		 <div class="col-md-6">
		 <div class="row justify-content-md-center" style="padding-right:50%">
			<button type="submit" class="btn btn-warning" style="background:#1DDB16; border-color: #1DDB16; color:white;"><font color="#800080"></font>예약신청하기<i class="fa fa-check spaceLeft"></i></button>
		</div>
		 </div>
	   </div>
      </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </c:forEach>
  </form>

   

</body>
</html>