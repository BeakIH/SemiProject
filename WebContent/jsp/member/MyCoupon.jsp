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
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans" rel="stylesheet" />
<link href="../../../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../../lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../../lib/animate.css" rel="stylesheet">
<link href="../../../lib/selectric/selectric.css" rel="stylesheet">
<link href="../../../lib/aos/aos.css" rel="stylesheet">
<link href="../../../lib/Magnific-Popup/magnific-popup.css" rel="stylesheet">
<link href="../../../css/style.css" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../../lib/jquery-3.2.1.min.js"></script>
<script src="../../../lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../../lib/selectric/jquery.selectric.js"></script>
<script src="../../../lib/tinymce/tinymce.min.js"></script>
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
<nav class="navbar navbar-expand-lg navbar-dark" id="menu">
  <div class="container">
  <a class="navbar-brand" href="index.html"><span class="icon-uilove-realestate"></span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu-content" aria-controls="menu-content" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="menu-content">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Home <span class="sr-only">(current)</span>
        </a>
        <div class="dropdown-menu">
            <a href="index.html" class="dropdown-item">Homepage 1</a>
            <a href="index2.html" class="dropdown-item">Homepage 2</a>
            <a href="index3.html" class="dropdown-item">Homepage 3</a>
            <a href="index4.html" class="dropdown-item">Homepage 4</a>
            <a href="index5.html" class="dropdown-item">Homepage 5</a>
            <a href="index6.html" class="dropdown-item">Homepage 6</a>
            <a href="index7.html" class="dropdown-item">Homepage 7</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Listings
        </a>
        <div class="dropdown-menu">
            <a href="property_listing.html" class="dropdown-item">List View</a>
            <a href="property_grid.html" class="dropdown-item">Grid View</a>
            <a href="property_listing_map.html" class="dropdown-item">Map View</a>
            <a href="property_single.html" class="dropdown-item">Single View 1</a>
            <a href="property_single2.html" class="dropdown-item">Single View 2</a>
            <a href="property_single3.html" class="dropdown-item">Single View 3</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Agents
        </a>
        <div class="dropdown-menu">
            <a href="agent_list.html" class="dropdown-item">Agent List</a>
            <a href="agent.html" class="dropdown-item">Agent Profile</a>
        </div>
      </li>
      
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
                  <li><a href="index7.html">Homepage 7</a></li>
                  <li class="title">Login Pages</li>
                  <li><a href="signin.html">Signin</a></li>
                  <li><a href="register.html">Register</a></li>
                  <li><a href="forgot-password.html">Forgot Password</a></li>
                 </ul>
              </div>
              <div class="col-md-6 col-lg-3">
                <ul class="list-unstyled">
                  <li class="title">Property Listing</li>
                  <li><a href="property_listing.html">List View</a></li>
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
      </li>
      
    </ul>
    
    <ul class="navbar-nav ml-auto">
      
      
      <li class="nav-item dropdown user-account">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="user-image" style="background-image:url(' img/demo/profile3.jpg');"></span> Hi, John
        </a>
        <div class="dropdown-menu">
            <a href="my_profile.html" class="dropdown-item">My Profile</a>
            <a href="my_password.html" class="dropdown-item">Change Password</a>
            <a href="my_notifications.html" class="dropdown-item">Notifications</a>
            <a href="my_membership.html" class="dropdown-item">Membership</a>
            <a href="my_payments.html" class="dropdown-item">Payments</a>
            <a href="my_account.html" class="dropdown-item">Account</a>
        </div>
      </li>
      <li class="nav-item add-listing"><a class="nav-link" href="my_listing_add.html"><span><i class="fa fa-plus" aria-hidden="true"></i> Add listing</span></a></li>
    </ul>
    
  </div>
  </div>
</nav>
<div class="clearfix"></div>
<div id="content">
  <div class="container">
    <div class="row justify-content-md-center">
          <div class="col col-lg-12 col-xl-10">
        <div class="row has-sidebar">
          <div class="col-md-5 col-lg-4 col-xl-4">
            <div id="sidebar" class="sidebar-left">
              <div class="sidebar_inner">
                <div class="list-group no-border list-unstyled">
                  
                  <span class="list-group-item heading"> 내 매장 목록</span>
                  <a href="#" class="list-group-item">
                  <i class="fa fa-fw fa-plus-square-o"></i> BABSAZO하기</a>
                  <a href="MyCoupon.jsp" class="list-group-item active d-flex justify-content-between align-items-center">
                  <span><i class="fa fa-fw fa-bookmark-o"></i> BABSAZO 쿠폰</span>
                    <span class="badge badge-primary badge-pill">10</span></a>
                
                  <a href="#" class="list-group-item d-flex justify-content-between align-items-center">
                  <span><i class="fa fa-fw fa-bars"></i> 즐겨찾는 BABSAZO</span>
                    <span class="badge badge-primary badge-pill">7</span>   </a>
                    
                  <span class="list-group-item heading"> 내 계정 관리</span>
                  <a href="ProfilePre.jsp" class="list-group-item"><i class="fa fa-fw fa-pencil"></i> 프로필 설정</a>
                  <a href="ChangePWPre.jsp" class="list-group-item"><i class="fa fa-fw fa-lock"></i> 비밀번호 변경</a>
                  <a href="NotificationPre.jsp" class="list-group-item"><i class="fa fa-fw fa-bell-o"></i> BABSAZO 알림</a>
<a href="MemberGradePre.jsp" class="list-group-item"><i class="fa fa-fw fa-cubes"></i> BABSAZO 멤버십</a>
<a href="PaymentsPre.jsp" class="list-group-item"><i class="fa fa-fw fa-credit-card"></i> 결제 정보</a>
<a href="SetAccount.jsp" class="list-group-item"><i class="fa fa-fw fa-cog"></i> 계정 설정</a>
                </div>
              </div>
            </div>
          </div>
       
          <!-- 쿠폰 목록 (사용기간 오름차/내림차순 받은 날짜 할인률) -->
         
          <div class="col-md-7 col-lg-8 col-xl-8">
            <div class="page-header bordered">
              <h1>내 BABSAZO 쿠폰</h1>
            </div>
           
            <div class="item-listing list">
              <div class="item" data-aos="fade-up">
                <div class="row">
                  <div class="col-lg-5">
                    <div class="item-image"> <a href="property_single.html"><img src="../../../img/mycoupon_img/BABMonth.png" class="img-fluid" alt="">
                      <div class="item-badges">
                   <!-- <div class="item-badge-left">예약하기</div>  -->
                      <div class="item-badge-right">예약하기</div>
                      </div>
                      <div class="item-meta">
                      <div class="item-price"> 베를린키친
                      <small>메인 2,사이드1,음료 2+후식</small>
                      </div>
                      </div>
                      </a>
                   <!--    <a href="#" class="save-item"><i class="fa fa-star"></i></a> --> </div>  
                      <a href="#" class="remove-item"><i class="fa fa-trash-o"></i> 쿠폰 삭제 후 포인트 전환</a>
                  </div>
                  <div class="col-lg-7">
                  <div class="item-info">
                    <h3 class="item-title"><a href="property_single.html">[멤버십] 3월 이달의 식당 무료 식사권 </a></h3>
                    <div class="item-location"><i class="fa fa-map-marker"></i> BABSAZO 타워 2층 베를린키친 </div>
                    <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    <div class="item-details">
                      <ul> 
                        <li>발급유형 <span>BABSAZO대지주 멤버전용 쿠폰</span></li>
                        <li>사용조건 <span> 예약 후 사용 가능(주말 및 공휴일 포함)</span></li>
                      </ul>
                    </div>
                 </div>
                    <div class="row">
                    <div class="col-md-6">
                                        <div class="added-on">사용기간  </div>
                    </div>
                    
                    <div class="col-md-6">
                                         <a href="#" class="added-by">2018.03/31(토)까지</a>
                    </div>
                    </div>
                  </div>
                </div>
              </div>
              
              
              
              
              
              
              
              <div class="item" data-aos="fade-up">
                <div class="row">
                  <div class="col-lg-5">
                    <div class="item-image"> <a href="property_single.html"><img src="../../../img/mycoupon_img/BAB20.png" class="img-fluid" alt="">
                      <div class="item-badges">
                      <!-- <div class="item-badge-left">Sponsored</div>  -->
                      <div class="item-badge-right">예약하기</div>
                      </div>
                      <div class="item-meta">
                      <div class="item-price">BABSAZO 전체
                      <small>총 구매 금액의 20% 할인</small>
                      </div>
                      </div>
                      </a>
                     <!--  별점/평점 확인으로 활용 할 수 있을듯 
                     <a href="#" class="save-item"><i class="fa fa-star"></i></a>  --> </div>
                      <a href="#" class="remove-item"><i class="fa fa-trash-o"></i> 쿠폰 삭제 후 포인트 전환</a>
                  </div>
                  <div class="col-lg-7">
                  <div class="item-info">
                    <h3 class="item-title"><a href="property_single.html">[가입축하] BABSAZO 매장 20% 할인권</a></h3>
                    <div class="item-location"><i class="fa fa-map-marker"></i> BABSAZO 타워 모든 매장</div>
                    <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    <div class="item-details">
                      <ul>
                        <li>발급유형 <span>사이트 회원가입</span></li>
                        <li>사용조건 <span> 메인 1개 이상 주문</span></li>
                      </ul>
                    </div>
                 </div>
                    <div class="row">
                    <div class="col-md-6">
                                        <div class="added-on">사용기간</div>

                    </div>
                    <div class="col-md-6">
                                         <a href="#" class="added-by">무제한</a>

                    </div>
                    </div>
                  </div>
                </div>
              </div>
              
              
              
              
              
              
              
              
              <div class="item" data-aos="fade-up">
                <div class="row">
                  <div class="col-lg-5">
                    <div class="item-image"> <a href="property_single.html"><img src="../../../img/mycoupon_img/BABFree.png" class="img-fluid" alt="">
                      <div class="item-badges">
                      <!-- <div class="item-badge-left">Sponsored</div>  -->
                      <div class="item-badge-right">예약하기</div>
                      </div>
                      <div class="item-meta">
                      <div class="item-price">차이
                      <small>새우쇼마이2 하가우2 소룡포2 </small>
                      </div>
                      </div>
                      </a>
                  <!--  <a href="#" class="save-item"><i class="fa fa-star"></i></a>--> </div>
                      <a href="#" class="remove-item"><i class="fa fa-trash-o"></i> 쿠폰 삭제 후 포인트 전환</a>
                  </div>
                  <div class="col-lg-7">
                  <div class="item-info">
                    <h3 class="item-title"><a href="property_single.html"> [뉴스레터] 3월 사이드메뉴 쿠폰</a></h3>
                    <div class="item-location"><i class="fa fa-map-marker"></i> BABSAZO 타워 3층 차이</div>
                    <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    <div class="item-details">
                      <ul>
                        <li>발급유형 <span> BABSAZO 이메일 뉴스레터 수신동의</span></li>
                        <li>사용조건 <span>식사 메뉴 1개 이상 주문 </span></li>
                      </ul>
                    </div>
                 </div>
                    <div class="row">
                    <div class="col-md-6">
                                        <div class="added-on">사용기간</div>

                    </div>
                    <div class="col-md-6">
                                         <a href="#" class="added-by">2018.03/31(토)까지</a>

                    </div>
                    </div>
                  </div>
                </div>
              </div>
              
              
              
              
              
              
              
              
              
              
              <div class="item" data-aos="fade-up">
                <div class="row">
                  <div class="col-lg-5">
                    <div class="item-image"> <a href="property_single.html"><img src="img/demo/property/4.jpg" class="img-fluid" alt="">
                      <div class="item-badges">
                      <div class="item-badge-left">Sponsored</div>
                      <div class="item-badge-right">For Sale</div>
                      </div>
                      <div class="item-meta">
                      <div class="item-price">$420,000
                      <small>$777 / sq m</small>
                      </div>
                      </div>
                      </a>
                      <a href="#" class="save-item"><i class="fa fa-star"></i></a> </div>
                      <a href="#" class="remove-item"><i class="fa fa-trash-o"></i> Remove Bookmark</a>
                  </div>
                  <div class="col-lg-7">
                  <div class="item-info">
                    <h3 class="item-title"><a href="property_single.html">3 bed semi-detached house for sale</a></h3>
                    <div class="item-location"><i class="fa fa-map-marker"></i> Kirkstone Road, Middlesbrough TS3</div>
                    <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    <div class="item-details">
                      <ul>
                        <li>Sq Ft <span>730-2600</span></li>
                        <li>Type <span>Apartments</span></li>
                      </ul>
                    </div>
                 </div>
                    <div class="row">
                    <div class="col-md-6">
                                        <div class="added-on">Listed on 19th Feb 2017 </div>

                    </div>
                    <div class="col-md-6">
                                         <a href="#" class="added-by">by John Doe</a>

                    </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item" data-aos="fade-up">
                <div class="row">
                  <div class="col-lg-5">
                    <div class="item-image"> <a href="property_single.html"><img src="img/demo/property/5.jpg" class="img-fluid" alt="">
                      <div class="item-badges">
                      <div class="item-badge-left">Sponsored</div>
                      <div class="item-badge-right">For Sale</div>
                      </div>
                      <div class="item-meta">
                      <div class="item-price">$420,000
                      <small>$777 / sq m</small>
                      </div>
                      </div>
                      </a>
                      <a href="#" class="save-item"><i class="fa fa-star"></i></a> </div>
                      <a href="#" class="remove-item"><i class="fa fa-trash-o"></i> Remove Bookmark</a>
                  </div>
                  <div class="col-lg-7">
                  <div class="item-info">
                    <h3 class="item-title"><a href="property_single.html">3 bed semi-detached house for sale</a></h3>
                    <div class="item-location"><i class="fa fa-map-marker"></i> Kirkstone Road, Middlesbrough TS3</div>
                    <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    <div class="item-details">
                      <ul>
                        <li>Sq Ft <span>730-2600</span></li>
                        <li>Type <span>Apartments</span></li>
                      </ul>
                    </div>
                 </div>
                    <div class="row">
                    <div class="col-md-6">
                                        <div class="added-on">Listed on 19th Feb 2017 </div>

                    </div>
                    <div class="col-md-6">
                                         <a href="#" class="added-by">by John Doe</a>

                    </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item" data-aos="fade-up">
                <div class="row">
                  <div class="col-lg-5">
                    <div class="item-image"> <a href="property_single.html"><img src="img/demo/property/6.jpg" class="img-fluid" alt="">
                      <div class="item-badges">
                      <div class="item-badge-left">Sponsored</div>
                      <div class="item-badge-right">For Sale</div>
                      </div>
                      <div class="item-meta">
                      <div class="item-price">$420,000
                      <small>$777 / sq m</small>
                      </div>
                      </div>
                      </a>
                      <a href="#" class="save-item"><i class="fa fa-star"></i></a> </div>
                      <a href="#" class="remove-item"><i class="fa fa-trash-o"></i> Remove Bookmark</a>
                  </div>
                  <div class="col-lg-7">
                  <div class="item-info">
                    <h3 class="item-title"><a href="property_single.html">3 bed semi-detached house for sale</a></h3>
                    <div class="item-location"><i class="fa fa-map-marker"></i> Kirkstone Road, Middlesbrough TS3</div>
                    <div class="item-details-i"> <span class="bedrooms" data-toggle="tooltip" title="3 Bedrooms">3 <i class="fa fa-bed"></i></span> <span class="bathrooms" data-toggle="tooltip" title="2 Bathrooms">2 <i class="fa fa-bath"></i></span> </div>
                    <div class="item-details">
                      <ul>
                        <li>Sq Ft <span>730-2600</span></li>
                        <li>Type <span>Apartments</span></li>
                      </ul>
                    </div>
                 </div>
                    <div class="row">
                    <div class="col-md-6">
                                        <div class="added-on">Listed on 19th Feb 2017 </div>

                    </div>
                    <div class="col-md-6">
                                         <a href="#" class="added-by">by John Doe</a>

                    </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <nav aria-label="Page navigation">
              <ul class="pagination">
                <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<button class="btn btn-primary btn-circle" id="to-top"><i class="fa fa-angle-up"></i></button>
<footer id="footer">
  <div class="container">
    <div class="row justify-content-md-center">
          <div class="col col-md-10">
        <div class="row">
          <div class="col-md-4 col-sm-4">
            <p><span class="icon-uilove-realestate"></span></p>
            <address>
            <strong>Twitter, Inc.</strong><br>
            1355 Market Street, Suite 900<br>
            San Francisco, CA 94103<br>
            <abbr title="Phone">P:</abbr> (123) 456-7890
            </address>
            <p class="text-muted">Copyright &copy; 2016<br />
              All rights reserved</p>
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
            <div class="social-sharebox"> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-google"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-pinterest"></i></a> </div>
            <form>
              <h4>Subscribe Newsletter</h4>
              <div class="input-group input-group-lg">
                <input type="email" class="form-control form-control-lg" placeholder="Email Address">
                <span class="input-group-btn">
                <button class="btn btn-primary" type="button">Go!</button>
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