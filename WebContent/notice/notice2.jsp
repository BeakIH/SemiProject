<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Real Estate</title>
 
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
<title>Insert title here</title>
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
<!-- 게시판 시작 -->
<!-- 글수 0 -->
<div class="list_view_content">
	
<div id="content" class="content_mall" tabindex="0">
<h2 style=text-align:center;>공지사항</h2>
	<div class="view_layout">
		<div class="notice_bbs">

			<!-- list_view_wrapper -->
			<div class="list_view_wrapper">
				<!-- search form -->
				
					<fieldset>
						<legend style=visibility:hidden;>검색</legend>
						<div class="search_area">
							<select name="searchType" id="searchType" title="검색어 유형 선택">
								<option value="" selected="selected">전체</option>
								<option value="T">제목</option>
								<option value="C">내용</option>
								<option value="S">매장명</option>
							</select>
							<input type="text" name="searchWord" id="searchWord" class="searchword" value="" placeholder="검색어를 입력하세요" title="검색어를 입력하세요">
							<button class="submit"><span class="m_txt">검색하기</span></button>
						</div>
</fieldset>

<div style="float:right;">
<a href="notice2.do" class="list-btn btn-primary">목록(전체 글:${count})</a>
</div>
				


							
							
													<div class="list_view_content">
													<div class="header_group">
							<ul class="header_group clfix">
								<li class="table_header cell01">번호</li>
								<li class="table_header cell02">제목</li>
								<li class="table_header cell03">게시일자</li>
								<li class="table_header cell04">조회수</li>
								<li class="table_header cell05">직원명</li>
								<li class="table_header cell06">직원번호</li>
							</ul>
							</div>
							</div>
							<c:if test="${count == 0}">게시판 저장된 글 없음</c:if>
 
<c:if test="${count > 0}">						 
  <c:forEach var="article" items="${articleList}">
  <div class="list_view_content">
  <div class="row_group">
  
		<ul class="row_group clfix">
							 								
		  <li class="cell01"><!-- 번호 -->
									<c:out value="${number}"/>
  <c:set var="number" value="${number - 1}"/></li>
									<li class="cell02"><!-- 제목 -->
									<a href="/SemiProject/notice/Content.do?bNo=${article.bNo}&pageNum=${currentPage}">
          ${article.bTitle}</a></li>
									<li class="cell03"><!-- 게시일자 -->
									<span><c:set var="pd" value="${article.postDate}"/>
									${fn:substring(pd,0,10) }
									</span></li>
									<li class="cell04"><!-- 조회수 -->
									<span>${article.bViewCnt}</span></li>
									<li class="cell05"><!-- 직원명 -->
									<span>${article.empNm}</span></li>
									<li class="cell06"><!-- 직원번호 -->
									<span>${article.empNo}</span></li>
								</ul>
								</div>
								</div>
 							 </c:forEach>
 							 </c:if>
 							 <c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if>
   
   <c:if test="${startPage > 10}">
        <a href="/SemiProject/notice/notice2.do?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/SemiProject/notice/notice2.do?pageNum=${i}"><div style="visibility:hidden">[${i}]</div></a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/SemiProject/notice/notice2.do?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
   <div class="pagenate_area">
   							<ul class="pagenate">
								
									<li>
<a href="?page=1" onclick="linkPage(1);return false; " class="ctrl">
<img src="../img/page/btn_list_first.gif" alt="처음 페이지로 이동"></a></li>
<li><a href="?pageNum=1" onclick="linkPage(1);return false; " class="ctrl prev">
<img src="../img/page/btn_list_prev.gif" alt="이전 페이지로 이동"></a></li>

<c:choose>
<c:when test="${currentPage == 1}">
<li><strong title="현재 1페이지">1</strong></li>
<li><a href="?pageNum=2" onclick="linkPage(2);return false; " title="2페이지로 이동">2</a></li>
<li><a href="?pageNum=3" onclick="linkPage(3);return false; " title="3페이지로 이동">3</a></li>
<li><a href="?pageNum=4" onclick="linkPage(4);return false; " title="4페이지로 이동">4</a></li>
<li><a href="?pageNum=5" onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
</c:when>
<c:when test="${currentPage == 2}">
<li><a href="?pageNum=1" onclick="linkPage(1);return false; " title="1페이지로 이동">1</a></li>
<li><strong title="현재 2페이지">2</strong></li>
<li><a href="?pageNum=3" onclick="linkPage(3);return false; " title="3페이지로 이동">3</a></li>
<li><a href="?pageNum=4" onclick="linkPage(4);return false; " title="4페이지로 이동">4</a></li>
<li><a href="?pageNum=5" onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
</c:when>
<c:when test="${currentPage == 3}">
<li><a href="?pageNum=1" onclick="linkPage(1);return false; " title="1페이지로 이동">1</a></li>
<li><a href="?pageNum=2" onclick="linkPage(2);return false; " title="2페이지로 이동">2</a></li>
<li><strong title="현재 3페이지">3</strong></li>
<li><a href="?pageNum=4" onclick="linkPage(4);return false; " title="4페이지로 이동">4</a></li>
<li><a href="?pageNum=5" onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
</c:when>
<c:when test="${currentPage == 4}">
<li><a href="?pageNum=1" onclick="linkPage(1);return false; " title="1페이지로 이동">1</a></li>
<li><a href="?pageNum=2" onclick="linkPage(2);return false; " title="2페이지로 이동">2</a></li>
<li><a href="?pageNum=3" onclick="linkPage(3);return false; " title="3페이지로 이동">3</a></li>
<li><strong title="현재 4페이지">4</strong></li>
<li><a href="?pageNum=5" onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
</c:when>
<c:when test="${currentPage == 5}">
<li><a href="?pageNum=1" onclick="linkPage(1);return false; " title="1페이지로 이동">1</a></li>
<li><a href="?pageNum=2" onclick="linkPage(2);return false; " title="2페이지로 이동">3</a></li>
<li><a href="?pageNum=3" onclick="linkPage(3);return false; " title="3페이지로 이동">4</a></li>
<li><a href="?pageNum=4" onclick="linkPage(4);return false; " title="4페이지로 이동">5</a></li>
<li><strong title="현재 5페이지">5</strong></li>
</c:when>
<c:otherwise>
<li><strong title="현재 1페이지">1</strong></li>
<li><a href="?pageNum=2" onclick="linkPage(2);return false; " title="2페이지로 이동">2</a></li>
<li><a href="?pageNum=3" onclick="linkPage(3);return false; " title="3페이지로 이동">3</a></li>
<li><a href="?pageNum=4" onclick="linkPage(4);return false; " title="4페이지로 이동">4</a></li>
<li><a href="?pageNum=5" onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
</c:otherwise>
</c:choose>

<li><a href="?pageNum=6" onclick="linkPage(6);return false; " class="ctrl next">

<img src="../img/page/btn_list_next.gif" alt="다음 페이지로 이동"></a></li>
<li><a href="?pageNum=8" onclick="linkPage(8);return false; " class="ctrl last">
<img src="../img/page/btn_list_last.gif" alt="마지막 페이지로 이동"></a></li>



								
							</ul>
         </div>
</c:if>

 																	<div style="float:right;" >
<a href="/SemiProject/notice/writeForm.do" class="btn btn-lg btn-primary">글쓰기</a>
</div>			

			</div>
			
		</div>
	</div>

	<br>
	<br>
	<br>
				</div>
				</div>
				</div>
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
</body>
</html>