<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>공지 사항</title>

<!-- Bootstrap -->
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans" rel="stylesheet" />
<link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../lib/animate.css" rel="stylesheet">
<link href="../lib/selectric/selectric.css" rel="stylesheet">
<link href="../lib/swiper/css/swiper.min.css" rel="stylesheet">
<link href="../lib/aos/aos.css" rel="stylesheet">
<link rel="stylesheet" href="../lib/photoswipe/photoswipe.css"> 
<link rel="stylesheet" href="../lib/photoswipe/default-skin/default-skin.css">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/notice2.css" rel="stylesheet">



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="lib/jquery-3.2.1.min.js"></script>
<script src="lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script src="lib/selectric/jquery.selectric.js"></script>
<script src="lib/swiper/js/swiper.min.js"></script>
<script src="lib/aos/aos.js"></script>
<script src="lib/photoswipe/photoswipe.min.js"></script>
<script src="lib/photoswipe/photoswipe-ui-default.min.js"></script>
<script src="lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="lib/lib.js"></script>



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="location ">
			<div class="location_text_position">
				<a href="/main/main.do" class="m_home_area"><span class="location_home">HOME</span></a>
				
					<a href="/customer/notice/list.do" class="m_1depth"><span class="location_gt">고객센터</span></a>
					<span class="location_gt current">고객의 소리</span>
				
			</div>
		</div>
<div id="main">
<nav class="navbar navbar-expand-lg navbar-dark" id="menu">
  <div class="container">
  <a class="navbar-brand" href="../index.html"><span class="icon-uilove-realestate"></span></a>
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
            <a href="../index.html" class="dropdown-item">Homepage 1</a>
            <a href="../index2.html" class="dropdown-item">Homepage 2</a>
            <a href="../index3.html" class="dropdown-item">Homepage 3</a>
            <a href="../index4.html" class="dropdown-item">Homepage 4</a>
            <a href="../index5.html" class="dropdown-item">Homepage 5</a>
            <a href="../index6.html" class="dropdown-item">Homepage 6</a>
            <a href="../index7.html" class="dropdown-item">Homepage 7</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Listings
        </a>
        <div class="dropdown-menu">
            <a href="../property_listing.html" class="dropdown-item">List View</a>
            <a href="../property_grid.html" class="dropdown-item">Grid View</a>
            <a href="../property_listing_map.html" class="dropdown-item">Map View</a>
            <a href="../property_single.html" class="dropdown-item">Single View 1</a>
            <a href="../property_single2.html" class="dropdown-item">Single View 2</a>
            <a href="../property_single3.html" class="dropdown-item">Single View 3</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Agents
        </a>
        <div class="dropdown-menu">
            <a href="../agent_list.html" class="dropdown-item">Agent List</a>
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
                  <li><a href="../index.html">Homepage 1</a></li>
                  <li><a href="../index2.html">Homepage 2</a></li>
                  <li><a href="../index3.html">Homepage 3</a></li>
                  <li><a href="../index4.html">Homepage 4</a></li>
                  <li><a href="../index5.html">Homepage 5</a></li>
                  <li><a href="../index6.html">Homepage 6</a></li>
                  <li><a href="../index7.html">Homepage 7</a></li>
                  <li class="title">Login Pages</li>
                  <li><a href="../signin.html">Signin</a></li>
                  <li><a href="../register.html">Register</a></li>
                  <li><a href="../forgot-password.html">Forgot Password</a></li>
                 </ul>
              </div>
              <div class="col-md-6 col-lg-3">
                <ul class="list-unstyled">
                  <li class="title">Property Listing</li>
                  <li><a href="../property_listing.html">List View</a></li>
                  <li><a href="../property_grid.html">Grid View</a></li>
                  <li><a href="../property_listing_map.html">Map View</a></li>
                  <li class="title">Single Property</li>
                  <li><a href="../property_single.html">Single View 1</a></li>
                  <li><a href="../property_single2.html">Single View 2</a></li>
                  <li><a href="../property_single3.html">Single View 3</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-3">
                <ul class="list-unstyled">
                  <li class="title">Other Pages</li>
                  <li><a href="../plans.html">Plans</a></li>
                  <li><a href="../information_page.html">Information Page</a></li>
                  <li><a href="../coming_soon.html">Coming Soon</a></li>
                  <li><a href="../404_error.html">Error Page</a></li>
                  <li><a href="../success.html">Success Page</a></li>
                  <li><a href="../contact.html">Contact Page</a></li>
                  <li><a href="../compare.html">Compare Properties</a></li>
                  <li class="title">Agent Pages</li>
                  <li><a href="../agent_list.html">Agent List</a></li>
                  <li><a href="../agent.html">Agent Profile</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-3">
                <ul class="list-unstyled">
                  <li class="title">Account Pages</li>
                  <li><a href="../my_listing_add.html">Add Listing</a></li>
                <li><a href="../my_bookmarked_listings.html">Bookmarked Listing</a></li>
                  <li><a href="../my_listings.html">My Listings</a></li>
                  <li><a href="../my_profile.html">My Profile</a></li>
                <li><a href="../my_password.html">Change Password</a></li>
                <li><a href="../my_notifications.html">Notifications</a></li>
                <li><a href="../my_membership.html">Membership</a></li>
                <li><a href="../my_payments.html">Payments</a></li>
                <li><a href="../my_account.html">Account</a></li>
                <li class="title">Blog Pages</li>
                  <li><a href="../blog.html">Blog Archive</a></li>
                  <li><a href="../blog_single.html">Blog Single</a></li>
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
            <a href="../my_profile.html" class="dropdown-item">My Profile</a>
            <a href="../my_password.html" class="dropdown-item">Change Password</a>
            <a href="../my_notifications.html" class="dropdown-item">Notifications</a>
            <a href="../my_membership.html" class="dropdown-item">Membership</a>
            <a href="../my_payments.html" class="dropdown-item">Payments</a>
            <a href="../my_account.html" class="dropdown-item">Account</a>
        </div>
      </li>
      <li class="nav-item add-listing"><a class="nav-link" href="my_listing_add.html"><span><i class="fa fa-plus" aria-hidden="true"></i> Add listing</span></a></li>
    </ul>
    
  </div>
  </div>
</nav>
<div class="inquiry_data_table">
					<h4 class="inquiry_title"><span style="visibility:hidden;position:absolute">공지사항</span></h4>
					<span class="inquiry_required"><span class="txt_red ">&nbsp;*&nbsp;</span> 표시는 필수입력사항입니다.</span>
					
					<form method="post" name="writeform" action="/SemiProject/notice/writePro.do" onsubmit="return writeSave()">
						<input type="hidden" name="bNo"  value="${bNo}">
						<input type="hidden" name="bviewcnt" value=0>
																	
						<fieldset>
							<legend>공지사항</legend>
												
							<table class="inquiry_data">
								<caption>공지사항</caption>

								<tbody>
								<tr>
								<td colspan="2" style="text-align:right;"><a href="/SemiProject/notice/notice2.do">글목록</a>
								</td>
								 </tr>
								 <!-- 게시직원명 db4 -->
								<tr>
									<th scope="row"><span>직원명</span></th> 
									<td><input type="text" name="empnm" id="empnm" maxlength="50"></td>
								</tr>
								<!-- 직원번호 db2 -->
								<tr>
									<th scope="row"><span>직원번호</span></th> 
									<td><input type="text" name="empNo" id="empNo" maxlength="50"></td>
										
								</tr>
								<!-- 공지글 제목 db3 -->
								<tr>
									<th scope="row"><span>제목</span></th>
									<td><input type="text" name="btitle" id="btitle" maxlength="50"></td>
								</tr>
								<!-- 공지글 내용 db5 -->
								<tr>
									<th scope="row"><span><label for="bContent">내용</label><span class="req">*</span></span></th>
									<td><textarea rows="30" cols="10" id="bContent" name="bContent" ></textarea></td>
								</tr>
								
							</tbody></table>
						</fieldset>
						
  <input type="submit" value="글쓰기" > 
  <input type="reset" value="다시작성">
					</form>

				</div>
</body>
</html>