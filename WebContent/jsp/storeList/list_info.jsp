<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.util.List"%>
<%@ page import="list.ListDBBean"%>
<%@ page import="list.ListDataBean"%>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*, java.text.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script src="../../lib/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function() { 
	realtimeClock();
});

function realtimeClock() {
	
	$('#realTime').html(getTimeStamp("1"));
	$('#realtimeTd').html(getTimeStamp("2"));
	
	  setTimeout("realtimeClock()", 1000);
	}


	function getTimeStamp(dept) { // 24시간제
	  var d = new Date();

	  var s = "";
	  if(dept == "1"){
	  s =  leadingZeros(d.getFullYear(), 4) + '년 ' +
	    leadingZeros(d.getMonth() + 1, 2) + '월 ' +
	    leadingZeros(d.getDate(), 2) + '일 ' +
	    leadingZeros(d.getHours(), 2) + '시 ' +
	    leadingZeros(d.getMinutes(), 2) + '분 ' +
	    leadingZeros(d.getSeconds(), 2) + "초";
	  }
	  else if(dept == "2"){
		  s = leadingZeros(d.getHours(), 2) + '시 ' +
		    leadingZeros(d.getMinutes(), 2) + '분 ' +
		    leadingZeros(d.getSeconds(), 2) + "초";
	  }
	  return s;
	}


	function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}



     function winOpen(){
    	 
    	 var pUrl="reserve.do?store_no="+$('#storeNo').val();
    	 var pName="new";
    	 var sizeX=1050;
    	 var sizeY=670;
    	 var posX=screen.availWidth/2-sizeX/2;
    	 var posY=screen.availHeight/2-sizeY/2;
		 myWin=window.open(pUrl,pName,"width="+sizeX+",height="+sizeY+",top="+posY+",left="+posX);     
 	
     }
     function winClose() {
 		myWin.close();                                                             
 }
   
   </script>

<style>
.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.textSize {
	font-size: 300px;
	line-height: 230px;
	color: #ccc;
}

.mainBox {
	width: 100%;
	height: 70px;
	position: fixed;
	bottom: 5px;
	text-align: center;
}

.inBox {
	display: inline-block;
	width: 150px;
	height: 70px;
	background-color: #666;
	border: 0px solid pink;
	border-radius: 10px;
	line-height: 70px;
	font-size: 30px;
	color: #fff;
	font-weight: bold;
	margin: 0 10px;
	opacity: 0.8;
}

.inBox:hover {
	background-color: #000;
	transition: all linear 1s;
}
</style>

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Real Estate</title>

<!-- Bootstrap -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans"
	rel="stylesheet" />
<link href="../../lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="../../lib/animate.css" rel="stylesheet">
<link href="../../lib/selectric/selectric.css" rel="stylesheet">
<link href="../../lib/swiper/css/swiper.min.css" rel="stylesheet">
<link href="../../lib/aos/aos.css" rel="stylesheet">
<link rel="stylesheet" href="../../lib/photoswipe/photoswipe.css">
<link rel="stylesheet"
	href="../../lib/photoswipe/default-skin/default-skin.css">
<link href="../../css/style.css" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<script src="../../lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="../../lib/selectric/jquery.selectric.js"></script>
<script src="../../lib/swiper/js/swiper.min.js"></script>
<script src="../../lib/aos/aos.js"></script>
<script src="../../lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="../../lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="../../lib/photoswipe/photoswipe.min.js"></script>
<script src="../../lib/photoswipe/photoswipe-ui-default.min.js"></script>
<script src="../../lib/lib.js"></script>

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
				<a class="navbar-brand" href="index.html"><span
					class="icon-uilove-realestate"></span></a>
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
								Home <span class="sr-only">(current)</span>
						</a>
							<div class="dropdown-menu">
								<a href="index.html" class="dropdown-item">Homepage 1</a> <a
									href="index2.html" class="dropdown-item">Homepage 2</a> <a
									href="index3.html" class="dropdown-item">Homepage 3</a> <a
									href="index4.html" class="dropdown-item">Homepage 4</a> <a
									href="index5.html" class="dropdown-item">Homepage 5</a> <a
									href="index6.html" class="dropdown-item">Homepage 6</a> <a
									href="index7.html" class="dropdown-item">Homepage 7</a>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Listings </a>
							<div class="dropdown-menu">
								<a href="property_listing.html" class="dropdown-item">List
									View</a> <a href="property_grid.html" class="dropdown-item">Grid
									View</a> <a href="property_listing_map.html" class="dropdown-item">Map
									View</a> <a href="property_single.html" class="dropdown-item">Single
									View 1</a> <a href="property_single2.html" class="dropdown-item">Single
									View 2</a> <a href="property_single3.html" class="dropdown-item">Single
									View 3</a>
							</div></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Agents </a>
							<div class="dropdown-menu">
								<a href="agent_list.html" class="dropdown-item">Agent List</a> <a
									href="agent.html" class="dropdown-item">Agent Profile</a>
							</div></li>

						<li class="nav-item dropdown megamenu"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Pages </a>
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
														<li><a href="forgot-password.html">Forgot
																Password</a></li>
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
														<li><a href="information_page.html">Information
																Page</a></li>
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
														<li><a href="my_bookmarked_listings.html">Bookmarked
																Listing</a></li>
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
							</div></li>

					</ul>

					<ul class="navbar-nav ml-auto">


						<li class="nav-item dropdown user-account"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="user-image"
								style="background-image: url(' img/demo/profile3.jpg');"></span>
								Hi, John
						</a>
							<div class="dropdown-menu">
								<a href="my_profile.html" class="dropdown-item">My Profile</a> <a
									href="my_password.html" class="dropdown-item">Change
									Password</a> <a href="my_notifications.html" class="dropdown-item">Notifications</a>
								<a href="my_membership.html" class="dropdown-item">Membership</a>
								<a href="my_payments.html" class="dropdown-item">Payments</a> <a
									href="my_account.html" class="dropdown-item">Account</a>
							</div></li>
						<li class="nav-item add-listing"><a class="nav-link"
							href="my_listing_add.html"><span><i class="fa fa-plus"
									aria-hidden="true"></i> Add listing</span></a></li>
					</ul>

				</div>
			</div>
		</nav>
		<c:forEach var="article" items="${articleList}">
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col col-md-12 col-lg-12 col-xl-10">

						</ol>
						<div class="page-header bordered mb0">
							<div class="row">
								<div class="col-md-8">
									<a href="javascript:history.back();" class="btn-return" title="Back"><i
										class="fa fa-angle-left"></i></a>
									<h1>
									<input type="hidden" value="${article.store_no }" id="storeNo" />
										${article.store_nm }<span class="label label-bordered">${article.cate_nm }</span>
										<small><i class="fa fa-map-marker"></i> 서울시 중구 남대문로
											120 대일빌딩 3층</small>
									</h1>
								</div>
								<div class="col-md-4">
									<div class="price">
										예약가능좌석: ${article.avl_tbl_cnt } <br /><span id="realTime" style="font-size:16px; color:blue"></span>										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="content" class="item-single">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col col-md-12 col-lg-12 col-xl-10">
							<div class="row row justify-content-md-center has-sidebar">
								<div class="col-md-7 col-lg-8">
									<div>
										<div class="item-gallery">
											<div class="swiper-container gallery-top" data-pswp-uid="1">
												<div class="swiper-wrapper lazyload">

													<div class="swiper-slide">
														<figure itemprop="associatedMedia" itemscope
															itemtype="http://schema.org/ImageObject">
															<a href="img/demo/property/1.jpg" itemprop="contentUrl"
																data-size="2000x1414"> <img
																src="img/demo/property/1.jpg"
																class="img-fluid swiper-lazy" alt="Drawing Room">
															</a>
														</figure>
													</div>
													<div class="swiper-slide">
														<figure itemprop="associatedMedia" itemscope
															itemtype="http://schema.org/ImageObject">
															<a href="img/demo/property/2.jpg" itemprop="contentUrl"
																data-size="2000x1414"> <img
																data-src="img/demo/property/2.jpg" src="img/spacer.png"
																class="img-fluid swiper-lazy" alt="Drawing Room">
															</a>
														</figure>
													</div>
													<div class="swiper-slide">
														<figure itemprop="associatedMedia" itemscope
															itemtype="http://schema.org/ImageObject">
															<a href="img/demo/property/3.jpg" itemprop="contentUrl"
																data-size="2000x1414"> <img
																data-src="img/demo/property/3.jpg" src="img/spacer.png"
																class="img-fluid swiper-lazy" alt="Drawing Room">
															</a>
														</figure>
													</div>
													<div class="swiper-slide">
														<figure itemprop="associatedMedia" itemscope
															itemtype="http://schema.org/ImageObject">
															<a href="img/demo/property/4.jpg" itemprop="contentUrl"
																data-size="2000x1414"> <img
																data-src="img/demo/property/4.jpg" src="img/spacer.png"
																class="img-fluid swiper-lazy" alt="Drawing Room">
															</a>
														</figure>
													</div>
													<div class="swiper-slide">
														<figure itemprop="associatedMedia" itemscope
															itemtype="http://schema.org/ImageObject">
															<a href="img/demo/property/5.jpg" itemprop="contentUrl"
																data-size="2000x1414"> <img
																data-src="img/demo/property/5.jpg" src="img/spacer.png"
																class="img-fluid swiper-lazy" alt="Drawing Room">
															</a>
														</figure>
													</div>

												</div>
												<div class="swiper-button-next"></div>
												<div class="swiper-button-prev"></div>
											</div>
											<div class="swiper-container gallery-thumbs">
												<div class="swiper-wrapper">
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/1.jpg" class="img-fluid"
															alt="">
													</div>
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/2.jpg" class="img-fluid"
															alt="">
													</div>
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/3.jpg" class="img-fluid"
															alt="">
													</div>
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/4.jpg" class="img-fluid"
															alt="">
													</div>
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/5.jpg" class="img-fluid"
															alt="">
													</div>
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/6.jpg" class="img-fluid"
															alt="">
													</div>
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/7.jpg" class="img-fluid"
															alt="">
													</div>
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/8.jpg" class="img-fluid"
															alt="">
													</div>
													<div class="swiper-slide">
														<img src="img/demo/property/thumb/9.jpg" class="img-fluid"
															alt="">
													</div>
												</div>
											</div>
										</div>
										<div>
											<ul class="item-features">
												<li><span>매장테이블</span> 테이블수</li>
												<li><span>전체테이블</span>${article.tot_tbl_cnt }자리</li>
												<li><span>예약가능좌석</span>${article.avl_tbl_cnt }자리</li>
											</ul>
											<div class="item-description">
												<h3 class="headline">매장 소개</h3>
												<p>
													<strong>윤식당</strong> 이렇게 생겨먹었고 저렇게 생겼다. 이래저래해서 처음 창립되었다.
											</div>
											<h3 class="headline">메뉴</h3>
											<ul class="checked feature-list" id="BK_MENU">
											<c:forEach var="menuList" items="${article.menuList}">
												<li><strong>${menuList.menu_nm1} : </strong>${menuList.menu_nm1_sal}원</li>
											</c:forEach>
<%-- 												<li><strong>${article.menu_nm2}</strong>${article.menu_nm2_sal}</li> --%>
											</ul>
											
											<!-- 한줄평  -->
											<div class="item-attachments">
												<h3 class="headline">한줄평</h3>

												한줄평 위치
											</div>

											<div class="item-attachments">
												<h3 class="headline">예약</h3>

												<a href="#" class="btn btn-lg btn-inverse"
													onclick="winOpen()"><i class="fa fa-cloud-download"
													aria-hidden="true"></i>예약하기</a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-5 col-lg-4">
									<div id="sidebar" class="sidebar-right">
										<div class="sidebar_inner">
											<div id="feature-list" role="tablist">
												<div class="card">
													<div class="card-header" role="tab" id="headingOne">
														<h4 class="panel-title">
															<a role="button" data-toggle="collapse"
																href="#specification" aria-expanded="true"
																aria-controls="specification">운영 안내<i
																class="fa fa-caret-down float-right"></i>
															</a>
														</h4>
													</div>
													<div id="specification"
														class="panel-collapse collapse show" role="tabpanel">
														<div class="card-body">
															<table class="table v1">
																<tr>
																	<td>영업시간</td>
																	<td>${article.store_octime}</td>
																</tr>
																<tr>
																	<td>연락처</td>
																	<td>${article.store_tel}</td>
																</tr>
																<tr>
																	<td>예약가능좌석</td>
																	<td id="AVL_TBL_CNT">${article.avl_tbl_cnt}</td>
																</tr>
																<tr>
																	<td>현재시간</td>
																	<td id="realtimeTd">
 																			
																</tr>
															</table>
														</div>
													</div>
												</div>
											</div>
											<div class="card shadow">
												<h5 class="subheadline mt-0  mb-0">매장 직원</h5>
												<div class="media">
													<div class="media-left">
														<a href="agent.html"> <img
															class="media-object rounded-circle"
															src="../../img/demo/profile.jpg" width="64" height="64" alt="">
														</a>
													</div>
													<div class="media-body">
														<h4 class="media-heading">
															<a href="agent.html">${article.store_owner}</a>
														</h4>
														<p>
															<i class="fa fa-phone" aria-hidden="true">매장번호:</i><br>
															${article.store_tel}
														</p>

													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<script type="text/javascript">
// Photoswipe

    var initPhotoSwipeFromDOM = function(gallerySelector) {
        var parseThumbnailElements = function(el) {
		console.log(el);
            var thumbElements = $(el).closest(main_gallery).find('figure'),
                numNodes = thumbElements.length,
                items = [],
                figureEl,
                linkEl,
                size,
                item;

            for (var i = 0; i < numNodes; i++) {

                figureEl = thumbElements[i]; // <figure> element

                // include only element nodes 
                if (figureEl.nodeType !== 1) {
                    continue;
                }

                linkEl = figureEl.children[0]; // <a> element

                size = linkEl.getAttribute('data-size').split('x');

                // create slide object
                item = {
                    src: linkEl.getAttribute('href'),
                    w: parseInt(size[0], 10),
                    h: parseInt(size[1], 10)
                };



                if (figureEl.children.length > 1) {
                    // <figcaption> content
                    item.title = figureEl.children[1].innerHTML;
                }

                if (linkEl.children.length > 0) {
                    // <img> thumbnail element, retrieving thumbnail url
                    item.msrc = linkEl.children[0].getAttribute('src');
                }

                item.el = figureEl; // save link to element for getThumbBoundsFn
                items.push(item);
            }

            return items;
        };

        // find nearest parent element
        var closest = function closest(el, fn) {
            return el && (fn(el) ? el : closest(el.parentNode, fn));
        };

        // triggers when user clicks on thumbnail
        var onThumbnailsClick = function(e) {
            e = e || window.event;
            e.preventDefault ? e.preventDefault() : e.returnValue = false;

            var eTarget = e.target || e.srcElement;

            // find root element of slide
            var clickedListItem = closest(eTarget, function(el) {
                return (el.tagName && el.tagName.toUpperCase() === 'FIGURE');
            });

            if (!clickedListItem) {
                return;
            }
            var clickedGallery = clickedListItem.parentNode,
                childNodes = $(clickedListItem).closest(main_gallery).find('figure'),
                numChildNodes = childNodes.length,
                nodeIndex = 0,
                index;

            for (var i = 0; i < numChildNodes; i++) {
                if (childNodes[i].nodeType !== 1) {
                    continue;
                }

                if (childNodes[i] === clickedListItem) {
                    index = nodeIndex;
                    break;
                }
                nodeIndex++;
            }
            if (index >= 0) {
                // open PhotoSwipe if valid index found
                openPhotoSwipe(index, clickedGallery);
            }
            return false;
        };

        var openPhotoSwipe = function(index, galleryElement, disableAnimation) {
            var pswpElement = document.querySelectorAll('.pswp')[0],
                gallery,
                options,
                items;

            items = parseThumbnailElements(galleryElement);

            // define options (if needed)
            options = {
                history: false,
                bgOpacity: 0.8,
                loop: false,
                barsSize: {
                    top: 0,
                    bottom: 'auto'
                },

                // define gallery index (for URL)
                galleryUID: $(galleryElement).closest(main_gallery).attr('data-pswp-uid'),

                getThumbBoundsFn: function(index) {
                    // See Options -> getThumbBoundsFn section of documentation for more info
                    var thumbnail = document.querySelectorAll(main_gallery+' img')[index],
                        //var thumbnail = items[index].el.getElementsByTagName('img')[0], // find thumbnail
                        pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                        rect = thumbnail.getBoundingClientRect();

                    return {
                        x: rect.left,
                        y: rect.top + pageYScroll,
                        w: rect.width
                    };
                }

            };

            options.index = parseInt(index, 10);

            // exit if index not found
            if (isNaN(options.index)) {
                return;
            }

            if (disableAnimation) {
                options.showAnimationDuration = 0;
            }

            // Pass data to PhotoSwipe and initialize it
            gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
            gallery.init();
			gallery.shout('helloWorld', 'John' /* you may pass more arguments */);



            var totalItems = gallery.options.getNumItemsFn();

            function syncPhotoSwipeWithOwl() {
                var currentIndex = gallery.getCurrentIndex();
                galleryTop.slideTo(currentIndex);
                if (currentIndex == (totalItems - 1)) {
                    $('.pswp__button--arrow--right').attr('disabled', 'disabled').addClass('disabled');
                } else {
                    $('.pswp__button--arrow--right').removeAttr('disabled');
                }
                if (currentIndex == 0) {
                    $('.pswp__button--arrow--left').attr('disabled', 'disabled').addClass('disabled');
                } else {
                    $('.pswp__button--arrow--left').removeAttr('disabled');
                }
            };
            gallery.listen('afterChange', function() {
                syncPhotoSwipeWithOwl();
            });
            syncPhotoSwipeWithOwl();
        };

        // loop through all gallery elements and bind events
        var galleryElements = document.querySelectorAll(gallerySelector);

        for (var i = 0, l = galleryElements.length; i < l; i++) {
            galleryElements[i].setAttribute('data-pswp-uid', i + 1);
            galleryElements[i].onclick = onThumbnailsClick;
        }
    };
var main_gallery = '.gallery-top';
    var galleryTop = new Swiper(main_gallery, {
      spaceBetween: 10,
	  lazy: {
		loadPrevNext: true,
	  },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
	  }
	  ,on: {
			init: function(){
				initPhotoSwipeFromDOM(main_gallery);
			},
		}
    });
    var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 10,
	  centeredSlides: true,
	  slidesPerView: 5,
      touchRatio: 0.2,
      slideToClickedSlide: true,
    });
    galleryTop.controller.control = galleryThumbs;
    galleryThumbs.controller.control = galleryTop;	
  </script>

		<script language=javascript>
  function sel()
  {
   for( var i=0; i<$('#test option').size(); i++)
    if( $("#test option:eq("+i+")").attr("selected") ) //선택된 값찾기
     alert($("#test option:eq("+i+")").val()); //선택된 값 출력
  }
  
  </script>

		<div class="modal" id="modal" tabindex="-1" role="dialog"
			aria-labelledby="modar" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<div class="row">
							<div class="col-lg-12">
								<button class="close" data-dismiss="modal">&times;</button>

								<div class="row">
									<div class="col-lg-12">
										<div class="page-header bordered">
											<h1>
												윤식당<small>예약신청</small>
											</h1>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<form action="index.php">
											<h3 class="subheadline">개인정보입력란</h3>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label>이름</label> <input type="text"
												class="form-control form-control-lg" placeholder=""
												value="이수근">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label>예약 인원수</label> <select name="nnn"
												style="width: 200px; height: 45px;">
												<option value="1인">1인</option>
												<option value="1인" selected="selected">2인</option>
												<option value="1인">3인</option>
												<option value="1인">4인</option>
												<option value="1인">5인</option>
												<option value="1인">6인</option>
												<option value="1인">7인</option>
												<option value="1인">8인</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>음식메뉴</label><br> <select name="test[]" id="test"
												onChange="sel();">
												<option value="1">크림파스타</option>
												<option value="2" selected="selected">봉골레파스타</option>
												<option value="3">스테이크</option>
												<option value="4">함박스테이크</option>
												<option value="5">돈까스</option>
												<option value="6">커피</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>핸드폰</label> <input type="text"
												class="form-control form-control-lg" placeholder=""
												value="01099993333">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>기타</label> <input type="text"
												class="form-control form-control-lg" placeholder="" value="">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>전달할 메세지</label>
											<textarea class="form-control form-control-lg text-editor"
												placeholder=""></textarea>
										</div>
									</div>
								</div>
								<hr>
								<div class="form-group action">
									<button type="submit" class="btn btn-lg btn-primary">예약</button>
								</div>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<button class="btn btn-primary btn-circle" id="to-top">
			<i class="fa fa-angle-up"></i>
		</button>
		<footer id="footer">
			<div class="container">
				<div class="row justify-content-md-center">
					<div class="col col-md-10">
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<p>
									<span class="icon-uilove-realestate"></span>
								</p>
								<address>
									<strong>Twitter, Inc.</strong><br> 1355 Market Street,
									Suite 900<br> San Francisco, CA 94103<br> <abbr
										title="Phone">P:</abbr> (123) 456-7890
								</address>
								<p class="text-muted">
									Copyright &copy; 2016<br /> All rights reserved
								</p>
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
								<div class="social-sharebox">
									<a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-google"></i></a> <a href="#"><i
										class="fa fa-linkedin"></i></a> <a href="#"><i
										class="fa fa-youtube-play"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div>
								<form>
									<h4>Subscribe Newsletter</h4>
									<div class="input-group input-group-lg">
										<input type="email" class="form-control form-control-lg"
											placeholder="Email Address"> <span
											class="input-group-btn">
											<button class="btn btn-primary" type="button">Go!</button>
										</span>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>