<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>공지 사항</title>

<!-- Bootstrap -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans"
	rel="stylesheet" />
<link href="../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../lib/animate.css" rel="stylesheet">
<link href="../lib/selectric/selectric.css" rel="stylesheet">
<link href="../lib/swiper/css/swiper.min.css" rel="stylesheet">
<link href="../lib/aos/aos.css" rel="stylesheet">
<link rel="stylesheet" href="../lib/photoswipe/photoswipe.css">
<link rel="stylesheet"
	href="../lib/photoswipe/default-skin/default-skin.css">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/notice.css" rel="stylesheet">



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../lib/jquery-3.2.1.min.js"></script>
<script src="../lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../lib/selectric/jquery.selectric.js"></script>
<script src="../lib/swiper/js/swiper.min.js"></script>
<script src="../lib/aos/aos.js"></script>
<script src="../lib/photoswipe/photoswipe.min.js"></script>
<script src="../lib/photoswipe/photoswipe-ui-default.min.js"></script>
<script src="../lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="../lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="../lib/lib.js"></script>



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
				<a class="navbar-brand" href="/SemiProject/jsp/storeList/main.do"><img
					src="../img/밥사조로고.png" alt="Smiley face" height="50" width="90"></a>
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
								밥사조 <span class="sr-only">(current)</span>
						</a>
							<div class="dropdown-menu">
								<a href="/SemiProject/jsp/storeList/main.do" class="dropdown-item">밥사조 이야기</a> <a
									href="/SemiProject/jsp/storeList/main.do" class="dropdown-item">밥사조 식구들</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								조회 </a>
							<div class="dropdown-menu">
								<a href="/SemiProject/jsp/storeList/list.do" class="dropdown-item">목록보기</a>
							</div></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								매장소식 </a>
							<div class="dropdown-menu">
								<a href="notice.do" class="dropdown-item">공지사항</a> <a
									href="/SemiProject/jsp/sessionMenu/404.do" class="dropdown-item">매장별 이용후기</a>
							</div></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								도움말 </a>
							<div class="dropdown-menu">
								<a href="/SemiProject/jsp/sessionMenu/404.do" class="dropdown-item">자주묻는 질문</a> <a
									href="/SemiProject/jsp/sessionMenu/404.do" class="dropdown-item"> 1:1 문의</a>
							</div></li>

					</ul>

					<ul class="navbar-nav ml-auto">
<c:choose>
<c:when test= "${check==null}">
      <li class="nav-item dropdown user-account">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="user-image" style="background-image:url(' img/demo/profile3.jpg');"></span> 안녕하세요  </a> 
        <div class="dropdown-menu">
            <a href="/SemiProject/jsp/storeList/main.do" class="dropdown-item"> <i class="fa fa-home"></i> 메인으로 </a>
            <a href="/SemiProject/jsp/storeList/list.do" class="dropdown-item"> <i class="fa fa fa-utensils"></i> 매장조회</a> 
            <!-- <a href="my_membership.html" class="dropdown-item">Membership</a>
            <a href="my_payments.html" class="dropdown-item">Payments</a> -->
            <!-- <a href="../login/logutPro.jsp" class="dropdown-item">로그아웃</a> -->
             <!--  <li class="nav-item add-listing"><a class="nav-link" href="/jsp/login/logout.jsp"><span><i class="fa fa-plus" aria-hidden="true"></i> 로그아웃 </span></a></li> -->
        </div>
      </li>
      <div>
      <button class="btn btn-primary" type="button" style="margin-top:20px" onClick="window.location='/SemiProject/jsp/member/SigninCon.do'"><i class="fa fa-power-off">&nbsp;</i> 로그인 </a></button>
       <!-- <button class="btn btn-primary" type="button" onClick="window.location='/SemiProject/jsp/login/logout.do'"><i class="fa fa-power-off">&nbsp;</i> 로그아웃 </a></button> -->
       <!-- <li class="nav-item add-listing"><button class="btn btn-primary" type="button" onClick="window.location='/SemiProject/jsp/login/logout.do'"><span><i class="fa fa-power-off">&nbsp;</i> 로그아웃</span></a></li> -->
		</div>   
    </ul>

				</div>
			</div>
		</nav>
</c:when>
<c:when test = "${check == 1 }">
      <li class="nav-item dropdown user-account">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="user-image" style="background-image:url(' img/demo/profile3.jpg');"></span> ${name}님, 어서오세요 
        </a>
        <div class="dropdown-menu">
            <a href="/SemiProject/jsp/sessionMenu/404.do" class="dropdown-item"><i class="fa fa-bell"></i> 내 예약보기  </a>
            <a href="/SemiProject/jsp/sessionMenu/MyCoupon.do" class="dropdown-item"><i class="fa fa-fw fa-address-book"></i> 내 쿠폰보기 <a>
            <a href="/SemiProject/jsp/sessionMenu/404.do" class="dropdown-item"><i class="fa fa-fw fa-thumbs-up" size = 5px></i> 내가 쓴 글보기 </a>
            <!-- <a href="my_membership.html" class="dropdown-item">Membership</a>
            <a href="my_payments.html" class="dropdown-item">Payments</a> -->
            <!-- <a href="../login/logutPro.jsp" class="dropdown-item">로그아웃</a> -->
             <!--  <li class="nav-item add-listing"><a class="nav-link" href="/jsp/login/logout.jsp"><span><i class="fa fa-plus" aria-hidden="true"></i> 로그아웃 </span></a></li> -->
        </div>
      </li>
      <div>
      <!-- <button class="btn btn-primary" type="button" onClick="window.location='/SemiProject/jsp/member/SigninCon.do'"><i class="fa fa-power-off">&nbsp;</i> 로그인 </a></button> -->
       <button class="btn btn-primary" type="button" style="margin-top:20px" onClick="window.location='/SemiProject/jsp/login/logout.do'"><i class="fa fa-power-off">&nbsp;</i> 로그아웃 </a></button>
       <!-- <li class="nav-item add-listing"><button class="btn btn-primary" type="button" onClick="window.location='/SemiProject/jsp/login/logout.do'"><span><i class="fa fa-power-off">&nbsp;</i> 로그아웃</span></a></li> -->
    	</div>
    </ul>

				</div>
			</div>
		</nav> 
</c:when>
<c:when test = "${check == 2 }">
      <li class="nav-item dropdown user-account">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="user-image" style="background-image:url(' img/demo/profile3.jpg');"></span>관리자 ${name}님, 어서오세요 
        </a>
        <div class="dropdown-menu">
            <a href="/SemiProject/jsp/admin/bookingList.do?store_no=${storeNo }" class="dropdown-item"><i class="fa fa-bell"></i> 예약현황 </a>
            <a href="/SemiProject/jsp/admin/management_list.do?store_no=${storeNo }" class="dropdown-item"><i class="fa fa-fw fa-address-book"></i> 직원조회 <a>
            <a href="/SemiProject/jsp/sessionMenu/404.do" class="dropdown-item"><i class="fa fa-fw fa-thumbs-up" size = 5px></i> 우리매장후기 </a>

            <!-- <a href="my_membership.html" class="dropdown-item">Membership</a>
            <a href="my_payments.html" class="dropdown-item">Payments</a> -->
            <!-- <a href="../login/logutPro.jsp" class="dropdown-item">로그아웃</a> -->
             <!--  <li class="nav-item add-listing"><a class="nav-link" href="/jsp/login/logout.jsp"><span><i class="fa fa-plus" aria-hidden="true"></i> 로그아웃 </span></a></li> -->
        </div>
      </li>
      <div>
      <!-- <button class="btn btn-primary" type="button" onClick="window.location='/SemiProject/jsp/member/SigninCon.do'"><i class="fa fa-power-off">&nbsp;</i> 로그인 </a></button> -->
       <button class="btn btn-primary" type="button" style="margin-top:20px" onClick="window.location='/SemiProject/jsp/login/logout.do'"><i class="fa fa-power-off">&nbsp;</i> 로그아웃 </a></button>
       <!-- <li class="nav-item add-listing"><button class="btn btn-primary" type="button" onClick="window.location='/SemiProject/jsp/login/logout.do'"><span><i class="fa fa-power-off">&nbsp;</i> 로그아웃</span></a></li> -->
    	</div>
    </ul>
				</div>
			</div>
		</nav> 
</c:when>
</c:choose>

	</div>
	</nav>
	</div>
	</div>
	</div>
	</nav>
	<div class="inquiry_data_table">
		<h4 class="inquiry_title">
			<span style="visibility: hidden; position: absolute">공지사항</span>
		</h4>
		<span class="inquiry_required"><span class="txt_red ">&nbsp;*&nbsp;</span>
			표시는 필수입력사항입니다.</span>

		<form method="post" name="writeform"
			action="/SemiProject/notice/writePro.do?pageNum=${pageNum}"
			onsubmit="return writeSave()">
			<input type="hidden" name="b_no" value="${b_no}">


			<fieldset>
									<ul style="margin-bottom:0px;">
							<li colspan="2" style="text-align: right;list-style:none;margin-bottom:0px;padding-left:0px;"><a
								href="/SemiProject/notice/notice.do"
								class="btn btn-lg btn-primary">글목록</a></li>
						</ul>
					<ul class="top_title_faq">
						<li class="title">매장명 : ${storeNm}</li>
						<li class="stit_area"><span>직원명<span
								class="regist_day">${name}</span></span> 

						</li>
					</ul>
					<input type="hidden" name="emp_nm" value="${name}">
					<input type="hidden" name="emp_no" value="${empno}">
					<input type="hidden" name="store_no" value="${storeNo}">

				<table class="inquiry_data">


					<tbody>

						<!-- 공지글 제목 db3 -->
						<tr style="align-text: center;">
							<th><span style="padding-left: 36%;">제목</span></th>
							<td><input type="text" name="b_title" id="b_title"
								style="width: 1000px;"></td>
						</tr>
						<!-- 공지글 내용 db5 -->
						<tr>
							<th scope="row"><span style="padding-left: 36%;">내용</span></th>
							<td><textarea style="width: 1000px;height:300px;"
									b_content" name="b_content"></textarea></td>
						</tr>
												<tr>
							<td colspan="2" style="text-align: right;">비밀번호 <input
								type="text" name="board_pw" id="board_pw" style="width: 100px;"></td>
						</tr>

					</tbody>
				</table>
			</fieldset>
			<br> <input type="submit" value="글쓰기"
				class="btn btn-lg btn-primary"> <input type="reset"
				value="다시작성" class="btn btn-lg btn-primary">
		</form>

	</div>
	<footer id="footer">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col col-md-10">
					<div class="row">
						<div class="col-md-4 col-sm-4">
							<!-- <p><span class="icon-uilove-realestate"></span></p> -->
							<p>
								<span><img src="../img/밥사조로고.png" alt="Smiley face"
									height="60" width="120"></span>
							</p>
							<address>
								<strong>BABSAZO, Inc.</strong><br> 서울특별시 중구 남대문로 120<br>
								대일빌딩3층 D CLASS<br>
								<!-- <abbr title="Phone">P:</abbr> (123) 456-7890 -->
							</address>
							<p class="text-muted">
								Copyright &copy; 2018<br /> All rights reserved
							</p>
						</div>
						<div class="col-md-4  col-sm-4">
							<ul class="list-unstyled">
								<li><a href="#"> About BABSAZO </a></li>
								<li><a href="#"> BABSAZO Introduction </a></li>
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
							<div class="social-sharebox">
								<a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-google"></i></a> <a href="#"><i
									class="fa fa-linkedin"></i></a> <a href="#"><i
									class="fa fa-youtube-play"></i></a> <a href="#"><i
									class="fa fa-pinterest"></i></a>
							</div>
							<form>
								<h4>밥사조 소식 받아보기</h4>
								<div class="input-group input-group-lg">
									<input type="email" class="form-control form-control-lg"
										placeholder="Email Address"> <span
										class="input-group-btn">
										<button class="btn btn-primary" type="button">구독</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>