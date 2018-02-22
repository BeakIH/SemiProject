<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html> 
<head><title> </title></head>
<body> 
<div class="col-md-7 col-lg-8 col-xl-8">
            <div class="page-header bordered mt0">
              <h1>밥사조 <small>예약 현황나열</small></h1>
            </div>
            <div class="sorting">
              <div class="row justify-content-between">
              <div class="col-sm-5 col-md-5 col-lg-4 col-xl-4">
              <div class="form-group">
                  <select class="form-control ui-select">
                    <option selected="selected">선택하세요</option>
                    <option>등록일순</option>
                    <option>당일예약</option>
                  </select>
                </div>
              </div>
              <div class="col-sm-6 col-md-5 col-lg-4 col-xl-3">
              <div class="btn-group float-right" role="group"> <a href="" class="btn btn-light"><i class="fa fa-th"></i></a> <a href="" class="btn btn-light active"><i class="fa fa-bars"></i></a> </div>
              </div>
              </div>                
            </div>
            <div class="clearfix"></div>
            <div class="item-listing list">
              <div class="item" data-aos="fade-up">
                <div class="row">
                  <div class="col-md-3">
                    <div class="item-image"> <img src="../../img/profiles/cat.jpg" class="img-fluid" alt=""> </div>
                  </div>
                  <div class="col-md-9"> <a href="/jsp/admin/bookingList.do" class="btn btn-primary float-right">수락</a> &nbsp;
					<!--  <a href="agent.html" class="btn btn-primary float-right">거절</a>    -->
                  <div class="col-md-9"> 
                    <h3 class="item-title"><a href="agent.html">예약자명</a></h3>
                    <div class="item-description"><i class="fa fa-calendar-check"> 예약일시 예) 2018.02.16 금요일 19:00</i></div>
                    <div class="item-description">미리주문 </div> 
                    <div class="item-actions"><!--  <a href="tel:02080226348"> -->
                    <i class="fa fa-phone"></i> 예약자전화번호 </a> 
                    <i class="fa fa-plus-circle"></i> 요청사항 </div>
                  </div>
                </div>
              </div>
           
            </div>
            <p><a href="#" class="btn btn-lg btn-link btn-block">Load More <i class="fa fa-caret-down"></i></a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>    

</html>