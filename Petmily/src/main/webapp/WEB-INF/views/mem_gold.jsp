<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="${path }/resource/css/petmily.css" />

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${path }/resource/fonts/icomoon/style.css">





</head>
<body>
	<jsp:include page="header.jsp" />
     <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">Gold Pakage</div>
                        <h1 class="display-5 fw-bolder">Very Nice Gold Pakage</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">19,800 (원)</span>
                        </div>
                        <p class="lead">
						<span style="color:green;">첫번째</span> 상품 : <span style="color:black;">강형욱도 먹는 </span><span style="color:red;">특급</span> 개사료! <br>
						<span style="color:green;">두번째</span> 상품 : <span style="color:black;"> Holly shit</span><span style="color:red;"> 특급</span> 개껌 ! <br>
						<span style="color:green;">세번째</span> 상품 : <span style="color:black;"> 명품 </span><span style="color:red;">특급 </span>개옷 ! <br>
						</p>
                        <div class="d-flex">
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="location.href='mem_pay'">
                                <i class="bi-cart-fill me-1"></i>
                                구독 하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


	<jsp:include page="footer.jsp" />
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

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	
</body>
</html>