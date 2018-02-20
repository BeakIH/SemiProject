<%@ page contentType="text/html; charset=UTF-8"%>

<!-- jsp 설정들  ============== list.jsp 참조 -->
<%@ page import="list.ListDBBean"%>
<%@ page import="list.ListDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- jsp 설정들  ============== -->


<!DOCTYPE html>
<html lang="en">
<!-- 언어 설정 -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Real Estate</title>

<!-- Bootstrap -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans"
	rel="stylesheet" />
<link href="../../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../../lib/animate.css" rel="stylesheet">
<link href="../../lib/selectric/selectric.css" rel="stylesheet">
<link href="../../lib/aos/aos.css" rel="stylesheet">
<link href="../../lib/Magnific-Popup/magnific-popup.css"
	rel="stylesheet">
<link href="../../css/style.css" rel="stylesheet">

<!-- 내가 추가한 css, 나중에 바꿔야함 -->
<!-- <link href="./style.css" rel="stylesheet"> -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../lib/jquery-3.2.1.min.js"></script>
<script src="../../lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../lib/selectric/jquery.selectric.js"></script>
<script src="../../lib/aos/aos.js"></script>
<script src="../../lib/Magnific-Popup/jquery.magnific-popup.min.js"></script>
<script src="../../lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="../../lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="../../lib/sidr/jquery.sidr.min.js"></script>
<script src="../../lib/lib.js"></script>


<!-- 나중에 아래쪽 script 문 따로 .js 파일 생성해서 정리해야함 -->
<script>

/* 검색창 카테고리 변경시 placeholder 변경 */
$(function(){
	$('.form-group select#mCategory').change(function(){
		/* alert('변경'); */
		/* alert($(this).val()); */
		if(($(this).val()) == 0){// 카테고리 음식
			$('.form-group input#cCategory').attr("placeholder","ex) 자장면, 김치찌개, 파스타").placeholder();
		}else if(($(this).val()) == 1){// 카테고리 가게
			$('.form-group input#cCategory').attr("placeholder","ex) 엘본 더 테이블, 경화루, 가온").placeholder();
		}else if(($(this).val()) == 2){// 카테고리 지역
			$('.form-group input#cCategory').attr("placeholder","ex) 1~5층 ( 해당 숫자만 입력하세요 )").placeholder();
		}
	});
});


/* 좌측 가격입력시 이벤트 처리 // 포커스 아웃시에 이벤트 발생  */
$(function(){
	$('.form-group input#min').change(function(){
		alert('변경');
		alert($('.form-group input#min').val());
		/* var minVal = $('.form-group input#min').val(); */
	    if($('.form-group input#max').val() == null || $('.form-group input#max').val() == ""){
	    	// max 값이 없는경우 파라미터를 min 값만 넘겨줌
	    	alert('max값이 없는 경우');
	    	$('.form-group input#max').focus();
	    }else{
	    	// max 값이 있는 경우 둘다넘겨줌
	    	alert('max값이 있는 경우');
	    	location.href='list.do?maxSal='+$('.form-group input#max').val()+'&minSal='+$('.form-group input#min').val();
	    }
	});
});

$(function(){
	$('.form-group input#max').change(function(){
		alert('변경');
		/* alert(minval); */
		/* var maxVal = $('.form-group input#max').val(); */
	    if($('.form-group input#min').val() == null || $('.form-group input#min').val() == ""){
	    	// min 값이 없는경우 파라미터를 max 값만 넘겨줌
	    	alert('min값이 없는 경우');
	    	$('.form-group input#min').focus();
	    }else{
	    	// min 값이 있는 경우 둘다넘겨줌
	    	alert('min값이 있는 경우');
	    	location.href='list.do?maxSal='+$('.form-group input#max').val()+'&minSal='+$('.form-group input#min').val();
	    }
	});
});

/* 숫자만 입력받음 */

function numCheck(event){
	event.target.value =  event.target.value.replace(/[^0-9]/g, '');
}


/* 체크박스 선택시 이벤트 // 중복선택시 계속해서 파라미터 추가  혹은 한번씩만 선택가능하게  */

<%-- $(document).ready(function(){ // 아래쪽 펑션에서 페이지 리다이렉트되면 체크박스의 상태값이 초기화되므로 해당 상태값을 유지하기위함
	/* alert($(".checkbox input").val()); */ // <= 이 값이 항상 0 이기 때문에 
	alert(<%=iCateName%>); // 값 받아와짐 ,,, int 타입 1~3
	alert(<%=cateName%>); // 값 받아와짐 ,,, String 타입 1~3 
 	
	// 자바스크립트이므로 문자열 비교도 ==
	if( ($(".checkbox input").val())==<%=cateName%> ){ 
		alert('확인');
		$(this).attr("checked", true);
	}
}); --%>

$(document).ready(function(){
	$('input:checkbox[name="CATE_NM"]').each(function(){
		if(this.value == "${cateName}"){
			this.checked = true;
		}
	});
});

$(function(){
	$(".checkbox#food input").click(function() { 
		/* alert($(this).val()); */
		
		// 이부분은 필요없음 (어차피 리다이렉트처리되기때문 )//////
		$(".checkbox#food input").attr("checked", false); // 모든 대상의 체크를 해제
		$(this).attr("checked", true); // 클릭한 대상만 체크
		//////////////////////
		 
		$(this).val();
		location.href='list.do?cate_nm='+$(this).val();
});

$(function() { 
	$('input[type="checkbox"]').bind('click',function() { 
		$('input[type="checkbox"]').not(this).prop("checked", false); 
		});
});

// 층별 이벤트 // 아래되면 여기수정 (cateName 말고 다른 파라미터로)
$(document).ready(function(){
	$('input:checkbox[name="search"]').each(function(){
		if(this.value == "${search}"){
			this.checked = true;
		}
	});
});

// 여기먼저
$(function(){
	$(".checkbox#floor input").click(function() { 
		
		// 이부분은 필요없음 (어차피 리다이렉트처리되기때문 )//////
		$(".checkbox input").attr("checked", false); // 모든 대상의 체크를 해제
		$(this).attr("checked", true); // 클릭한 대상만 체크
		//////////////////////
		
		$(this).val();
		location.href='list.do?searchn=2&search='+$(this).val();
	});
});

$(function() { 
	$('input[type="checkbox"]').bind('click',function() { 
		$('input[type="checkbox"]').not(this).prop("checked", false); 
		});
}); 




/* // 검색시 해당 선택옵션값 표시해주기
$(document).ready(function(){
	alert('기능확인');
	function getHttpParam(name) {
	    var regexS = "[\\?&]" + name + "=([^&#]*)";
	    var regex = new RegExp(regexS);
	    var results = regex.exec(window.location.href);
	    if (results == null) {
	        return 3;
	    } else {
	        return results[1];
	    }
	}
	
	var str = getHttpParam("searchn");
	alert(str);
	alert($('.a').val());
	if($('.a').val()== str){
		alert('확인')
		$('.a').prop("selected", true);
		$('.form-group select#mCategory option').attr("selected", selected);
	}  
 	if(str==0){
 		alert('음식확인');
 		$('#main > div:nth-child(2) > form > div > div > div > div:nth-child(2) > div > div.col-sm-7 > div > div > div.selectric-items > div > ul > li:nth-child(3)').attr("selected","selected");
	}else if(str==1){
		alert('가게확인');
		$('#st').attr("selected","selected");   
	}else if(str==2){
		alert('지역확인');
		$('#lc').attr("selected","selected");
	}
	
	// str = 1 이면 ~ 
	 $(document).ready(function(){
		alert('확인');
		$('.a').each(function(){ // each 반복함수
			if($('.a').value == str){
				$('.a').selected = true;
			}
		});
	}); 
	// option 값이 파라미터로 받은 search 값이면 해당
}); */


/* function floorSelect(){
    // 사용자 ID를 갖고 온다.
    var userId = $("#userId").val();
 
    // name이 같은 체크박스의 값들을 배열에 담는다.
    var checkboxValues = [];
    $("input[name='hobby']:checked").each(function(i) {
        checkboxValues.push($(this).val());
    });
     
    // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
    var allData = { "userId": userId, "checkArray": checkboxValues };
     
    $.ajax({
        url:"goUrl.do",
        type:'GET',
        data: allData,
        success:function(data){
            alert("완료!");
            window.opener.location.reload();
            self.close();
        },
        error:function(jqXHR, textStatus, errorThrown){
            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
            self.close();
        }
    });
} */

/* function floorSelect(){
	var lists = [];
	  $("input[name='search']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
	   lists.push($(this).val());
	  });
	  
	  jQuery.ajax({type:"POST", 
	   data:{'search':lists, 'searchn':2},
	   url:"jsp/storeList/list.jsp", 
	   contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
	   cache: false, 
	   success:function(data) { }
	  });
} */
</script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div id="main">
		<nav class="navbar navbar-expand-lg navbar-dark" id="menu">
			<div class="container">
				<a class="navbar-brand" href="index.html"><span
					class="icon-uilove-realestate"></span></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#menu-content" aria-controls="menu-content"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="menu-content">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Home <span class="sr-only">(current)</span>
						</a>
							<div class="dropdown-menu">
								<a href="index.html" class="dropdown-item">Homepage 1</a> <a
									href="index2.html" class="dropdown-item">Homepage 2</a> <a
									href="index3.html" class="dropdown-item">Homepage 3</a> <a
									href="index4.html" class="dropdown-item">Homepage 4</a> <a
									href="index5.html" class="dropdown-item">Homepage 5</a> <a
									href="index6.html" class="dropdown-item">Homepage 6</a> <a
									href="main.do" class="dropdown-item">메인페이지</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Listings </a>
							<div class="dropdown-menu">
								<a href="list.do" class="dropdown-item">목록보기</a> <a
									href="property_grid.html" class="dropdown-item">Grid View</a> <a
									href="property_listing_map.html" class="dropdown-item">Map
									View</a> <a href="property_single.html" class="dropdown-item">Single
									View 1</a> <a href="property_single2.html" class="dropdown-item">Single
									View 2</a> <a href="property_single3.html" class="dropdown-item">Single
									View 3</a>
							</div></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Agents </a>
							<div class="dropdown-menu">
								<a href="agent_list.html" class="dropdown-item">Agent List</a> <a
									href="agent.html" class="dropdown-item">Agent Profile</a>
							</div></li>

						<li class="nav-item dropdown megamenu"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Pages </a>
							<div class="dropdown-menu">
								<div class="container">
									<div class="row justify-content-md-center">
										<div class="col col-md-8">
											<div class="row">
												<div class="col-md-6 col-lg-3">
													<ul class="list-unstyled">
														<li class="title">Homepage</li>
														<li><a href="index.html">Homepage 1</a></li>
														<li><a href="index2.html">Homepage 2</a></li>
														<li><a href="index3.html">Homepage 3</a></li>
														<li><a href="index4.html">Homepage 4</a></li>
														<li><a href="index5.html">Homepage 5</a></li>
														<li><a href="index6.html">Homepage 6</a></li>
														<li><a href="main.do">메인페이지</a></li>
														<li class="title">Login Pages</li>
														<li><a href="signin.html">Signin</a></li>
														<li><a href="register.html">Register</a></li>
														<li><a href="forgot-password.html">Forgot
																Password</a></li>
													</ul>
												</div>
												<div class="col-md-6 col-lg-3">
													<ul class="list-unstyled">
														<li class="title">Property Listing</li>
														<li><a href="list.do">목록보기</a></li>
														<li><a href="property_grid.html">Grid View</a></li>
														<li><a href="property_listing_map.html">Map View</a></li>
														<li class="title">Single Property</li>
														<li><a href="property_single.html">Single View 1</a></li>
														<li><a href="property_single2.html">Single View 2</a></li>
														<li><a href="property_single3.html">Single View 3</a></li>
													</ul>
												</div>
												<div class="col-md-6 col-lg-3">
													<ul class="list-unstyled">
														<li class="title">Other Pages</li>
														<li><a href="plans.html">Plans</a></li>
														<li><a href="information_page.html">Information
																Page</a></li>
														<li><a href="coming_soon.html">Coming Soon</a></li>
														<li><a href="404_error.html">Error Page</a></li>
														<li><a href="success.html">Success Page</a></li>
														<li><a href="contact.html">Contact Page</a></li>
														<li><a href="compare.html">Compare Properties</a></li>
														<li class="title">Agent Pages</li>
														<li><a href="agent_list.html">Agent List</a></li>
														<li><a href="agent.html">Agent Profile</a></li>
													</ul>
												</div>
												<div class="col-md-6 col-lg-3">
													<ul class="list-unstyled">
														<li class="title">Account Pages</li>
														<li><a href="my_listing_add.html">Add Listing</a></li>
														<li><a href="my_bookmarked_listings.html">Bookmarked
																Listing</a></li>
														<li><a href="my_listings.html">My Listings</a></li>
														<li><a href="my_profile.html">My Profile</a></li>
														<li><a href="my_password.html">Change Password</a></li>
														<li><a href="my_notifications.html">Notifications</a></li>
														<li><a href="my_membership.html">Membership</a></li>
														<li><a href="my_payments.html">Payments</a></li>
														<li><a href="my_account.html">Account</a></li>
														<li class="title">Blog Pages</li>
														<li><a href="blog.html">Blog Archive</a></li>
														<li><a href="blog_single.html">Blog Single</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div></li>

					</ul>

					<ul class="navbar-nav ml-auto">


						<li class="nav-item dropdown user-account"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="user-image"
								style="background-image: url(' img/demo/profile3.jpg');"></span>
								Hi, John
						</a>
							<div class="dropdown-menu">
								<a href="my_profile.html" class="dropdown-item">My Profile</a> <a
									href="my_password.html" class="dropdown-item">Change
									Password</a> <a href="my_notifications.html" class="dropdown-item">Notifications</a>
								<a href="my_membership.html" class="dropdown-item">Membership</a>
								<a href="my_payments.html" class="dropdown-item">Payments</a> <a
									href="my_account.html" class="dropdown-item">Account</a>
							</div></li>
						<li class="nav-item add-listing"><a class="nav-link"
							href="my_listing_add.html"><span><i class="fa fa-plus"
									aria-hidden="true"></i> Add listing</span></a></li>
					</ul>

				</div>
			</div>
		</nav>
		<div class="container">
			<form>
				<!-- 나중에 method 속성값 post로 -->
				<div class="search-form">
					<div class="card">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<input type="text" class="form-control form-control-lg"
										id="cCategory" name="search" placeholder="ex) 자장면, 김치찌개, 파스타"
										value=${search }>
									<!-- 여기 수정중  search값이 숫자인경우에는 받아오면안되거나 빈값으로 초기화-->
								</div>
							</div>
							<div class="col-lg-6">
								<div class="row">
									<div class="col-sm-7">
										<!-- 여기 폼테그 원래 자리 -->
										<div class="form-group">
											<select class="form-control form-control-lg ui-select"
												id="mCategory" name="searchn"
												data-placeholder="Property Type">
												<!-- 데이터 플레이스홀더 -->
												<option value="0" id="fd">음식명</option>
												<option value="1" id="st">가게명</option>
												<option value="2" id="lc">층별</option>
												<option value="apartment">1</option>
												<option value="land">2</option>
												<option value="room">3</option>
											</select>
										</div>
									</div>
									<div class="col-sm-5">
										<!-- 폼 테그 추가함 -->
										<div class="form-group">
											<button type="submit"
												class="btn btn-lg btn-primary btn-block">검색하기</button>
										</div>
									</div>
			</form>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col col-lg-12 col-xl-10">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="#">홈</a></li>
						<li class="breadcrumb-item"><a href="#">매장 리스트</a></li>
						<li class="breadcrumb-item active" aria-current="page">North
							Yorkshire</li>
					</ol>
				</nav>
				<div class="page-header">
					<h1>매장 리스트</h1>
				</div>
			</div>
		</div>
	</div>
	<div id="content">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col col-lg-12 col-xl-10">
					<div class="row has-sidebar">
						<div class="col-md-4 col-lg-3">
							<button id="toggle-filters"
								class="btn btn-primary btn-circle mobile-filter">
								<i class="fa fa-filter"></i>
							</button>
							<div id="sidebar" class="sidebar-left">
								<button class="close-panel btn btn-white">
									<i class="fa fa-long-arrow-left"></i>
								</button>
								<div class="sidebar_inner">
									<div id="filters">
										<!-- 금액 입력란 -->
										<div class="card">
											<div class="card-header">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse"
														data-parent="#accordion" href="#p_budget"
														aria-expanded="true" aria-controls="p_type"> 금액 <i
														class="fa fa-caret-down float-right"></i>
													</a>
												</h4>
											</div>
											<div id="p_budget" class="panel-collapse collapse"
												role="tabpanel">
												<div class="card-body">
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<input type="text" class="form-control input-sm"
																	id="min" placeholder="최소"
																	onKeydown="return numCheck(event);"
																	onkeyup="numCheck(event)" style="ime-mode: disabled">
																<!-- 최소금액  : 넣을지 안넣을지는 생각해봐야할듯-->
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<input type="text" class="form-control input-sm"
																	id="max" placeholder="최대"
																	onKeydown="return numCheck(event);"
																	onkeyup="numCheck(event)" style="ime-mode: disabled">
																<!-- 최대금액 -->
															</div>
														</div>
													</div>
													<!-- <p>원 단위로 입력해 주세요.</p> -->
												</div>
											</div>
										</div>
										<!-- 음식종류 -->
										<div class="card">
											<div class="card-header">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse"
														data-parent="#accordion" href="#p_type"
														aria-expanded="true" aria-controls="p_type"> 음식 종류 선택
														<i class="fa fa-caret-down float-right"></i>
													</a>
												</h4>
											</div>
											<div id="p_type" class="panel-collapse collapse show"
												role="tabpanel">
												<div class="card-body">
													<div class="checkbox" id="food">
														<!-- value 값으로 판별해도 괜찮고 생각해봐야할듯 -->
														<!-- CATE_NM 파라미터에 값을 넘겨줘야함  -->
														<input type="checkbox" name="CATE_NM" value="0" id="house">
														<label for="house">한식</label>
													</div>
													<div class="checkbox" id="food">
														<input type="checkbox" name="CATE_NM" value="1" id="flat">
														<label for="flat">양식</label>
													</div>
													<div class="checkbox" id="food">
														<input type="checkbox" name="CATE_NM" value="2"
															id="appartment"> <label for="appartment">중식</label>
													</div>
													<div class="checkbox" id="food">
														<input type="checkbox" name="CATE_NM" value="3" id="farms">
														<label for="farms">일식</label>
													</div>
													<div class="checkbox" id="food">
														<input type="checkbox" name="CATE_NM" value="4" id="room">
														<label for="room">예비 메뉴</label>
													</div>
												</div>
											</div>
										</div>
										<!-- 층별 -->
										<div class="card">
											<div class="card-header">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse"
														data-parent="#accordion" href="#f_type"
														aria-expanded="true" aria-controls="f_type"> 각 층별 점포보기
														<i class="fa fa-caret-down float-right"></i>
													</a>
												</h4>
											</div>
											<div id="f_type" class="panel-collapse collapse show"
												role="tabpanel">
												<div class="card-body">
													<div class="checkbox" id="floor">
														<!-- value 값으로 판별해도 괜찮고 생각해봐야할듯 -->
														<!-- CATE_NM 파라미터에 값을 넘겨줘야함  -->
														<input type="checkbox" name="search" value="1" id="1floor">
														<label for="1floor">1층</label>
													</div>
													<div class="checkbox" id="floor">
														<input type="checkbox" name="search" value="2" id="2floor">
														<label for="2floor">2층</label>
													</div>
													<div class="checkbox" id="floor">
														<input type="checkbox" name="search" value="3" id="3floor">
														<label for="3floor">3층</label>
													</div>
													<div class="checkbox" id="floor">
														<input type="checkbox" name="search" value="4" id="4floor">
														<label for="4floor">4층</label>
													</div>
													<div class="checkbox" id="floor">
														<input type="checkbox" name="search" value="5" id="room">
														<label for="room">예비 메뉴</label>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-8 col-lg-9">
							<div class="sorting">
								<div class="row justify-content-between">
									<div class="col-sm-5 col-md-5 col-lg-4 col-xl-3">
										<div class="form-group">
											<!-- 셀렉트박스 이벤트  -->
											<!-- 폼 추가 -->
											<!-- <form name="t_table" method="get" action="list.do" taget="targetFrame"> -->
											<form name="t_table" method="get" action="list.do">
												<!-- action 태그 명시안하면 자기자신에게로 보냄 -->
												<select name="sortValue" class="form-control ui-select"
													id="sort-category" onchange="this.form.submit()">
													<option selected="selected">정렬옵션</option>
													<option value="0">높은 가격순</option>
													<option value="1">낮은 가격순</option>
													<option value="2">인기순</option>
													<option value="3">잔여석순</option>
												</select>
											</form>
											<iframe id="targetFrame" name="targetFrame" width="1"
												height="1"></iframe>
										</div>
									</div>
									<div class="col-sm-6 col-md-5 col-lg-4 col-xl-3">
										<!-- 글쓰기버튼의 a 태그에 속성주기 -->
										<div class="btn-group float-right" role="group">
											<a href="writeForm.jsp"></a><a href="list.do"
												class="btn btn-light active"><i class="fa fa-bars"></i></a>
										</div>
									</div>
								</div>
							</div>
							<c:if test="${count == 0}">
								<table width="700" border="1" cellpadding="0" cellspacing="0">
									<tr>
										<td align="center">등록된 점포가 없습니다.</td>
									</tr>
								</table>
							</c:if>

							<div class="clearfix"></div>
							<c:forEach var="article" items="${articleList}">
								<div class="item-listing list">
									<div class="item" data-aos="fade-up">
										<div class="row">
											<div class="col-lg-5">
												<!-- 리스트 페이지에서 보여지는 작은 이미지 관련 html 설정 -->
												<!--이부분에 article.getStore_uri() -->
												<!-- 여기에 걸린 페이지에서 특정 파라미터를 받아서 검색하는 메서드를 실행하고 dto에 저장하고 그값을 articleList에 저장해서 리턴함-->
												<!-- 리턴받은 페이지에 내가만든 list(list) 페이지같은 기능을해서 받은 값을 뿌려주는식으로하면 틀이 하나만 있어도 가능 -->
												<!-- Store_uri 컬럼에  list_info.do 값으로 통일시켜서 넣음-->
												<div class="item-image">
													<a href="list_info.do?store_no=${article.store_no }"><img
														src=${article.simg_root } class="img-fluid" alt="">
														<div class="item-badges">
															<!-- 남은좌석이 6석 이하인 경우 -->
															<c:choose>
																<c:when test="${article.avl_tbl_cnt le 11 } ">
																	<div class="item-badge-left">예약불가</div>
																</c:when>

																<c:otherwise>
																	<!-- 남은좌석이 6석 이상인 경우 -->
																	<div class="item-badge-left">예약가능</div>
																</c:otherwise>
															</c:choose>
															<div class="item-badge-right">세일 중</div>
														</div>
														<div class="item-meta">
															<div class="item-price">${article.store_avgsal }원선
																<!-- <small>09 : 00 open / 22 : 00 close </small> -->
																<small><div>${article.store_octime }</div></small>
															</div>
														</div> </a>
													<!-- 북마크 기능 버튼  -->
													<a href="#" class="save-item"><i class="fa fa-star"></i></a>
												</div>
											</div>
											<div class="col-lg-7">
												<div class="item-info">
													<h3 class="item-title">
														<a href="property_single.html">${article.store_nm }</a>
													</h3>
													<!-- 가게명  -->
													<div class="item-location">
														<i class="fa fa-map-marker"></i>${article.store_floor }층</div>
													<!-- 위치  -->
													<div class="item-details-i">
														<span class="bedrooms" data-toggle="tooltip"
															title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span
															class="bathrooms" data-toggle="tooltip"
															title="2 Bathrooms">2 <i class="fa fa-bath"></i></span>
													</div>
													<div class="item-details">
														<ul>
															<li>전화번호 <span>${article.store_tel }</span></li>
															<li>종류 <span>${article.cate_nm }</span></li>
														</ul>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="added-on">2011년 개점</div>
														<!-- 여기에대한 칼럼 추가하거나 이 틀자체를 제외하기  -->

													</div>
													<div class="col-md-6">
														<a href="#" class="added-by">by ${article.store_owner }</a>

													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
								<!-- 목록 틀 -->
							</c:forEach>
							<!--  
            
            -->
<!-- 							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
									&laquo; = 좌각 인용부호 (<< 모양)  
									<li class="page-item active"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
								</ul>
							</nav> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact Agent Modal -->
	<div class="modal fade  item-badge-rightm" id="leadform" tabindex="-1"
		role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="media">
						<!-- 기존값 property/1.jpg -->
						<div class="media-left">
							<a href="property_single.html"><img
								src="img/demo/property/elbon.jpg" class="img-rounded" width="64"
								alt=""></a>
						</div>
						<div class="media-body">
							<h4 class="media-heading">
								Send Message for<br> <small><a
									href="property_single.html">3 bed semi-detached house for
										sale</a></small>
							</h4>
							<ul class="list-unstyled">
								<li><i class="fa fa-map-marker"></i> Kirkstone Road,
									Middlesbrough TS3</li>
								<li><a href="tel:01502392905"><i
										class="fa fa-phone fa-fw" aria-hidden="true"></i> Call: 01502
										392905</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="lead_name">Your Name</label> <input type="text"
								class="form-control" id="lead_name" placeholder="Your Name">
						</div>
						<div class="form-group">
							<label for="lead_email">Your Email</label> <input type="email"
								class="form-control" id="lead_email" placeholder="Your Email">
						</div>
						<div class="form-group">
							<label for="lead_phone">Your Telephone</label> <input type="tel"
								class="form-control" id="lead_phone"
								placeholder="Your Telephone">
						</div>
						<div class="form-group">
							<label for="lead_message">Message</label>
							<textarea rows="4" class="form-control" id="lead_message"
								placeholder="Please include any useful details, i.e. current status, availability for viewings, etc."></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-link" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary">Send Message</button>
				</div>
			</div>
		</div>
	</div>
	<button class="btn btn-primary btn-circle" id="to-top">
		<i class="fa fa-angle-up"></i>
	</button>
	<footer id="footer">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col col-md-10">
					<div class="row">
						<div class="col-md-4 col-sm-4">
							<p>
								<span class="icon-uilove-realestate"></span>
							</p>
							<address>
								<strong>Twitter, Inc.</strong><br> 1355 Market Street,
								Suite 900<br> San Francisco, CA 94103<br> <abbr
									title="Phone">P:</abbr> (123) 456-7890
							</address>
							<p class="text-muted">
								Copyright &copy; 2016<br /> All rights reserved
							</p>
						</div>
						<div class="col-md-2  col-sm-4">
							<ul class="list-unstyled">
								<li><a href="#">About</a></li>
								<li><a href="#">Team</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Plans</a></li>
							</ul>
						</div>
						<div class="col-md-2 col-sm-4">
							<ul class="list-unstyled">
								<li><a href="#">For Rent</a></li>
								<li><a href="#">For Sale</a></li>
								<li><a href="#">Commercial</a></li>
								<li><a href="#">Agents</a></li>
								<li><a href="#">Property Guides</a></li>
								<li><a href="#">Jobs</a></li>
							</ul>
						</div>
						<div class="col-md-4 col-sm-12">
							<div class="social-sharebox">
								<a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-google"></i></a> <a href="#"><i
									class="fa fa-linkedin"></i></a> <a href="#"><i
									class="fa fa-youtube-play"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a>
							</div>
							<form>
								<h4>Subscribe Newsletter</h4>
								<div class="input-group input-group-lg">
									<input type="email" class="form-control"
										placeholder="Email Address"> <span
										class="input-group-btn">
										<button class="btn btn-primary" type="button">Go!</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	</div>
	<script>
$(document).ready(function() {
$('#toggle-filters').sidr({
	side: 'left',
	displace : false,
	renaming : false,
	name: 'sidebar',
	source: function() {
	  AOS.refresh();
	},
	
});});
</script>
</body>
</html>