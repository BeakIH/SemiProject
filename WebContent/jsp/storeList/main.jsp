<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>밥은먹고다니니</title>

<!-- Bootstrap -->
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans" rel="stylesheet" />
<link href="../../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../lib/animate.css" rel="stylesheet">
<link href="../../lib/selectric/selectric.css" rel="stylesheet">
<link href="../../lib/swiper/css/swiper.min.css" rel="stylesheet">
<link href="../../lib/aos/aos.css" rel="stylesheet">
<link href="../../lib/Magnific-Popup/magnific-popup.css" rel="stylesheet">
<link href="../../css/style.css?ver=4" rel="stylesheet"> 
<link href="../../css/sidestyle.css?ver=4" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../lib/jquery-3.2.1.min.js"></script>
<script src="../../lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../lib/selectric/jquery.selectric.js"></script>
<script src="../../lib/swiper/js/swiper.min.js"></script>
<script src="../../lib/aos/aos.js"></script>
<script src="../../lib/Magnific-Popup/jquery.magnific-popup.min.js"></script>
<script src="../../lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="../../lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="../../lib/lib.js"></script>

<script>

/* 검색창 카테고리 변경시 placeholder 변경 */
$(document).ready(function(){
	$('.search-in label').click(function(){
	 	
		if(($(this).text())=="음식명으로 찾기"){// 카테고리 음식
			$('.input-group-lg>.form-control').attr("placeholder","ex) 자장면, 김치찌개, 파스타").placeholder();
		}else if(($(this).text())=="매장명으로 찾기"){// 카테고리 가게
			$('.input-group-lg>.form-control').attr("placeholder","ex) 엘본 더 테이블, 경화루, 라연").placeholder();
		}
	});
});

/* $(document).ready(function(){
	$('input:radio[name=searchn]'.click(function()){
		alert('변경');
	});
}); */

// 사이드 바 기능
/* function openNav() { // 여기에 ajax 기능 추가
    document.getElementById("mySidenav").style.width = "250px";
    alert('확인');
    location.href='sideList.do';
    // ajax
    $.ajax({
    	// 설정
    	url: "jsp/storeList/sideList.do",
		type: "get",
		data:  안넘겨줘도 실행하도록 
    	async: false,
    	// 성공시
    	success:function(data){
    		
    	}
    	// 에러시
    	error: function(xhr, textStatus, errorThrown) {
			$("div").html("<div>" + textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")</div>" );
		}
    })
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
} */
</script>

<script>
var check=0; // 사이드메뉴 열고닫는데에 사용되는 조건변수

function openNav() {// 사이드메뉴 버튼 기능
	/* alert('확인'); */
	/* location.href='sideList.do'; */
    if (check==0){
    	document.getElementById("mySidenav").style.width = "330px";
    	check+=1;
    }else{
	   	document.getElementById("mySidenav").style.width = "0";
    	check-=1;
    }
}

function closeNav() {// 사이드메뉴 버튼 눌렀을때 나오는 창의 x 버튼 기능
	document.getElementById("mySidenav").style.width = "0";
	check-=1;
}


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
<nav class="navbar navbar-expand-lg navbar-dark navbar-over absolute-top" id="menu">
  <div class="container">
  <a class="navbar-brand" href="index.html"><!-- <span class="icon-uilove-realestate"></span> -->
	 <span><img src="../../img/밥사조로고.png" alt="Smiley face" height="50" width="90"></span>
   <!-- <span><img src="../../img/밥사조4층.png" alt="Smiley face" height="30" width="60"></span> -->
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu-content" aria-controls="menu-content" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="menu-content">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       	밥사조
        <span class="sr-only">(current)</span>
        </a>
        <div class="dropdown-menu">
            <a href="main.do" class="dropdown-item">밥사조 이야기</a>
            <a href="main.do" class="dropdown-item">밥사조 식구들</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	조회
        </a>
        <div class="dropdown-menu">
            <a href="list.do" class="dropdown-item">목록보기</a>
            <!-- <a href="property_grid.html" class="dropdown-item">Grid View</a>
            <a href="property_listing_map.html" class="dropdown-item">Map View</a>
            <a href="property_single.html" class="dropdown-item">Single View 1</a>
            <a href="property_single2.html" class="dropdown-item">Single View 2</a>
            <a href="property_single3.html" class="dropdown-item">Single View 3</a> -->
        </div>
      </li>
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	매장소식
        </a>
        <div class="dropdown-menu">
            <a href="agent_list.html" class="dropdown-item">공지사항</a>
            <a href="agent.html" class="dropdown-item"> 매장별 이용후기 </a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	도움말
        </a>
        <div class="dropdown-menu">
            <a href="agent_list.html" class="dropdown-item">자주묻는 질문</a>
            <a href="agent.html" class="dropdown-item"> 1:1 문의</a>
        </div>
      </li>
      <!--
      <li class="nav-item dropdown megamenu">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Pages
        </a>
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
                  <li><a href="forgot-password.html">Forgot Password</a></li>
                 </ul>
              </div>
              <div class="col-md-6 col-lg-3">
                <ul class="list-unstyled">
                  <li class="title">Property Listing</li>
                  <li><a href="list.do">목록 보기</a></li>
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
                  <li><a href="information_page.html">Information Page</a></li>
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
                <li><a href="my_bookmarked_listings.html">Bookmarked Listing</a></li>
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
        </div>
      </li> -->
      
    </ul>
    
    <ul class="navbar-nav ml-auto">
      
      
      <!-- <li class="nav-item dropdown user-account">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="user-image" style="background-image:url(' img/demo/profile3.jpg');"></span> 로그인
        </a>
        <div class="dropdown-menu">
            <a href="my_profile.html" class="dropdown-item">My Profile</a>
            <a href="my_password.html" class="dropdown-item">Change Password</a>
            <a href="my_notifications.html" class="dropdown-item">Notifications</a>
            <a href="my_membership.html" class="dropdown-item">Membership</a>
            <a href="my_payments.html" class="dropdown-item">Payments</a>
            <a href="my_account.html" class="dropdown-item">Account</a>
        </div>
      </li> -->
       <button class="btn btn-primary" type="submit"><a href="/jsp/member/SignInCon.do"><i class="fa fa-power-off"></i></a></button>
       
      <!-- <li class="nav-item add-listing"><a class="nav-link" href="/jsp/member/SigninCon.jsp"><span> -->
     <!--  <i class="fa fa-power-off" ></i> 로그인 </span></a></li> -->
    
    </ul>
    
  </div>
  </div>
</nav>
<!-- 사이드 바  -->
<div id="mySidenav" class="sidenav">
	<br>
	<br>
  	<!-- <a href="#">Services</a> -->
  	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a><br><br>
  	<!-- <a href="#">Clients</a>
  	<a href="#">Contact</a> -->
	<!-- <div style="display:inline-block;background-color:none;width:80px;">매장명</div><div style="display:inline-block;width:95px;">현재인원</div><div style="display:inline-block;width:80px;">상태</div> -->
	<div class="sideMenu" style="width:95px;padding-left: 15px;">매장명</div>
	<div class="sideMenu" style="width:95px;">이용중</div>
	<div class="sideMenu" style="width:95px;">이용가능</div>
  	<c:forEach var="article" items="${articleList}">
  	<table>
  		<tr>
  		<td style="width:80px;padding-left: 20px;padding-right: 10px;background-color:none;display:inline-block;"><a id="linkedA" href="list_info.do?store_no=${article.store_no }">${article.store_nm }</a></td>
  		<td style="width:80px;padding-left: 20px;padding-right: 10px;background-color:none;display:inline-block;">${article.avl_tbl_cnt }</td>
  		<td style="width:80px;padding-left: 10px;padding-right: 10px;background-color:none;display:inline-block;">
  		<c:choose>
  		<c:when test="${article.avl_tbl_cnt>0 && article.avl_tbl_cnt <=40 }">
  		<font color="red">예약불가</font>
  		</c:when>
  		<c:when test="${article.avl_tbl_cnt>40 && article.avl_tbl_cnt <=100 }">
  		<font color="blue">예약가능</font>
  		</c:when>
  		</c:choose>
  		</td>
  		</tr>
  	</table>
	</c:forEach>
	<%-- <a id="subside" href="list_info.do?store_no=${article.store_no }"><div style="display:inline-block;background-color:red;width:80px;">${article.store_nm }</div><div style="display:inline-block;width:80px;">${article.avl_tbl_cnt }</div><div style="display:inline-block;width:80px;">예약가능</div></a> --%>
	<!-- foreach 문 사용 -->
	
	<%-- 
	<c:forEach var="article" items="${articleList}">
	<a></a>
	</c:forEach>
	--%>
	
</div>

<span style="font-size:30px;cursor:pointer" onclick="openNav()"></span>
<!-- 사이드 바 end -->
<div class="home-search">
<div class="main search-form v7">
  <div class="container">
    <div class="row justify-content-md-center">
      <div class="col-md-12 col-lg-10">
        <div class="heading">
          <h2> B A B S A Z O</h2>
          <h3> 밥사조와 함께하는 식도락 여행, 시작해볼까요  </h3>
        </div>
        <!-- <form action="/jsp/storeList/list.do"></form> -->
        <form action="/SemiProject/jsp/storeList/list.do"><!-- 이부분을 test2로 -->
          <div class="row justify-content-md-center">
            <div class="col-md-9 col-lg-8">
            <div class="input-group input-group-lg">
      <input type="text" class="form-control" name="search" id="mainsearch" placeholder="ex) 자장면, 김치찌개, 파스타">
   	 <span class="input-group-btn">
      	 <!-- <button class="btn btn-white" type="button"><i class="fa fa-map-marker" aria-hidden="true"></i></button> -->
         <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i></button> 
      </span>
    </div>
    <div class="search-in">
<div class="radio-box" id ="food">
<!-- <button class="btn btn-primary" type="button"><i class="fas fa-utensils"> 음식명 </i></button>  -->
<input type="radio" name="searchn" value="0" id="rent22" checked >
							<!-- label 태그의 for 속성은 해당 속성값과 같은 id를 가진 대상과 연결시켜줌 -->
<label class="radio-inline" for="rent22" id ="food" >음식명으로 찾기</label><!-- placeholder 변경을 위한 value값 추가, 파라미터와는 상관x -->
</div>



<div class="radio-box">
<input type="radio" name="searchn" value="1" id="sell22" >
<label class="radio-inline" for="sell22" >매장명으로 찾기</label>
</div>
    </div>
    </div>
          </div>
          
        </form>
        
      </div>
    </div>
  </div>
  <video class="search-video" autoplay loop width="0" height="0" src="../../video/mainpage_video.mp4" muted></video>
</div>
</div>
<div id="content" class="pt0 pb0">
  <div class="feature-box centered gray">
    <div data-aos="fade-up">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col col-lg-12 col-xl-10">
            <div class="main-title"><span>오늘의 추천식당</span></div>
            <div class="main-title-description">부연 설명</div>
            <div class="clearfix"></div>
            <div class="mt50 mb50">
              <div class="featured-gallery v2 item-listing grid">
              <div class="row">
                <div class="col-md-6">
                  <div class="item item-lg">
                    <div class="item-image" style="background-image:url(../../img/store_img/store_elbonmain.jpg);"><a href="list_info.do?store_no=3">
                      <div class="item-meta">
                        <div class="item-info">
                          <h3 class="item-title">엘본 더 테이블</h3>
                          <div class="item-location"><i class="fa fa-map-marker"></i> 4층 </div>
                        </div>
                        <div class="item-price">13000원 <small>스타쉐프 최현석의 선택</small> </div>
                      </div>
                      <div class="item-badges">
                        <div class="item-badge-right">세일중</div>
                      </div>
                      </a> </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="item item-md">
                        <div class="item-image" style="background-image:url(../../img/store_img/store_gyunghwa.jpg);"><a href="list_info.do?store_no=2">
                          <div class="item-meta">
                            <div class="item-info">
                              <h3 class="item-title">경화루</h3>
                              <div class="item-location"><i class="fa fa-map-marker"></i> 2층 </div>
                            </div>
                            <div class="item-price">7000원대 <small>중화요리의 절대고수 이연복</small> </div>
                          </div>
                          <div class="item-badges">
                            <div class="item-badge-right">예약가능</div>
                          </div>
                          </a> </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <div class="item item-sm">
                        <div class="item-image" style="background-image:url(../../img/store_img/store_layuen.jpg);"><a href="list_info.do?store_no=1">
                          <div class="item-meta">
                            <div class="item-info">
                              <h3 class="item-title">라연</h3>
                              <div class="item-location"><i class="fa fa-map-marker"></i> 1층 </div>
                            </div>
                            <div class="item-price">10000원대 <small>미쉐린 스타쉐프 김성일의 식당</small> </div>
                          </div>
                          <div class="item-badges">
                            <div class="item-badge-right">예약가능</div>
                          </div>
                          </a> </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="item item-sm">
                        <div class="item-image" style="background-image:url(../../img/store_img/store_manbbo.jpg);"><a href="list_info.do?store_no=4">
                          <div class="item-meta">
                            <div class="item-info">
                              <h3 class="item-title">만뽀</h3>
                              <div class="item-location"><i class="fa fa-map-marker"></i> 2층</div>
                            </div>
                            <div class="item-price">6500원대 <small>전통 일식의 그맛</small> </div>
                          </div>
                          <div class="item-badges">
                            <div class="item-badge-right">예약가능</div>
                          </div>
                          </a> </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              </div>
            </div>
            <div class="text-center"><a href="#" class="btn btn-xlg btn-link"> 밥사조 시작하기 </a></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- <div class="feature-box centered">
    <div data-aos="fade-up">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col col-lg-12 col-xl-10">
            <div class="row">
              <div class="col-md-4">
                <div class="content-box">
                  <div class="image"> <img src="../img/demo/icons/1.png" width="100" alt=""> </div>
                  <h4>Lifestyle</h4>
                  <div class="caption">Create your best-ever home with the latest trends in renovating, decorating and more.</div>
                  <div class="button"><a href="#">FIND YOUR INSPIRATION</a></div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="content-box">
                  <div class="image"> <img src="../img/demo/icons/2.png" width="100" alt=""> </div>
                  <h4>International</h4>
                  <div class="caption">Thinking abroad? You can now dream and discover international properties.</div>
                  <div class="button"><a href="#">CHOOSE A COUNTRY</a></div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="content-box">
                  <div class="image"> <img src="../img/demo/icons/3.png" width="100" alt=""> </div>
                  <h4>Sell</h4>
                  <div class="caption">Understand your local market, learn how to get the best price for your property and find agents in your area.</div>
                  <div class="button"><a href="#">EXPLORE NOW</a></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="feature-box centered gray">
    <div data-aos="fade-up">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col col-lg-12 col-xl-10">
            <div class="item-listing grid">
            <div class="main-title"><span>Featured Properties</span></div>
       		<div class="main-title-description">Thinking abroad? You can now dream and discover international properties</div>
              <div class="row">
                <div class="col-md-4">
                  <div class="item">
                  	리스트 목록 이미지 관련 경로
                    <div class="item-image"><a href="property_single.html"><img src="../img/demo/property/1.jpg" class="img-fluid" alt="">
                      <div class="item-meta">
                        <div class="item-price">$420,000 <small>$777 / sq m</small> </div>
                      </div>
                      <div class="item-badges">
                        <div class="item-badge-left">Sponsored</div>
                        <div class="item-badge-right">For Sale</div>
                      </div>
                      </a> <a href="#" class="save-item"><i class="fa fa-star"></i></a> </div>
                    <div class="item-info">
                      <h3 class="item-title">3 bed semi-detached house</h3>
                      <div class="item-location"><i class="fa fa-map-marker"></i> Kirkstone Road, Middlesbrough TS3</div>
                      <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="item">
                    <div class="item-image"><a href="property_single.html"><img src="../img/demo/property/2.jpg" class="img-fluid" alt="">
                      <div class="item-meta">
                        <div class="item-price">$420,000 <small>$777 / sq m</small> </div>
                      </div>
                      <div class="item-badges">
                        <div class="item-badge-left">Sponsored</div>
                        <div class="item-badge-right">For Sale</div>
                      </div>
                      </a> <a href="#" class="save-item"><i class="fa fa-star"></i></a> </div>
                    <div class="item-info">
                      <h3 class="item-title">3 bed semi-detached house</h3>
                      <div class="item-location"><i class="fa fa-map-marker"></i> Kirkstone Road, Middlesbrough TS3</div>
                      <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="item">
                    <div class="item-image"><a href="property_single.html"><img src="../img/demo/property/3.jpg" class="img-fluid" alt="">
                      <div class="item-meta">
                        <div class="item-price">$420,000 <small>$777 / sq m</small> </div>
                      </div>
                      <div class="item-badges">
                        <div class="item-badge-left">Sponsored</div>
                        <div class="item-badge-right">For Sale</div>
                      </div>
                      </a> <a href="#" class="save-item"><i class="fa fa-star"></i></a> </div>
                    <div class="item-info">
                      <h3 class="item-title">3 bed semi-detached house</h3>
                      <div class="item-location"><i class="fa fa-map-marker"></i> Kirkstone Road, Middlesbrough TS3</div>
                      <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="feature-box centered">
    <div data-aos="fade-up">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col col-lg-12 col-xl-10">
            <div class="main-title"><span>What our clients say</span></div>
            <div class="swiper-container testimonials">
              <div class="swiper-wrapper">
                <div class="swiper-slide">
                  <div class="item content-box centered">
                    <div class="image"> <img class="rounded-circle" src="../img/demo/profile.jpg" width="180" alt=""> </div>
                    <h4>Thank you for your quick and clear responses. They are much appreciated. This was a site that needed to go up fast and it has – customizations and all!</h4>
                    <div class="caption">The Brown Family</div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="item content-box centered">
                    <div class="image"> <img class="rounded-circle" src="../img/demo/profile2.jpg" width="180" alt="">
                      <h4>Thank you for your quick and clear responses. They are much appreciated. This was a site that needed to go up fast and it has – customizations and all!</h4>
                      <div class="caption">The Brown Family</div>
                    </div>
                  </div>
                </div>
                <div class="swiper-slide">
                  <div class="item content-box centered">
                    <div class="image"> <img class="rounded-circle" src="../img/demo/profile3.jpg" width="180" alt="">
                      <h4>Thank you for your quick and clear responses. They are much appreciated. This was a site that needed to go up fast and it has – customizations and all!</h4>
                      <div class="caption">The Brown Family</div>
                    </div>
                  </div>
                </div>
              </div>
              Add Arrows
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
            </div>
            <script>
			var swiper = new Swiper('.swiper-container', {
				loop: true,
				centeredSlides: true,
					autoplay: {
					delay: 5000,
					disableOnInteraction: false,
				},
				pagination: {
					el: '.swiper-pagination',
					clickable: true,
				},
				navigation: {
					nextEl: '.swiper-button-next',
					prevEl: '.swiper-button-prev',
				},
			});
        	</script> 
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="feature-box gray centered">
    <div data-aos="fade-up">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col col-lg-12 col-xl-10">
            <div class="main-title"><span>News &amp; Updates </span></div>
            <div class="main-title-description">Stay up to date with the latest happenings.</div>
            <div class="item-listing grid mb50">
              <div class="row">
                <div class="col-md-4">
                  <div class="item">
                    <div class="item-image"> <a href="blog_single.html"><img src="../img/demo/property/1.jpg" class="img-fluid" alt="">
                      <div class="item-meta">
                        <div class="item-price"><small>26th Oct 17</small> </div>
                      </div>
                      <div class="item-badges">
                        <div class="item-badge-right">Legal</div>
                      </div>
                      </a> </div>
                    <div class="item-info">
                      <h3 class="item-title">Allianz invests 100m in Hines European Value Fund</h3>
                      <div class="item-comments-count"><i class="fa fa-comment-o"></i> 3</div>
                      <div class="item-author">By John Doe</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="item">
                    <div class="item-image"> <a href="blog_single.html"><img src="../img/demo/property/1.jpg" class="img-fluid" alt="">
                      <div class="item-meta">
                        <div class="item-price"><small>26th Oct 17</small> </div>
                      </div>
                      <div class="item-badges">
                        <div class="item-badge-right">Development</div>
                      </div>
                      </a> </div>
                    <div class="item-info">
                      <h3 class="item-title">Skanska signs 43.2m construction deal in Sollentuna</h3>
                      <div class="item-comments-count"><i class="fa fa-comment-o"></i> 3</div>
                      <div class="item-author">By John Doe</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="item">
                    <div class="item-image"> <a href="blog_single.html"><img src="../img/demo/property/1.jpg" class="img-fluid" alt="">
                      <div class="item-meta">
                        <div class="item-price"><small>26th Oct 17</small> </div>
                      </div>
                      <div class="item-badges">
                        <div class="item-badge-right category">Finance</div>
                      </div>
                      </a> </div>
                    <div class="item-info">
                      <h3 class="item-title">Baltic Horizon Fund plans next public offering of new units</h3>
                      <div class="item-comments-count"><i class="fa fa-comment-o"></i> 3</div>
                      <div class="item-author">By John Doe</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="text-center"><a href="#" class="btn btn-xlg btn-link">View All</a></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="feature-box centered pb0">
    <div data-aos="fade-up">
      <div class="container">
        <div class="row justify-content-md-center">
          <div class="col col-lg-10 col-xl-10">
            <div class="row">
              <div class="col-md-6">
                <div class="text-center mt50 mb50">
                  <div class="main-title"><span>Connect with us from anywhere</span></div>
                  <div class="main-title-description">Download the mobile app and enjoy the smoothest experience</div>
                  <img src="../img/store/apple.svg" width="120" alt=""> <img src="../img/store/google.svg" width="120" alt=""> </div>
              </div>
              <div class="col-md-6"> <img src="../img/demo/mobile-app-hero.png" class="img-fluid" alt=""> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
사이드바 버튼
<div id="mySidenav" class="sidenav">
  <br>
  <br>
  <a href="#">Services</a><a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">Clients</a>
  <a href="#">Contact</a>
</div> -->
<button class="btn btn-primary btn-circle" id="sidebar-btn" onMouseOver="openNav()">바<br>로<br>가<br>기</button><!-- <i> 태그와 아무상관없음 -->
<!-- 사이드바 버튼 end -->
<button class="btn btn-primary btn-circle" id="to-top"><i class="fa fa-angle-up"></i></button>
<!-- 푸터 START -->
<footer id="footer">
  <div class="container">
    <div class="row justify-content-md-center">
          <div class="col col-md-10">
        <div class="row">
          <div class="col-md-4 col-sm-4">
            <!-- <p><span class="icon-uilove-realestate"></span></p> -->
            <p><span><img src="../../img/밥사조로고.png" alt="Smiley face" height="60" width="120"></span></p>
            <address>
            <strong>BABSAZO, Inc.</strong><br>
            	서울특별시 중구 남대문로 120<br>
           		대일빌딩3층 D CLASS<br>
            <!-- <abbr title="Phone">P:</abbr> (123) 456-7890 -->
            </address>
            <p class="text-muted">Copyright &copy; 2018<br />
              All rights reserved</p>
          </div>
          <div class="col-md-4  col-sm-4">
            <ul class="list-unstyled">
              <li><a href="#"> About BABSAJO </a></li>
              <li><a href="#"> Team Introduction </a></li>
              <!-- <li><a href="#">Security</a></li>
              <li><a href="#">Plans</a></li> -->
            </ul>
          </div>
          <!-- <div class="col-md-2 col-sm-4">
            <ul class="list-unstyled">
              <li><a href="#">For Rent</a></li>
              <li><a href="#">For Sale</a></li>
              <li><a href="#">Commercial</a></li>
              <li><a href="#">Agents</a></li>
              <li><a href="#">Property Guides</a></li>
              <li><a href="#">Jobs</a></li>
            </ul>
          </div> -->
          <div class="col-md-4 col-sm-12">
            <div class="social-sharebox"> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-google"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-pinterest"></i></a> </div>
            <form>
              <h4>밥사조 소식 받아보기 </h4>
              <div class="input-group input-group-lg">
                <input type="email" class="form-control form-control-lg" placeholder="Email Address">
                <span class="input-group-btn">
                <button class="btn btn-primary" type="button"> 구독 </button>
                </span> </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
</div>
</body>
</html>