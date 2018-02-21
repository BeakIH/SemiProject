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
          <h1>ȸ������ <small> BABSAZO ȸ������ �پ��� ���� ���� �� ���θ���� ��ٸ��� �־��!</small></h1>
        </div>
        
        
        <div class="col-md-6 col-md-offset-3">
        
        <div class="form-group">
        
 
            <script type="text/javascript">
    
        // �ʼ� �Է������� ���̵�, ��й�ȣ�� �ԷµǾ����� Ȯ���ϴ� �Լ�
        function checkValue()
        {
            if(!document.userInfo.mem_id.value){
                alert("���̵� �Է��ϼ���.");
                return false;
            }
            
            if(!document.userInfo.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
            // ��й�ȣ�� ��й�ȣ Ȯ�ο� �Էµ� ���� �������� Ȯ��
            if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
                return false;
                
           
            }
        }
        
        // ��� ��ư Ŭ���� �α��� ȭ������ �̵�
        function goLoginForm() {
            location.href="LoginForm.jsp";
        }
    </script>
    
    
   <!-- �Է��� ���� �����ϱ� ���� form �±׸� ����Ѵ� -->
        <!-- ��(�Ķ����) ������ POST ���, ������ �������� JoinPro.jsp -->
    <form method="post" action="/SemiProject/test.do" name="userInfo" onsubmit="return checkValue()">
                
      
                 <table>
                 
                   <tr>
               <div class="form-group">
              <label for="birth"><font size="4em" color="52478B">������� �Ǵ� �����</font></label>
                <td id="title"></td> 
              <input type="text" name="mem_no" maxlength="4" placeholder="��(4��)" size="6" >  
                      &nbsp;<select name="birthmm">
                            <option value="">��</option>
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
                     &nbsp; <input type="text" name="birthdd" maxlength="2" placeholder="��" size="6" >
                    </td>
                </tr>
                <p class="help-block">����� �Է½� ������ �߱��ص����</p> </div>
          
          <br>
          
             
                    <tr>
                <div class="form-group">
               <label for="username"><font size="4em" color="52478B">�̸�</font></label>
               <td id="title"></td>
              <input type="text" name="mem_nm" maxlength="50" class="form-control" id="username" placeholder="�̸��� �Է��� �ּ���">
            </div></tr>
                    
                    <br>
                
                <tr>
                      <div class="form-group">
              <label for="username"><font size="4em" color="52478B">ȸ�� ���̵�</font></label>
              <td id="title"></td>
              <div class="input-group">
                <input type="text" name="mem_id" maxlength="50" class="form-control" id="username" placeholder="����Ͻ� ���̵� �Է��� �ּ���">
                <span class="input-group-btn">
                  <button class="btn btn-warning"><font color="F9FFFF">���̵� �ߺ� üũ</font><i class="fa fa-edit spaceLeft"></i></button>
                </span>
                    </tr> 
                </div>
  
                        <br>
                        
                <tr>                
              <div class="form-group">
              <label for="InputPassword1"><font size="4em" color="52478B">��й�ȣ</font></label>
                    <td id="title"></td>              
              <input type="password" name="mem_pw" maxlength="50" class="form-control" id="InputPassword1" placeholder="��й�ȣ">
            </div>
              </tr>
              
              <br>
              
                <tr>
            <div class="form-group">
              <label for="InputPassword2"><font size="4em" color="52478B">��й�ȣ Ȯ��</font></label>
                <td id="title"></td>
              <input type="password" name="passwordcheck" maxlength="50" class="form-control" id="InputPassword2" placeholder="��й�ȣ Ȯ��">
               <p class="help-block">��й�ȣ Ȯ���� ���� �ٽ��ѹ� �Է����ּ���</p>
          </div></tr>
          
                  <br>
                                      
                                                      
          <div class="form-group">
              <label for="username"><font size="4em" color="52478B">�޴��� ��ȣ</font></label>
              <td id="title"></td>
              <input type="tel" name="mem_tel" class="form-control" id="username" placeholder="- ���� �Է��� �ּ���"></div>
               
              <div> <input type="checkbox" name="chk_info" value="����">�޴��� ���ſ� �����մϴ�</div>
              <div><p class="help-block">(����� ���� ���� �� �Ը��� ���ν� Ǫ�� �˸��� ������ �� �־��)</p></div>
          
          <!-- ������ȣ ���� ����� ���� ����Ʈ���� �����ʿ�
            <span class="input-group-btn"> 
                  <button class="btn btn-warning"><font color="#F9FFFFE">������ȣ ����</font><i class="fa fa-mail-forward spaceLeft"></i></button>
                </span> -->
   
               <br>
                  
             <div class="form-group">
              <label for="username"><font size="4em" color="52478B">�ּ�</font></label>
              <td id="title"></td>
              <div class="input-group">
                <input type="text" name="address" class="form-control" id="username" placeholder="���θ�/����/����������">
                <span class="input-group-btn">
   
                  <a href="DoroEx.jsp" class="btn btn-warning"><font color="F9FFFF">�����ȣ �˻�</font><i class="fa fa-mail-forward spaceLeft"></i></a> 
                </span>
              </div>
                <div class="form-group">
                <input type="text" class="form-control" id="username" placeholder="�� �ּҸ� �Է��� �ּ���">
            </div>
            <div> <input type="checkbox" name="chk_info" value="����">�������� BABSAZO �ҽ����� �ްڽ��ϴ�</div>
              <div><p class="help-block">(BABSAZO �ҽ��� ���� ���� �� ���ο� BABSAZO ���� ���� �޾ƺ�����)</p></div>
            
            <br> 
            
            
            <div class="form-group">
              <label for="InputEmail"><font size="4em" color="52478B">�̸��� �ּ�</label></font>
              <td id="title"></td>
              <input type="text" name="email" class="form-control" id="username" placeholder="�̸����� �Է��� �ּ���">
            </div>
            <!-- 
                         <select name="mail2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>  -->
            
            <div> <input type="checkbox" name="email_yn" value="����">�̸��� ���ſ� �����մϴ�</div>
              <div><p class="help-block">(�̸��� BABSAZO �������� ���� �߱ް� �̺�Ʈ ������ �����մϴ�)</p></div>
            
            <br>
            
            <!-- 
                <tr>
                 <div class="form-group">
               <label for="username"><font size="4em" color="52478B">����</label>
               <td id="title"></td> 
              <input type="radio" name="gender" value="��" checked >��
              <input type="radio" name="gender" value="��" checked>��
                  </font>  </td>
                </tr>
                    
                    <br><br>  -->
                    
     
            
              <div class="form-group">
              <label for="username"><font size="4em" color="52478B">SNS/��α�</font></label>
              <td id="title"></td>
              <input type="text" name="sns" class="form-control" id="username" placeholder="SNS ID Ȥ�� ��α� �ּҸ� �Է��� �ּ���">
                 <p class="help-block"> ���� ���� Ȱ������ BABSAZO ����Ʈ�� ������ �� �ֽ��ϴ�</p>
            </div>
            
            <br>
            
            <div class="form-group">
               <label for="username"><font size="4em" color="52478B"><label for="username">��ȣ�ϴ� ����(�ߺ����� ����)</font></label>
            <td id="title"></td>
                 
           <div> <input type="checkbox" name="chk_info" value="�ѽ�">�ѽ�
                 <input type="checkbox" name="chk_info" value="�߽�">�߽�
                 <input type="checkbox" name="chk_info" value="�Ͻ�">�Ͻ� 
                 <input type="checkbox" name="chk_info" value="���">���
                 <input type="checkbox" name="chk_info" value="��������">��������
                 <input type="checkbox" name="chk_info" value="����Ʈ">����Ʈ 
                 <div> 
                 <input type="checkbox" name="chk_info" value="��">��
                 <input type="checkbox" name="chk_info" value="��">��
                 <input type="checkbox" name="chk_info" value="�н�">�н�  
                 <input type="checkbox" name="chk_info" value="ä��">ä��
                 <input type="checkbox" name="chk_info" value="����">����
                 <input type="checkbox" name="chk_info" value="�Ľ�">�Ľ�   
              </div>
              </div>
              <input type="text" name="fav" class="form-control" id="username" placeholder="��Ÿ">
            </div>
            
           </div>
   
   
   <!-- 
            <input type="submit" value="����"/>  
            <input type="button" value="���" onclick="goLoginForm()">
      -->
    
</table>
<br>             
            <div class="form-group">
               <div data-toggle="buttons">
              <label class="btn btn-info active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
              <a href="#"><font size="4em">�̿��� �� �������� ó����ħ�� �����մϴ�.(�ʼ�)</a></font>
              </div>
            </div>
            <div class="row justify-content-md-center">
              <form action="#"><button type="submit" class="btn btn-warning"><font color="#800080"></font>ȸ������<i class="fa fa-check spaceLeft"></i></button></form>
              &nbsp; <form action="#"><button type="submit" class="btn btn-danger">�������<i class="fa fa-times spaceLeft"></i></button></form>
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