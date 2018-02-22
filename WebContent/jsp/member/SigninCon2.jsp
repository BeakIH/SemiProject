<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html> 
<head><title> </title></head>
<body>
<div class="container">
    <div class="row justify-content-md-center">
          <div class="col col-md-12 col-lg-10 col-xl-8">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">메인페이지</a></li>
            <li class="breadcrumb-item"><a href="#">계정</a></li>
            <li class="breadcrumb-item active" aria-current="page">로그인</li>
            </ol>
            </nav>
        <div class="page-header">
        <h1>B A B S A Z O</h1>
        </div>
      </div>
    </div>
  </div>
<div id="content">
  <div class="container">
    <div class="row justify-content-md-center align-items-center">
      <div class="col col-xs-6 col-lg-6 col-xl-6">
        <ul class="nav nav-tabs tab-lg" role="tablist">
          <li role="presentation" class="nav-item"><a class="nav-link active" href="signin.html">로그인</a></li>
        </ul>
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="login">
          
                
            <form method ="post" action="/SemiProject/jsp/login/login.do">
          
              <div class="form-group">
                <label for="text">아이디</label>
                <input type="text" name="userid" class="form-control form-control-lg" placeholder="아이디를 입력하세요">
              </div>
                      
              <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" name="userpw" class="form-control form-control-lg" placeholder="비밀번호를 입력하세요">
              </div>
        
        <p class="text-lg-right"><a href="forgot-password.html">비밀번호를 잊으셨나요?</a></p>
        
              <div class="checkbox">
                <input type="checkbox" id="remember_me">
                <label for="remember_me">아이디 기억하기</label>
              </div>
              <button type="submit" class="btn btn-primary btn-lg" > 로그인 </button> 
              <button type="submit" class="btn btn-primary btn-lg" style="margin-left: 40px" >회원가입</button>
            </form>
          </div>
        </div>
        <div> 
        </div>
      </div>
      
      <div class="col-md-3 col-lg-3 col-xl-3">
        <div class="socal-login-buttons"> 
        <a href="#" class="btn btn-social btn-block btn-twitter"><i class="icon fa fa-twitter"></i> 트위터로 시작하기</a> 

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.12&appId=598913833780626&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>

<br>
<br>




<head>
  <meta name="google-signin-client_id" content="1040068865620-q458emc189ucg0upk0j04g1tbmi15bn3.apps.googleusercontent.com	 
  .apps.googleusercontent.com">
</head>
<body>
  <div id="my-signin2"></div>
  <script>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 280,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>

  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
</body>
       
       
       <br>
       
 
       
       
       
      
 <div id="naver_id_login"></div>

  <script type="text/javascript">
  
  	var naver_id_login = new naver_id_login("2aXoBjqxKTuEIBd9PCM6", "YOUR_CALLBACK_URL");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3, 60);
  	naver_id_login.setDomain("YOUR_SERVICE_URL");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	
  </script>
  </div>
     
     <br>
       
       
       
          <a id="custom-login-btn" href="javascript:loginWithKakao()">
   <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/></a>
   <script type='text/javascript'>
    Kakao.init('5116b3bc667703bf84b154ab8a58f70a');
    function loginWithKakao() {
   Kakao.Auth.login({
   success: function(authObj) {
    alert(JSON.stringify(authObj));  },
      fail: function(err) {
       alert(JSON.stringify(err)); }  });    };  </script>
      
      
        </div>
      </div>
    </div>
  </div>

</body></html>