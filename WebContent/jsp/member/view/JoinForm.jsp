<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate.css" rel="stylesheet">
<link href="lib/selectric/selectric.css" rel="stylesheet">
<link href="lib/aos/aos.css" rel="stylesheet">
<link href="lib/Magnific-Popup/magnific-popup.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="lib/jquery-3.2.1.min.js"></script>
<script src="lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script src="lib/selectric/jquery.selectric.js"></script>
<script src="lib/aos/aos.js"></script>
<script src="lib/Magnific-Popup/jquery.magnific-popup.min.js"></script>
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
 
         <article class="container">
        <div class="page-header">
          <h1>회원가입 <small> BABSAZO 회원만의 다양한 할인 혜택 및 프로모션이 기다리고 있어요!</small></h1>
        </div>
        
        
        <div class="col-md-6 col-md-offset-3">
        
        <div class="form-group">
        
 
            <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.mem_id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
                
           
            }
        }
        
        // 취소 버튼 클릭시 로그인 화면으로 이동
        function goLoginForm() {
            location.href="LoginForm.jsp";
        }
    </script>
    
    
   <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
    <form method="post" action="/SemiProject/test.do" name="userInfo" onsubmit="return checkValue()">
                
      
                 <table>
                 
                   <tr>
               <div class="form-group">
              <label for="birth"><font size="4em" color="52478B">생년월일 또는 기념일</font></label>
                <td id="title"></td> 
              <input type="text" name="mem_no" maxlength="4" placeholder="년(4자)" size="6" >  
                      &nbsp;<select name="birthmm">
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
                    </td>
                </tr>
                <p class="help-block">기념일 입력시 쿠폰을 발급해드려요</p> </div>
          
          <br>
          
             
                    <tr>
                <div class="form-group">
               <label for="username"><font size="4em" color="52478B">이름</font></label>
               <td id="title"></td>
              <input type="text" name="mem_nm" maxlength="50" class="form-control" id="username" placeholder="이름을 입력해 주세요">
            </div></tr>
                    
                    <br>
                
                <tr>
                      <div class="form-group">
              <label for="username"><font size="4em" color="52478B">회원 아이디</font></label>
              <td id="title"></td>
              <div class="input-group">
                <input type="text" name="mem_id" maxlength="50" class="form-control" id="username" placeholder="사용하실 아이디를 입력해 주세요">
                <span class="input-group-btn">
                  <button class="btn btn-warning"><font color="F9FFFF">아이디 중복 체크</font><i class="fa fa-edit spaceLeft"></i></button>
                </span>
                    </tr> 
                </div>
  
                        <br>
                        
                <tr>                
              <div class="form-group">
              <label for="InputPassword1"><font size="4em" color="52478B">비밀번호</font></label>
                    <td id="title"></td>              
              <input type="password" name="mem_pw" maxlength="50" class="form-control" id="InputPassword1" placeholder="비밀번호">
            </div>
              </tr>
              
              <br>
              
                <tr>
            <div class="form-group">
              <label for="InputPassword2"><font size="4em" color="52478B">비밀번호 확인</font></label>
                <td id="title"></td>
              <input type="password" name="passwordcheck" maxlength="50" class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
               <p class="help-block">비밀번호 확인을 위해 다시한번 입력해주세요</p>
          </div></tr>
          
                  <br>
                                      
                                                      
          <div class="form-group">
              <label for="username"><font size="4em" color="52478B">휴대폰 번호</font></label>
              <td id="title"></td>
              <input type="tel" name="mem_tel" class="form-control" id="username" placeholder="- 없이 입력해 주세요"></div>
               
              <div> <input type="checkbox" name="chk_info" value="동의">휴대폰 수신에 동의합니다</div>
              <div><p class="help-block">(모바일 전용 쿠폰 및 게릴라 할인시 푸시 알림을 받으실 수 있어요)</p></div>
          
          <!-- 인증번호 전송 기능은 별도 사이트에서 구입필요
            <span class="input-group-btn"> 
                  <button class="btn btn-warning"><font color="#F9FFFFE">인증번호 전송</font><i class="fa fa-mail-forward spaceLeft"></i></button>
                </span> -->
   
               <br>
                  
             <div class="form-group">
              <label for="username"><font size="4em" color="52478B">주소</font></label>
              <td id="title"></td>
              <div class="input-group">
                <input type="text" name="address" class="form-control" id="username" placeholder="도로명/지번/동·읍·면">
                <span class="input-group-btn">
   
                  <a href="DoroEx.jsp" class="btn btn-warning"><font color="F9FFFF">우편번호 검색</font><i class="fa fa-mail-forward spaceLeft"></i></a> 
                </span>
              </div>
                <div class="form-group">
                <input type="text" class="form-control" id="username" placeholder="상세 주소를 입력해 주세요">
            </div>
            <div> <input type="checkbox" name="chk_info" value="동의">우편으로 BABSAZO 소식지를 받겠습니다</div>
              <div><p class="help-block">(BABSAZO 소식지 전용 쿠폰 및 새로운 BABSAZO 제일 먼저 받아보세요)</p></div>
            
            <br> 
            
            
            <div class="form-group">
              <label for="InputEmail"><font size="4em" color="52478B">이메일 주소</label></font>
              <td id="title"></td>
              <input type="text" name="email" class="form-control" id="username" placeholder="이메일을 입력해 주세요">
            </div>
            <!-- 
                         <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>  -->
            
            <div> <input type="checkbox" name="email_yn" value="동의">이메일 수신에 동의합니다</div>
              <div><p class="help-block">(이메일 BABSAZO 뉴스레터 쿠폰 발급과 이벤트 참여가 가능합니다)</p></div>
            
            <br>
            
            <!-- 
                <tr>
                 <div class="form-group">
               <label for="username"><font size="4em" color="52478B">성별</label>
               <td id="title"></td> 
              <input type="radio" name="gender" value="남" checked >남
              <input type="radio" name="gender" value="여" checked>여
                  </font>  </td>
                </tr>
                    
                    <br><br>  -->
                    
     
            
              <div class="form-group">
              <label for="username"><font size="4em" color="52478B">SNS/블로그</font></label>
              <td id="title"></td>
              <input type="text" name="sns" class="form-control" id="username" placeholder="SNS ID 혹은 블로그 주소를 입력해 주세요">
                 <p class="help-block"> 각종 공유 활동으로 BABSAZO 포인트를 적립할 수 있습니다</p>
            </div>
            
            <br>
            
            <div class="form-group">
               <label for="username"><font size="4em" color="52478B"><label for="username">선호하는 음식(중복선택 가능)</font></label>
            <td id="title"></td>
                 
           <div> <input type="checkbox" name="chk_info" value="한식">한식
                 <input type="checkbox" name="chk_info" value="중식">중식
                 <input type="checkbox" name="chk_info" value="일식">일식 
                 <input type="checkbox" name="chk_info" value="양식">양식
                 <input type="checkbox" name="chk_info" value="세계음식">세계음식
                 <input type="checkbox" name="chk_info" value="디저트">디저트 
                 <div> 
                 <input type="checkbox" name="chk_info" value="밥">밥
                 <input type="checkbox" name="chk_info" value="면">면
                 <input type="checkbox" name="chk_info" value="분식">분식  
                 <input type="checkbox" name="chk_info" value="채식">채식
                 <input type="checkbox" name="chk_info" value="육류">육류
                 <input type="checkbox" name="chk_info" value="후식">후식   
              </div>
              </div>
              <input type="text" name="fav" class="form-control" id="username" placeholder="기타">
            </div>
            
           </div>
   
   
   <!-- 
            <input type="submit" value="가입"/>  
            <input type="button" value="취소" onclick="goLoginForm()">
      -->
    
</table>
<br>             
            <div class="form-group">
               <div data-toggle="buttons">
              <label class="btn btn-info active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
              <a href="#"><font size="4em">이용약관 및 개인정보 처리방침에 동의합니다.(필수)</a></font>
              </div>
            </div>
            <div class="row justify-content-md-center">
              <form action="#"><button type="submit" class="btn btn-warning"><font color="#800080"></font>회원가입<i class="fa fa-check spaceLeft"></i></button></form>
              &nbsp; <form action="#"><button type="submit" class="btn btn-danger">가입취소<i class="fa fa-times spaceLeft"></i></button></form>
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
                <input type="email" class="form-control" placeholder="Email Address">
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

</body></html>