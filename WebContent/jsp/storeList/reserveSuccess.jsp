<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>BABSAZO</title>
<!-- ㅇㅇ -->
<!-- Bootstrap -->
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans" rel="stylesheet" />
<link href="../../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../lib/animate.css" rel="stylesheet">
<link href="../../lib/selectric/selectric.css" rel="stylesheet">
<link href="../../lib/aos/aos.css" rel="stylesheet">
<link href="../../lib/Magnific-Popup/magnific-popup.css" rel="stylesheet">
<link href="../../css/style.css" rel="stylesheet">

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
<script src="../../lib/lib.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
 <script type="text/javascript">
 

 
 function  MovePage(){
 window.opener.top.location.href="./main.jsp"
 window.close()
 }


 </script>
</head>
<body>

  
<div id="content">
  <div class="container">
    <div class="row justify-content-md-center">
      <div class="col col-lg-12">
        <div class="error-template text-center"> <i class="fa fa-check fa-5x text-success mb50 animated zoomIn"></i>
          <h3 class="main-title centered"><span>예약 신청이 되었습니다.</span></h3>
          <div class="main-title-description"> 
          	 예약 내역 확인 페이지에서 예약이 완료가 되었는지 확인 바랍니다.<br>
          	 <h4 style="color:red;">매장에서 예약 완료까지 약간의 시간이 소요 될 수 있습니다.</h4> 
          	<br><br> 매장을 이용해주셔서 감사합니다. <br> 최선을 다해 모시겠습니다. <br>
          	</div>
          <div class="error-actions"><a  href='javascript:MovePage()'; class="btn btn-primary btn-lg" onclick='javascript()'>예약내역확인 </a> </div>
        </div>
      </div>
    </div>
  </div>
</div>





</body></html>