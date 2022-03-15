<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link
   href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
   rel="stylesheet" />

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="${path }/resource/css/animate.css" />
<link rel="stylesheet" href="${path }/resource/css/owl.carousel.min.css" />
<link rel="stylesheet"
   href="${path }/resource/css/owl.theme.default.min.css" />
<link rel="stylesheet" href="${path }/resource/css/magnific-popup.css" />
<link rel="stylesheet"
   href="${path }/resource/css/bootstrap-datepicker.css" />
<link rel="stylesheet"
   href="${path }/resource/css/jquery.timepicker.css" />
<link rel="stylesheet" href="${path }/resource/css/flaticon.css" />
<link rel="stylesheet" href="${path }/resource/css/style.css" />
<link rel="stylesheet" href="${path }/resource/fonts/icomoon/style.css" />

<title>Petmily</title>
<style>
.btn_gotop {
   display:none;
   position:fixed;
   bottom:30px;
   right:30px;
   z-index:999;
   border:1px solid #ccc;
   outline:none;
   background-color:white;
   color:green;
   cursor:pointer;
   padding:15px 20px;
   border-radius:100%;
}
</style>
<html>
<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<p class="mb-0 phone pl-md-2">
						<c:choose>
							<c:when test="${not empty user_id}">
								<a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span>
								 대표전화	:+82 1234 5678</a>
								<a href="#"><span class="fa fa-paper-plane mr-1"></span>
									${user_id}님 환영합니다.</a>
							</c:when>
						</c:choose>
					</p>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media">
						<p class="mb-0 d-flex">
							<a href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a> <a
								href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a> <a
								href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
							<a href="#"
								class="d-flex align-items-center justify-content-center"><span
								class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/"><span
				class="flaticon-pawprint-1 mr-2"></span>Petmily</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="fa fa-bars"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/" class="nav-link">Home</a></li>
					
					<c:choose>
						<c:when test="${user_type =='admin'}">
							<li class="nav-item"><a href="/admin_alluser"
								class="nav-link">Admin</a></li>
						</c:when>
						<c:otherwise>
							<!-- 								<li class="nav-item"><a href="admin_membership"
									class="nav-link">Admin</a></li> -->
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a href="/subscribe" class="nav-link">구독</a>
					</li>
					<li class="nav-item"><a href="/product" class="nav-link">스토어</a>
					</li>
					<li class="nav-item"><a href="/mypageinfo" class="nav-link">마이페이지</a>
					</li>
					<c:choose>
						<c:when test="${empty user_id}">
							<li class="nav-item"><a href="/login" class="nav-link">로그인</a>
							</li>
												<li class="nav-item"><a href="/join" class="nav-link">회원가입</a>
					</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a href="/logout" class="nav-link">로그아웃</a>
							</li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a href="/cart" class="nav-link">장바구니</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
</body>
</html>