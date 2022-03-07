<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<link rel="stylesheet" href="${path }/resource/css/petmily.css" />

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${path }/resource/fonts/icomoon/style.css">





</head>
<body>
	<jsp:include page="header.jsp" />

	<!-- Admin 페이지 탭 메뉴 -->
	<div
		style="float: left; width: 410px; margin-top: 50px; padding-left: 230px;">
		<div class="nav flex-column nav-tabs me-3" id="v-tab" role="tablist"
			aria-orientation="vertical">

			<button id="v-subscribe-tab"
				class="btn btn-success btn-block btn-lg gradient-custom-4
			"
				onclick="location.href='admin_membership'" data-bs-toggle="pill"
				type="button" role="tab"" onclick="location.href='admin_membership'">구독</button>

<!-- 			<button id="v-subscribe-product-tab"
				class="btn btn-success btn-block btn-lg gradient-custom-4
			"
				data-bs-toggle="pill" data-bs-target="#v-subscribe-product"
				type="button" role="tab" onclick="location.href=''">구독 상품 등록</button> -->

			<button id="v-add-product-tab" data-bs-toggle="pill"
				class="btn btn-success btn-block btn-lg gradient-custom-4
			"
				data-bs-target="#v-add-product" type="button" role="tab"
				onclick="location.href='admin_product'">상품등록</button>

			<button id="v-remain-product-tab"
				class="btn btn-success btn-block btn-lg gradient-custom-4
			"
				data-bs-toggle="pill" data-bs-target="#v-remain-product"
				onclick="location.href='admin_inventory'" type="button" role="tab">상품
				재고</button>

			<button id="v-order-tab" data-bs-toggle="pill"
				class="btn btn-success btn-block btn-lg gradient-custom-4
			"
				data-bs-target="#v-order" type="button" role="tab" onclick="location.href='admin_order'">상품 주문</button>

			<button id="v-delivery-tab" data-bs-toggle="pill"
				class="btn btn-success btn-block btn-lg gradient-custom-4
			"
				data-bs-target="#v-delivery" type="button" role="tab" onclick="location.href='admin_ship'">배송</button>
		</div>
	</div>


	<section id="inventory_form"
		style="padding-left: 500px; height: 1150px; width: 1500px; padding-top: 50px; padding-bottom: 100px;">


		<c:choose>
			<c:when test="${admin_inventory!=null && pageInfo.listCount>0 }">
				<section id="listForm">

					<h2 class="mb-5"
						style="text-decoration: underline; text-underline-position: under;">재고
						관리</h2>
					<form action="admin_inventory" method="get">
						<input type="text" id="search_inven" name="search_inven" /> <input
							type="submit" value="찾기" class="btn btn-outline-success"
							style="padding-left: 10px; padding-right: 10px; padding-top: 6.5; padding-top: 6.5; padding-top: 6.5; padding-top: 6px; padding-bottom: 7px;" />
					</form>

					<div class="table-responsive">

						<table class="table custom-table">
							<thead>
								<tr>
									<th scope="col">상품이름</th>
									<th scope="col">상품명</th>
									<th scope="col">총물량</th>
									<th scope="col">남은재고</th>
									<th scope="col">단품재고</th>
									<th scope="col">실버주문</th>
									<th scope="col">골드주문</th>
									<th scope="col">부족수량</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${admin_inventory }" var="admin_inventory">
									<tr>
										<!-- 		 	  체크버튼기능						<th scope="row"><label class="control control--checkbox">
											<input type="checkbox" />
											<div class="control__indicator"></div>
									</label></th> -->
										<td>${admin_inventory.prod_name }</td>
										<td>${admin_inventory.prod_allamount }</td>
										<td>${admin_inventory.prod_amount }</td>
										<td>${admin_inventory.prod_solo }</td>
										<td>${admin_inventory.prod_silver }</td>
										<td>${admin_inventory.prod_gold }</td>
										<td>${admin_inventory.remain_amount }</td>
										<form action="add_amount" method="post" name="add_amount">
											<td><input type="button" value="재고추가"
												class="btn btn-outline-dark"
												style="padding-left: 13px; padding-right: 13px; padding-top: 7px; padding-bottom: 7px;"
												id=${admin_inventory.prod_name }></td>
											<td id=${admin_inventory.prod_num } style="display: none"><input
												type="hidden" id="prod_num" name="prod_num"
												value="${admin_inventory.prod_num }"> <input
												type="text" id="addamount" name="addamount"> <input
												type="submit" value="추가"></td>
										</form>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</section>
				<section id="pageList">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
						<c:otherwise>
							<a
								href="admin_inventory?page=${pageInfo.page-1}&search_inven=${search_inven}">[이전]</a>&nbsp;
				</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">[${i }]</c:when>
							<c:otherwise>
								<a href="admin_inventory?page=${i}&search_inven=${search_inven}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
						<c:otherwise>
							<a
								href="admin_inventory?page=${pageInfo.page+1}&search_inven=${search_inven}">[다음]</a>
						</c:otherwise>
					</c:choose>
				</section>
			</c:when>
			<c:otherwise>
				<form action="admin_inventory" method="get">
					<input type="text" id="search_inven" name="search_inven" /> <input
						type="submit" value="찾기" 
						class="btn btn-outline-success"
							style="padding-left: 10px; padding-right: 10px; padding-top: 6.5; padding-top: 6.5; padding-top: 6.5; padding-top: 6px; padding-bottom: 7px;" />
				</form>
				<section id="emptyArea">구독 회원이 없습니다.</section>
			</c:otherwise>
		</c:choose>


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
	<script>
		$(function() {
			<c:forEach items="${admin_inventory }" var="admin_inventory">
			$("#${admin_inventory.prod_name }").click(function() {
				$("#${admin_inventory.prod_num }").toggle();
			});
			</c:forEach>
		});
	</script>
</body>
</html>
