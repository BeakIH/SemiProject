<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Real Estate</title>

<!-- Bootstrap -->
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900%7COpen+Sans" rel="stylesheet" />
<link href="/SemiProject/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/SemiProject/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="/SemiProject/lib/animate.css" rel="stylesheet">
<link href="/SemiProject/lib/selectric/selectric.css" rel="stylesheet">

<link href="/SemiProject/lib/swiper/css/swiper.min.css" rel="stylesheet">

<link href="/SemiProject/lib/aos/aos.css" rel="stylesheet">
<link rel="stylesheet" href="/SemiProject/lib/photoswipe/photoswipe.css">
<link rel="stylesheet"
	href="/SemiProject/lib/photoswipe/default-skin/default-skin.css">
<link href="/SemiProject/css/style.css" rel="stylesheet">
<link href="/SemiProject/css/notice.css" rel="stylesheet">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/SemiProject/lib/jquery-3.2.1.min.js"></script>
<script src="/SemiProject/lib/popper.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/SemiProject/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="/SemiProject/lib/selectric/jquery.selectric.js"></script>
<script src="/SemiProject/lib/swiper/js/swiper.min.js"></script>
<script src="/SemiProject/lib/aos/aos.js"></script>
<script src="/SemiProject/lib/photoswipe/photoswipe.min.js"></script>
<script src="/SemiProject/lib/photoswipe/photoswipe-ui-default.min.js"></script>
<script src="/SemiProject/lib/sticky-sidebar/ResizeSensor.min.js"></script>
<script src="/SemiProject/lib/sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="/SemiProject/lib/lib.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- 게시판 시작 -->
	<!-- 글수 0 -->
	<div class="list_view_content">
		<div id="content" class="content_mall" tabindex="0">
			<h2 style="text-align: center;">공지사항</h2>
			<div class="view_layout">
				<div class="notice_bbs">
					<!-- list_view_wrapper -->
					<div class="list_view_wrapper">
						<!-- search form -->
						<form>
							<fieldset>
								<legend style="visibility: hidden;">검색</legend>
								<div class="search_area">
									<select name="opt" id="opt" title="검색어 유형 선택">
										<option value="A" selected="selected">전체</option>
										<option value="T">제목</option>
										<option value="C">내용</option>
										<!--  	<option value="S">매장명</option> -->
									</select> <input type="text" name="condition" id="condition"
										class="condition" value="" placeholder="검색어를 입력하세요"
										title="검색어를 입력하세요">
									<button type="submit" class="submit">
										<span class="m_txt">검색하기</span>
									</button>
								</div>
							</fieldset>

							<div style="float: right;">
								<a href="/SemiProject/notice/notice.do" class="list-btn btn-primary">목록(전체
									글:${count})</a><br>
							</div>
						</form>

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
						<c:if test="${count == 0}"><center>게시판 저장된 글 없음</center></c:if>

						<c:if test="${count > 0}">

							<c:forEach var="article" items="${articleList}">
								<div class="list_view_content">
									<div class="row_group">

										<ul class="row_group clfix">

											<li class="cell01">
												<!-- 번호 --> <c:out value="${number}" /> <c:set var="number"
													value="${number - 1}" />
											</li>
											<li class="cell02">
												<!-- 제목 --> <a
												href="/SemiProject/notice/Content.do?b_no=${article.b_no}&pageNum=${currentPage}">
													${article.b_title}</a>
											</li>
											<li class="cell03">
												<!-- 게시일자 --> <span><c:set var="pd"
														value="${article.post_date}" /> ${fn:substring(pd,0,10) } </span>
											</li>
											<li class="cell04">
												<!-- 조회수 --> <span>${article.b_view_cnt}</span>
											</li>
											<li class="cell05">
												<!-- 직원명 --> <span>${article.emp_nm}</span>
											</li>
											<li class="cell06">
												<!-- 직원번호 --> <span>${article.emp_no}</span>
											</li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${count > 0}">
							<c:set var="pageCount"
								value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
							<c:set var="pageBlock" value="${10}" />
							<fmt:parseNumber var="result" value="${currentPage / 10}"
								integerOnly="true" />
							<c:set var="startPage" value="${result * 10 + 1}" />
							<c:set var="endPage" value="${startPage + pageBlock-1}" />
							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>

							<c:if test="${startPage > 10}">
								<a
									href="/SemiProject/notice/notice.do?pageNum=${startPage - 10 }">[이전]</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<a href="/SemiProject/notice/notice.do?pageNum=${i}">
								<div style="visibility: hidden">[${i}]</div></a>
							</c:forEach>

							<c:if test="${endPage < pageCount}">
								<a
									href="/SemiProject/notice/notice.do?pageNum=${startPage + 10}">[다음]</a>
							</c:if>
							<div class="pagenate_area">
								<ul class="pagenate">

									<li><a href="?page=1" onclick="linkPage(1);return false; "
										class="ctrl"> <img src="/SemiProject/img/page/btn_list_first.gif"
											alt="처음 페이지로 이동"></a></li>
									<li><a href="?pageNum=1"
										onclick="linkPage(1);return false; " class="ctrl prev"> <img
											src="/SemiProject/img/page/btn_list_prev.gif" alt="이전 페이지로 이동"></a></li>

									<c:choose>
										<c:when test="${currentPage == 1}">
											<li><strong title="현재 1페이지">1</strong></li>
											<li><a href="?pageNum=2"
												onclick="linkPage(2);return false; " title="2페이지로 이동">2</a></li>
											<li><a href="?pageNum=3"
												onclick="linkPage(3);return false; " title="3페이지로 이동">3</a></li>
											<li><a href="?pageNum=4"
												onclick="linkPage(4);return false; " title="4페이지로 이동">4</a></li>
											<li><a href="?pageNum=5"
												onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
										</c:when>
										<c:when test="${currentPage == 2}">
											<li><a href="?pageNum=1"
												onclick="linkPage(1);return false; " title="1페이지로 이동">1</a></li>
											<li><strong title="현재 2페이지">2</strong></li>
											<li><a href="?pageNum=3"
												onclick="linkPage(3);return false; " title="3페이지로 이동">3</a></li>
											<li><a href="?pageNum=4"
												onclick="linkPage(4);return false; " title="4페이지로 이동">4</a></li>
											<li><a href="?pageNum=5"
												onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
										</c:when>
										<c:when test="${currentPage == 3}">
											<li><a href="?pageNum=1"
												onclick="linkPage(1);return false; " title="1페이지로 이동">1</a></li>
											<li><a href="?pageNum=2"
												onclick="linkPage(2);return false; " title="2페이지로 이동">2</a></li>
											<li><strong title="현재 3페이지">3</strong></li>
											<li><a href="?pageNum=4"
												onclick="linkPage(4);return false; " title="4페이지로 이동">4</a></li>
											<li><a href="?pageNum=5"
												onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
										</c:when>
										<c:when test="${currentPage == 4}">
											<li><a href="?pageNum=1"
												onclick="linkPage(1);return false; " title="1페이지로 이동">1</a></li>
											<li><a href="?pageNum=2"
												onclick="linkPage(2);return false; " title="2페이지로 이동">2</a></li>
											<li><a href="?pageNum=3"
												onclick="linkPage(3);return false; " title="3페이지로 이동">3</a></li>
											<li><strong title="현재 4페이지">4</strong></li>
											<li><a href="?pageNum=5"
												onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
										</c:when>
										<c:when test="${currentPage == 5}">
											<li><a href="?pageNum=1"
												onclick="linkPage(1);return false; " title="1페이지로 이동">1</a></li>
											<li><a href="?pageNum=2"
												onclick="linkPage(2);return false; " title="2페이지로 이동">3</a></li>
											<li><a href="?pageNum=3"
												onclick="linkPage(3);return false; " title="3페이지로 이동">4</a></li>
											<li><a href="?pageNum=4"
												onclick="linkPage(4);return false; " title="4페이지로 이동">5</a></li>
											<li><strong title="현재 5페이지">5</strong></li>
										</c:when>
										<c:otherwise>
											<li><strong title="현재 1페이지">1</strong></li>
											<li><a href="?pageNum=2"
												onclick="linkPage(2);return false; " title="2페이지로 이동">2</a></li>
											<li><a href="?pageNum=3"
												onclick="linkPage(3);return false; " title="3페이지로 이동">3</a></li>
											<li><a href="?pageNum=4"
												onclick="linkPage(4);return false; " title="4페이지로 이동">4</a></li>
											<li><a href="?pageNum=5"
												onclick="linkPage(5);return false; " title="5페이지로 이동">5</a></li>
										</c:otherwise>
									</c:choose>

									<li><a href="?pageNum=6"
										onclick="linkPage(6);return false; " class="ctrl next"> <img
											src="/SemiProject/img/page/btn_list_next.gif" alt="다음 페이지로 이동"></a></li>
									<li><a href="?pageNum=8"
										onclick="linkPage(8);return false; " class="ctrl last"> <img
											src="/SemiProject/img/page/btn_list_last.gif" alt="마지막 페이지로 이동"></a></li>
								</ul>
							</div>
						</c:if>

						<div style="float: right;">
							<a href="/SemiProject/notice/writeForm.do"
								class="btn btn-lg btn-primary">글쓰기</a>
						</div>

					</div>

				</div>
			</div>

			<br> <br> <br>
		</div>
	</div>
	</div>
</body>
</html>