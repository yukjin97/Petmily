<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<c:set var="path" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
    <title>펫밀리</title>
    <meta charset="utf-8"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
            href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
            rel="stylesheet"/>

    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

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
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.html">Petmily</a>
        <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#ftco-nav"
                aria-controls="ftco-nav"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a href="admin.html" class="nav-link"><b>Admin</b></a>
                </li>
                <li class="nav-item">
                    <a href="subscribe.html" class="nav-link">구독</a>
                </li>
                <li class="nav-item">
                    <a href="store.html" class="nav-link">스토어</a>
                </li>
                <li class="nav-item">
                    <a href="mypage.html" class="nav-link">마이페이지</a>
                </li>
                <li class="nav-item">
                    <a href="join.html" class="nav-link">회원가입</a>
                </li>
                <li class="nav-item">
                    <a href="login.html" class="nav-link">로그인</a>
                </li>
                <li class="nav-item">
                    <a href="cart.html" class="nav-link">장바구니</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 상단 배너-->
<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.png');"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Petmily <i
                        class="ion-ios-arrow-forward"></i></a></span> <span>Subscribe <i
                        class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-0 bread">구독</h1>
            </div>
        </div>
    </div>
</section>

<!-- 구독서비스 설명 -->
<section class="ftco-section bg-light">
    <div class="container">
        구독서비스에 대한 설명이 쓰일 공간입니다.
    </div>
</section>

<!-- 구독서비스 이미지 -->
<section class="ftco-section bg-light">
    <div class="container">
        구독 서비스 이미지가 들어갈공간입니다.
    </div>
</section>

<!-- 정기구독 -->
<section class="ftco-section bg-light">
    <div class="row justify-content-center pb-5 mb-3">
        <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>정기구독상품</h2>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 ftco-animate">
                <div class="block-7">
                    <div class="img" style="background-image: url(images/pricing-1.jpg);"></div>
                    <div class="text-center p-4">
                    
                    

                        <span class="excerpt d-block">Silver 패키지</span>
                        <span class="price"><span class="number" id="price">9,800</span> <sub>원 /월</sub></span>

                        <ul class="pricing-text mb-5">
                            <li id="fix1"><span class="fa fa-check mr-2"></span>fix제품 1</li>
                            <li id="fix2"><span class="fa fa-check mr-2"></span>fix제품 2</li>
                            <li id="fix3"><span class="fa fa-check mr-2"></span>fix제품 3</li>
                        </ul>

                        <input type="button" value="구독" onclick="location.href='mem_silver'">
       				 
       				 
                    </div>
                </div>
            </div>
            <div class="col-md-4 ftco-animate">
                <div class="block-7">
                    <div class="img" style="background-image: url(images/pricing-2.jpg);"></div>
                    <div class="text-center p-4">
                        <span class="excerpt d-block">Gold 패키지</span>
                        <span class="price"><span class="number" id="price">13,800</span> <sub>원 /월</sub></span>

                        <ul class="pricing-text mb-5">
                            <li id="fix1"><span class="fa fa-check mr-2"></span>fix제품 4</li>
                            <li id="fix2"><span class="fa fa-check mr-2"></span>fix제품 5</li>
                            <li id="fix3"><span class="fa fa-check mr-2"></span>fix제품 6</li>
                        </ul>

                            <input type="button" value="구독" onclick="location.href='mem_gold'">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <script>
            document.write(new Date().getFullYear());
        </script>
        The 6th Multicampus FullStack Project. All rights reserved |
        <a href="index.html" target="_blank">petmily.com</a>
        <br>Team.이해되시조 | 김진하,송욱진,엄병수,원선영,윤세종,이산하,차현
    </div>
</footer>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
    <svg class="circular" width="48px" height="48px">
        <circle
                class="path-bg"
                cx="24"
                cy="24"
                r="22"
                fill="none"
                stroke-width="4"
                stroke="#eeeeee"
        />
        <circle
                class="path"
                cx="24"
                cy="24"
                r="22"
                fill="none"
                stroke-width="4"
                stroke-miterlimit="10"
                stroke="#F96D00"
        />
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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="${path }/resource/js/google-map.js"></script>
<script src="${path }/resource/js/main.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="./script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>