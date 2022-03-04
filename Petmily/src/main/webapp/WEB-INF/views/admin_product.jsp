<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>펫밀리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<link rel="stylesheet" href="${path }/resource/css/animate.css" />

<link rel="stylesheet" href="${path }/resource/css/owl.carousel.min.css" />
<link rel="stylesheet" href="${path }/resource/css/owl.theme.default.min.css" />
<link rel="stylesheet" href="${path }/resource/css/magnific-popup.css" />

<link rel="stylesheet" href="${path }/resource/css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="${path }/resource/css/jquery.timepicker.css" />

<link rel="stylesheet" href="${path }/resource/css/flaticon.css" />
<link rel="stylesheet" href="${path }/resource/css/style.css" />
<link rel="stylesheet" href="${path }/resource/css/petmily.css" />
</head>
<body>
	<!-- 네비게이션바 -->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index.html">Petmily</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="admin.html" class="nav-link"><b>Admin</b></a>
					</li>
					<li class="nav-item"><a href="subscribe.html" class="nav-link">구독</a>
					</li>
					<li class="nav-item"><a href="store.html" class="nav-link">스토어</a>
					</li>
					<li class="nav-item"><a href="mypage.html" class="nav-link">마이페이지</a>
					</li>
					<li class="nav-item"><a href="join.html" class="nav-link">회원가입</a>
					</li>
					<li class="nav-item"><a href="login.html" class="nav-link">로그인</a>
					</li>
					<li class="nav-item"><a href="cart.html" class="nav-link">장바구니</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Admin 페이지 탭 메뉴 -->
	<div class="d-flex align-items-start">
		<div class="nav flex-column nav-tabs me-3" id="v-tab" role="tablist"
			aria-orientation="vertical">
			<button class="nav-link active" id="v-subscribe-tab"
				data-bs-toggle="pill" onclick="location.href='admin_product'" type="button"
				role="tab" aria-controls="v-pills-subscribe" aria-selected="true">구독</button>
			<button class="nav-link" id="v-subscribe-product-tab"
				data-bs-toggle="pill" data-bs-target="#v-subscribe-product"
				type="button" role="tab" aria-controls="v-pills-subscribe-product"
				aria-selected="false">구독 상품 등록</button>
			<button class="nav-link" id="v-add-product-tab" data-bs-toggle="pill"
				data-bs-target="#v-add-product" type="button" role="tab"
				aria-controls="v-pills-add-product" aria-selected="false">상품
				등록</button>
			<button class="nav-link" id="v-remain-product-tab"
				data-bs-toggle="pill" data-bs-target="#v-remain-product"
				type="button" role="tab" aria-controls="v-pills-remain-product"
				aria-selected="false">상품 재고</button>
			<button class="nav-link" id="v-order-tab" data-bs-toggle="pill"
				data-bs-target="#v-order" type="button" role="tab"
				aria-controls="v-pills-order" aria-selected="false">상품 주문</button>
			<button class="nav-link" id="v-delivery-tab" data-bs-toggle="pill"
				data-bs-target="#v-delivery" type="button" role="tab"
				aria-controls="v-pills-delivery" aria-selected="false">배송</button>
		</div>
		<div class="tab-content" id="v-tabContent">
			<div class="tab-pane fade show active" id="v-subscribe"
				role="tabpanel" aria-labelledby="v-subscribe-tab">
				<section class="ftco-section">이미지 삽입 예정</section>
			</div>
			<div class="tab-pane fade" id="v-subscribe-product" role="tabpanel"
				aria-labelledby="v-subscribe-product-tab">
				<section class="ftco-section">여기에 상품 등록 페이지 기능을 구현하시면 됩니다.
				</section>
			</div>
			<div class="tab-pane fade" id="v-add-product" role="tabpanel"
				aria-labelledby="v-add-product-tab">
				<section class="ftco-section">
					<c:choose>
						<c:when test="${admin_product!=null && pageInfo.listCount>0 }">
							<form action="admin_product" method="get">
								<input type="text" id="search_prod" name="search_prod" /> <input
									type="submit" value="찾기" />
							</form>
							<section id="listForm">
								<table border='1'>
									<tr>
										<td>제목</td>
										<td>상품이름</td>
										<td>가격</td>
										<td></td>
										<td></td>
									</tr>
									<tbody>
										<c:forEach items="${admin_product }" var="admin_product">
											<tr>
												<td>${admin_product.prod_title }</td>
												<td>${admin_product.prod_name }</td>
												<td>${admin_product.prod_price }</td>
												<td><input type="button" value="수정"
													onclick="location.href='admin_product_modify?prod_num=${admin_product.prod_num}'"></td>
												<td><input type="button" value="삭제"
													onclick="location.href='admin_product_delete?prod_num=${admin_product.prod_num}'"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</section>
							<section id="pageList">
								<c:choose>
									<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
									<c:otherwise>
										<a
											href="admin_membership?page=${pageInfo.page-1}&search_prod=${search_prod}">[이전]</a>&nbsp;
				</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="${pageInfo.startPage }"
									end="${pageInfo.endPage }">
									<c:choose>
										<c:when test="${pageInfo.page==i }">[${i }]</c:when>
										<c:otherwise>
											<a
												href="admin_membership?page=${i}&search_prod=${search_prod}">[${i }]</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
									<c:otherwise>
										<a
											href="admin_membership?page=${pageInfo.page+1}&search_prod=${search_prod}">[다음]</a>
									</c:otherwise>
								</c:choose>
							</section>
						</c:when>
						<c:otherwise>
							<form action="admin_product" method="get">
								<input type="text" id="search_prod" name="search_prod" /> <input
									type="submit" value="찾기" />
							</form>
							<section id="emptyArea">등록된 글이 없습니다.</section>
						</c:otherwise>
					</c:choose>
				</section>
			</div>
			<div class="tab-pane fade" id="v-remain-product" role="tabpanel"
				aria-labelledby="v-remain-product-tab">
				<section class="ftco-section">여기에 상품 재고 페이지 기능을 구현하시면 됩니다.
				</section>
			</div>
			<div class="tab-pane fade" id="v-order" role="tabpanel"
				aria-labelledby="v-order-tab">
				<section class="ftco-section">여기에 상품 주문 페이지 기능을 구현하시면 됩니다.
				</section>
			</div>
			<div class="tab-pane fade" id="v-delivery" role="tabpanel"
				aria-labelledby="v-delivery-tab">
				<section class="ftco-section">여기에 배송 페이지 기능을 구현하시면 됩니다.</section>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<script>
            document.write(new Date().getFullYear());
        </script>
			The 6th Multicampus FullStack Project. All rights reserved | <a
				href="index.html" target="_blank">petmily.com</a> <br>Team.이해되시조
			| 김진하,송욱진,엄병수,원선영,윤세종,이산하,차현
		</div>
	</footer>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
        <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    </svg>
	</div>

	<script src="${path }/resource/js/jquery.min.js"></script>
	<script src="${path }/resource/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${path }/resource/js/popper.min.js"></script>
	<script src="${path }/resource/js/bootstrap.min.js"></script>
	<script src="${path }/resource/js/jquery.easing.1.3.js"></script>
	<script src="${path }/resource/js/jquery.waypoints.min.js"></script>
	<script src="${path }/resource/js/jquery.stellar.min.js"></script>
	<script src="${path }/resource/js/jquery.animateNumber.min.js"></script>
	<script src="${path }/resource/js/bootstrap-datepicker.js"></script>
	<script src="${path }/resource/js/jquery.timepicker.min.js"></script>
	<script src="${path }/resource/js/owl.carousel.min.js"></script>
	<script src="${path }/resource/js/jquery.magnific-popup.min.js"></script>
	<script src="${path }/resource/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${path }/resource/js/google-map.js"></script>
	<script src="${path }/resource/js/main.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
