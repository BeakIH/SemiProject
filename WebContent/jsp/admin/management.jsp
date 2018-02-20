<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>직원정보 화면</title>
</head>
<body>
	<div class="col-md-7 col-lg-8 col-xl-8">
		<div class="page-header bordered mt0">
			<h1>
				매장명 <small>매장 직원들 리스트</small>
			</h1>
		</div>
		<div class="sorting">
			<div class="row justify-content-between">
				<div class="col-sm-5 col-md-5 col-lg-4 col-xl-4">
					<div class="form-group">
						<select class="form-control ui-select">
							<option selected="selected">선택하세요</option>
							<option>입사일 기준</option>
							<option>평점 높은 직원</option>
						</select>
					</div>
				</div>
				<div class="col-sm-6 col-md-5 col-lg-4 col-xl-3">
					<div class="btn-group float-right" role="group">
						<a href="" class="btn btn-light"><i class="fa fa-th"></i></a> <a
							href="" class="btn btn-light active"><i class="fa fa-bars"></i></a>
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<div class="item-listing list">

			<c:forEach var="manage" items="${manageList}">

				<div class="item" data-aos="fade-up">
					<div class="row">
						<div class="col-md-3">
							<div class="item-image">
								<img src="../../img/profiles/기본이미지.jpg" class="img-fluid" alt="">
							</div>
						</div>
						<div class="col-md-9">
							<a href="modifyEmp.jsp?store_no=1" class="btn btn-primary float-right">정보 수정</a>
							<h3 class="item-title">
								<a href="agent.html">직원번호 : ${manage.empNo }</a>
							</h3>
							<div class="item-description">
								이름 : ${manage.empNm} <br /> 직위 : ${manage.position}
							</div>
							<div class="item-actions">
								<a href="tel:02080226348"><i class="fa fa-phone"></i> 020
									8022 6348</a> <a href="agent.html"><i class="fa fa-envelope-o"></i>
									Contact Agent</a>
							</div>	
						</div>
					</div>
				</div>

			</c:forEach>

			<p>
				<a href="#" class="btn btn-lg btn-link btn-block">Load More <i
					class="fa fa-caret-down"></i></a>
			</p>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>