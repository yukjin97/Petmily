<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>펫밀리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link href="<https:/
	/fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap>
" rel="stylesheet" />

<link rel="stylesheet" href="<https:/
	/stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css>
" />

<link rel="stylesheet" href="${path}/resource/css/animate.css" />

<link rel="stylesheet" href="${path}/resource/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${path}/resource/css/owl.theme.default.min.css" />
<link rel="stylesheet" href="${path}/resource/css/magnific-popup.css" />

<link rel="stylesheet"
	href="${path}/resource/css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="${path}/resource/css/jquery.timepicker.css" />

<link rel="stylesheet" href="${path}/resource/css/flaticon.css" />
<link rel="stylesheet" href="${path}/resource/css/style.css" />
<link rel="stylesheet" href="${path}/resource/css/petmily.css" />
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
				aria-expanded="false" aria-label="Toggle navigation"></button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
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

	<!-- 상단 배너-->
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('${path}/resource/images/bg_2.png')"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="index.html">Petmily <i
								class="ion-ios-arrow-forward"></i>
						</a></span> <span>Mypage <i class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">마이페이지</h1>
				</div>
			</div>
		</div>
	</section>

	<!-- 마이페이지 탭 메뉴 -->
	<input type="button" class="btn" value="구독정보"
		onclick="location.href='mymembership'">
	<input type="button" class="btn" value="배송지 관리"
		onclick="location.href='useraddress'">
	<section>
		<ul class="nav nav-tabs justify-content-center" id="myTab"
			role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="myinfo-tab" data-bs-toggle="tab"
					data-bs-target="#myinfo" type="button" role="tab"
					aria-controls="myinfo" aria-selected="true">나의 정보</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="subscribe-tab" data-bs-toggle="tab"
					data-bs-target="#subscribe" type="button" role="tab"
					aria-controls="subscribe" aria-selected="false">구독 관리</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="order-tab" data-bs-toggle="tab"
					data-bs-target="#order" type="button" role="tab"
					aria-controls="order" aria-selected="false">주문 내역</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="delivery-tab" data-bs-toggle="tab"
					data-bs-target="#delivery" type="button" role="tab"
					aria-controls="delivery" aria-selected="false">배송지 관리</button>
			</li>
		</ul>

		<!-- 마이페이지 탭 내용 -->
		<div class="tab-content" id="myTabContent">
			<!-- 나의 정보 내용 -->
			<div class="tab-pane fade show active" id="myinfo" role="tabpanel"
				aria-labelledby="myinfo-tab">
				<section class="ftco-section bg-white">
					<div class="item">
						<div class="table-responsive">
							<table class="t_margin_auto width100 ds-table">
								<colgroup>
									<col style="width: 30%" />
									<col style="width: 70%" />
								</colgroup>
								<tbody>
									<tr>
										<td class="bg">이름</td>
										<td>${user.user_name }</td>
									</tr>
									<tr>
										<td class="bg">아이디</td>
										<td>${user.user_id }</td>
									</tr>
									<tr>
										<td class="bg">닉네임</td>
										<td>${user.user_nickname }</td>
									</tr>
									<tr>
										<td class="bg">전화번호</td>
										<td>${user.user_phone }</td>
									</tr>
									<%--
                    <tr>
                      <td class="bg">이메일</td>
                      <td>${user.user_email }</td>
                    </tr>
                    --%>
								</tbody>
							</table>
							<!-- <input type="button" onclick="location.href='usermodify'"
                        value='수정하기'> -->
						</div>
						<div>
							<input type="button" class="edit"
								onclick="location.href='usermodify'" value="수정하기" />
						</div>
					</div>
				</section>
			</div>

			<!-- 구독 관리 내용 -->
			<div class="tab-pane fade" id="subscribe" role="tabpanel"
				aria-labelledby="subscribe-tab">
				<section class="ftco-section bg-white">
					<div class="table-responsive">
						<table class="t_margin_auto width100 ds-table">
							<colgroup>
								<col style="width: 50%" />
								<col style="width: 50%" />
							</colgroup>
							<tbody>
								<tr>
									<td>현재 구독 내역</td>
									<td>${rmem.mem_grade}</td>
								</tr>
								<tr>
									<td>다음 구독 결제일은 ${rmem.mem_next_date}입니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</section>
			</div>

         <!-- 주문 내역 내용 -->
         <div class="tab-pane fade" id="order" role="tabpanel"
            aria-labelledby="order-tab">
            <section class="ftco-section bg-white">
               <div class="table-responsive">
                  <table class="t_margin_auto width100 ds-table">
                     <colgroup>
                        <col style="width: 30%" />
                        <col style="width: 40%" />
                        <col style="width: 30%" />
                     </colgroup>
                     <thead>
                        <tr>
                           <th class="title bg-light">주문일자</th>
                         <th class="title bg-light">주문번호</th>
                           <th class="title bg-light">상품명</th>
                            <th class="title bg-light">주문수량</th>
                             <th class="title bg-light">상품가격</th>
                              <th class="title bg-light">주문상태</th>
                        </tr>
                     </thead>
                     <tbody>
                     <tr>
                          <!--  <td>주문일자</td> -->
                           <td>DB 삽입 ${order.order_date }</td>
                           <td></td>
                        </tr>
                     <tr>
                          <!--  <td>주문번호</td> -->
                           <td>DB 삽입 ${order.order_num }</td>
                           <td></td>
                        </tr>
                        <tr>
                           <!-- <td>상품명</td> -->
                           <td>DB 삽입 ${p.prod_name }</td>
                           <td></td>
                        </tr>
                        <tr>
                          <!--  <td>주문수량</td> -->
                           <td>DB 삽입 ${order.order_count }</td>
                           <td></td>
                        </tr>
                        <tr>
                         <!--   <td>상품가격</td> -->
                           <td>DB 삽입 ${product.prod_price }</td>
                           <td></td>
                        </tr>
                         <tr>
                          <!--  <td>주문상태</td> -->
                           <td>DB 삽입 ${user_id }</td>
                           <td></td>
                        </tr> 
                         <div class="ftco-section bg-white">
                     <input type="button" class="edit" onclick="location.href='orderdetail_test'" value="조회하기" />
                  </div> 
                     </tbody>
                  </table>
               </div>
            </section>
         </div>

			<!-- 배송지 관리 내역 내용 -->
			<div class="tab-pane fade" id="delivery" role="tabpanel"
				aria-labelledby="delivery-tab">
				<section class="ftco-section bg-white">
					<div class="container">배송지 관리가 구현될 공간입니다.</div>
				</section>
				<section class="ftco-section bg-white">
					<div class="item">
						<div class="ftco-section bg-white">
							<input type="submit" class="edit" value="저장하기" />
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<script>
          document.write(new Date().getFullYear());
        </script>
			The 6th Multicampus FullStack Project. All rights reserved | <a
				href="index.html" target="_blank">petmily.com</a> <br />Team.이해되시조
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

	<script src="${path}/resource/js/jquery.min.js"></script>
	<script src="${path}/resource/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${path}/resource/js/popper.min.js"></script>
	<script src="${path}/resource/js/bootstrap.min.js"></script>
	<script src="${path}/resource/js/jquery.easing.1.3.js"></script>
	<script src="${path}/resource/js/jquery.waypoints.min.js"></script>
	<script src="${path}/resource/js/jquery.stellar.min.js"></script>
	<script src="${path}/resource/js/jquery.animateNumber.min.js"></script>
	<script src="${path}/resource/js/bootstrap-datepicker.js"></script>
	<script src="${path}/resource/js/jquery.timepicker.min.js"></script>
	<script src="${path}/resource/js/owl.carousel.min.js"></script>
	<script src="${path}/resource/js/jquery.magnific-popup.min.js"></script>
	<script src="${path}/resource/js/scrollax.min.js">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false">
    </script>
	<script src="${path}/resource/js/google-map.js"></script>
	<script src="${path}/resource/js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="./script.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
