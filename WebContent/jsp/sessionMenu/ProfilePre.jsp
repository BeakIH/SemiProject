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

</head>
<body>

          <!-- 프로필.html수정 -->
          
          <div class="col-md-7 col-lg-8 col-xl-8">
            <div class="page-header bordered">
              <h1>프로필 설정<small>BABSAZO에서 사용할 프로필을 설정해주세요</small></h1>
            </div>
            <form action="index.php">
              <h3 class="subheadline">기본 정보</h3>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label> 성</label>
                    <input type="text" class="form-control form-control-lg" placeholder="" value="밥">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>이름</label>
                    <input type="text" class="form-control form-control-lg" placeholder="" value="사조">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label>이메일</label>
                <input type="text" class="form-control form-control-lg" value="babsazo@email.com">
              </div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>휴대폰</label>
                    <input type="text" class="form-control form-control-lg" placeholder="" value="">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>집/팩스</label>
                    <input type="text" class="form-control form-control-lg" placeholder="" value="">
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label>회원님은 어떤 분이신가요?</label>
                <textarea class="form-control form-control-lg text-editor" placeholder=""></textarea>
              </div>
              <h3 class="subheadline">SNS</h3>
              <div class="form-group">
                <label>Twitter</label>
                <div class="input-group"> <span class="input-group-addon"><i class="fa fa-fw fa-twitter"></i></span>
                  <input type="text" class="form-control form-control-lg" placeholder="">
                </div>
              </div>
              <div class="form-group">
                <label>Facebook</label>
                <div class="input-group"> <span class="input-group-addon"><i class="fa fa-fw fa-facebook"></i></span>
                  <input type="text" class="form-control form-control-lg" placeholder="">
                </div>
              </div>
              <div class="form-group">
                <label>Google Plus</label>
                <div class="input-group"> <span class="input-group-addon"><i class="fa fa-fw fa-google-plus"></i></span>
                  <input type="text" class="form-control form-control-lg" placeholder="">
                </div>
              </div>
              <div class="form-group">
              
              <!-- 인스타그램으로 바꿔보기-->
                <label>Linkedin</label>
                <div class="input-group"> <span class="input-group-addon"><i class="fa fa-fw fa-linkedin"></i></span>
                  <input type="text" class="form-control form-control-lg" placeholder="">
                   
                </div>
              </div>
              <br>
              
              <h3 class="subheadline">거주지 또는 관심 BABSAZO 지역</h3>
              <div class="form-group">
                <label>예) 서울/종로구</label>
                <input type="text" class="form-control form-control-lg">
              </div>
              
              
              <div class="row">
              
              
              <!-- 주소 / 관심지역설정(?) 일단보류
                <div class="col-lg-6">
              
                  <div class="form-group">
                    <label>Location</label>
                    <input type="text" class="form-control form-control-lg" id="autocomplete" placeholder="Enter your location">
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control form-control-lg" placeholder="">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-6">
                  <div class="form-group">
                    <label>City</label>
                    <input type="text" class="form-control form-control-lg" placeholder="" id="locality">
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="form-group">
                    <label>State</label>
                    <input type="text" class="form-control form-control-lg" placeholder="" id="administrative_area_level_1">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-6">
                  <div class="form-group">
                    <label>Country</label>
                    <input type="text" class="form-control form-control-lg" placeholder="" id="country">
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="form-group">
                    <label>Zipcode</label>
                    <input type="text" class="form-control form-control-lg" placeholder="" id="postal_code">
                  --> 
                  
                  
                  
                  
                  </div> 
                </div>
              </div>
              <hr>
              <div class="form-group action">
                <button type="submit" class="btn btn-lg btn-primary">프로필 수정</button>
              </div>
            </form>
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
<script>
var placeSearch, autocomplete;
var componentForm = {
	//street_number: 'short_name',
	//route: 'long_name',
	locality: 'long_name',
	administrative_area_level_1: 'long_name',
	country: 'long_name',
	postal_code: 'long_name'
};

function initAutocomplete() {
	autocomplete = new google.maps.places.Autocomplete((document.getElementById('autocomplete')), {types: ['geocode']});
	autocomplete.addListener('place_changed', fillInAddress);
}

function fillInAddress() {
	var place = autocomplete.getPlace();
	for (var component in componentForm) {
		document.getElementById(component).value = '';
		document.getElementById(component).disabled = false;
	}
	
	for (var i = 0; i < place.address_components.length; i++) {
		var addressType = place.address_components[i].types[0];
		if (componentForm[addressType]) {
			var val = place.address_components[i][componentForm[addressType]];
			document.getElementById(addressType).value = val;
		}
	}
}
</script> 
<script src="https://maps.googleapis.com/maps/api/js?libraries=places&callback=initAutocomplete" async defer></script> 
<script>
	tinymce.init({
		selector: '.text-editor',
		height: 200,
		menubar: false,
		branding: false,
		plugins: [
			'lists link image preview',
		],
		toolbar: 'undo redo | link | formatselect | bold italic underline  | alignleft aligncenter alignright alignjustify | bullist numlist'
	});
        </script>
</body>
</html>