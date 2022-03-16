<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<style>
@media screen and (min-width:670px) {
	#grid1 {
		display: none;
	}
	#grid2 {
		display: block;
	}
}

@media screen and (max-width:670px) {
	#grid1 {
		display: block;
	}
	#grid2 {
		display: none;
	}
}
</style>
<!-- header include -->
<jsp:include page="header.jsp" />
<!-- nav -->
<div class="container" style="margin-top: 30px">
	<div class="row no-gutters slider-text align-items-end">
		<div class="col-md-9 ftco-animate pb-5">
			<p class="breadcrumbs mb-2">
				<span class="mr-2">myinfo <i class="ion-ios-arrow-forward"></i></span>
			</p>
			<h1 class="mb-0 bread">MyPage</h1>
		</div>
	</div>
</div>
<!-- END nav -->
<section>
	<div id="grid1" class="container">
		<ul class="nav justify-content-center">
			<li class="nav-item dropdown">
				<button type="button"
					class="nav-link dropdown-toggle btn btn-outline-success "
					data-toggle="collapse" data-target="#demo" style="width: 400px;"></button>
				<div class="collapse" id="demo">
					<button type="button" class="nav-link btn btn-outline-success"
						id="myinfo-tab1" style="width: 400px;">나의 정보</button>
					<button type="button" class="nav-link btn btn-outline-success"
						id="subscribe-tab1" style="width: 400px;">구독 내역</button>
					<button type="button" class="nav-link btn btn-outline-success"
						id="order-tab1" style="width: 400px;">주문 내역</button>
					<button type="button" class="nav-link btn btn-outline-success"
						id="delivery-tab1" style="width: 400px;">배송지 관리</button>
				</div>
			</li>
		</ul>
	</div>
	<div id="grid2">
		<ul class="nav justify-content-center">
			<li class="nav-item" role="presentation" style="margin-right: 10px;">
				<button type="button"
					class="nav-link active btn btn-outline-success " id="myinfo-tab"
					style="width: 150px;">나의 정보</button>
			</li>
			<li class="nav-item" role="presentation" style="margin-right: 10px;">
				<button type="button" class="nav-link btn btn-outline-success"
					id="subscribe-tab" style="width: 150px;">구독 정보</button>
			</li>
			<li class="nav-item" role="presentation" style="margin-right: 10px;">
				<button type="button" class="nav-link btn btn-outline-success"
					id="order-tab" style="width: 150px;">주문 내역</button>
			</li>
			<li class="nav-item" role="presentation" style="margin-right: 10px;">
				<button type="button" class="nav-link btn btn-outline-success"
					id="delivery-tab" style="width: 150px;">배송지 관리</button>
			</li>
		</ul>
	</div>
</section>

<!-- 나의 정보 내역 내용 -->
<div class="tab-content mx-5" id="myTabContent">
	<div class="row d-flex justify-content-center align-items-center h-100">
		<div style="height: 700px; width: 600px; margin-top: 100px">
			<div id="myinfoPage" class="pageSection">
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<th scope="row">Name</th>
								<td>${user.user_name }</td>
							</tr>
							<tr>
								<th scope="row">Id</th>
								<td>${user.user_id }</td>
							</tr>
							<tr>
								<th scope="row">Nickname</th>
								<td>${user.user_nickname }</td>
							</tr>
							<tr>
								<th scope="row">Phone</th>
								<td>${user.user_phone }</td>
							</tr>

						</tbody>

					</table>
				</div>
				<div>

					<input type="button" class="btn btn-success"
						onclick="location.href='usermodify'" value="수정하기" />
				</div>
			</div>


			<!-- 구독 내역 내용 -->
			<div id="subPage" class="pageSection" style="display: none">
				<form action="withdraw_membership" method="post" name="form1">
					<div class="table-responsive">
						<div class="card" style="border-radius: 15px">
							<div class="card-body p-5">
								<table class="t_margin_auto width100 ds-table">
									<tbody>

										<c:choose>
											<c:when test="${empty rmem}">
												<tr>
													<td>아직 구독중인 상품이 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
                         ${user.user_nickname }님의 구독중인 서비스
                      <c:forEach items="${rmem }" var="rmem">
													<th scope="row">${rmem.mem_grade}</th>
													<tr>
														<td>다음 결제일은 ${rmem.mem_next_date}</td>
														<td style="padding-left: 25px;"><input
															class="Withdrawal" type="checkbox"
															value="${rmem.mem_grade}" style="display: none;"
															name="memcheck[]"></td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<br> <input type="button" class="btn btn-success" onclick="'"
						value="구독해지" id="withdrawal_btn" />
					<div style="display: none" class="Withdrawal">
						<input type="text" placeholder='"구독해지" 를 입력해주세요'
							style="margin-top: 5%;" class="form-control" id="check" /> <input
							type="submit" value="확인" style="margin-top: 1%;"
							class="btn btn-danger" id="submit" />
					</div>
				</form>
			</div>

			<!-- 주문 내역 내용 -->
			<div id="orderPage" class="pageSection" style="display: none">
				<div class="table-responsive">
					<table class="table">
						<!-- <thead class="table-success">
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">주문일자</th>
								<th scope="col">상품명</th>
								<th scope="col">주문수량</th>
								<th scope="col">상품가격</th>
							</tr>
						</thead> -->
						<thead>
							<tr>
								<th style="width: 25%">주문일자</th>
								<th style="width: 25%">상품명</th>
								<th style="width: 25%">주문수량</th>
								<th style="width: 25%">상품가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${orderList }">
								<tr>
									<td>${order.order_date }</td>
									<td>${order.prod_name }</td>
									<td>${order.order_count }</td>
									<td>${order.prod_price }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<section id="pageList">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
						<c:otherwise>
							<a href="mypageinfo?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">[${i }]</c:when>
							<c:otherwise>
								<a href="mypageinfo?page=${i}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
						<c:otherwise>
							<a href="mypageinfo?page=${pageInfo.page+1}">[다음]</a>
						</c:otherwise>
					</c:choose>
				</section>
			</div>


			<!-- 배송지 관리 내역 내용 -->
			<div id="deliveryPage" class="pageSection" style="display: none">
				<form id="form" action="mypageinfo" method="post">
					<!--다음 주소 api  -->
					<div class="form-outline mb-2">
						<input type="button" readonly onclick="findAddr()" value="우편번호 찾기"
							class="btn btn-success" style="margin-bottom: 30px" /> <input
							id="member_post" name="user_zipcode" type="text"
							class="form-control form-control-lg"
							value="${user.user_zipcode }" readonly /><br /> <label
							class="form-label" for="form3Example3cdg">주소</label> <input
							type="text" class="form-control form-control-lg"
							placeholder="주소를 입력해주세요." name="user_address1"
							value="${user.user_address1 }" id="address" readonly /><br /> <label
							class="form-label" for="form3Example3cdg">상세주소</label> <input
							id="detail" name="user_address2" type="text"
							class="form-control form-control-lg"
							value="${user.user_address2 }" placeholder="상세주소를 입력해주세요" />
					</div>

					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer"
						style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnCloseLayer"
							style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1;"
							onclick="closeDaumPostcode()" alt="닫기 버튼" />
					</div>
					<div>
						<input type="submit" class="btn btn-success" value="수정하기"
							style="margin-top: 30px" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- footer include -->
<jsp:include page="footer.jsp" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById('member_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById('address').value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById('address').value = jibunAddr;
				}
			},
		}).open();
	}
	//  wide 
	$('.nav-link').click(function() {
		$('.nav-link').removeClass('active');
		$(this).addClass('active');
	});

	$('#myinfo-tab').click(function() {
		$('.pageSection').css('display', 'none');
		$('#myinfoPage').css('display', 'block');
	});

	$('#subscribe-tab').click(function() {
		$('.pageSection').css('display', 'none');
		$('#subPage').css('display', 'block');
	});

	$('#order-tab').click(function() {
		$('.pageSection').css('display', 'none');
		$('#orderPage').css('display', 'block');
	});

	$('#delivery-tab').click(function() {
		$('.pageSection').css('display', 'none');
		$('#deliveryPage').css('display', 'block');
	});

	// dropdown
	$('#myinfo-tab1').click(function() {
		$('.pageSection').css('display', 'none');
		$('#myinfoPage').css('display', 'block');
	});

	$('#subscribe-tab1').click(function() {
		$('.pageSection').css('display', 'none');
		$('#subPage').css('display', 'block');
	});

	$('#order-tab1').click(function() {
		$('.pageSection').css('display', 'none');
		$('#orderPage').css('display', 'block');
	});

	$('#delivery-tab1').click(function() {
		$('.pageSection').css('display', 'none');
		$('#deliveryPage').css('display', 'block');
	});

  $(document).ready(function () {
    $('li.active').removeClass('active');
    $('a[href="' + 'mypageinfo' + '"]')
      .closest('li')
      .addClass('active');
  });
  
  $('#withdrawal_btn').click(function () {
	  if($('.Withdrawal').is(":visible")){
		  $('.Withdrawal').css('display', 'none');
		}else{
			$('.Withdrawal').css('display', 'block');
		}
	  });
  
  $('#submit').click(function(){
	 if($("input:checkbox[name='memcheck[]']").is(":checked")==false){
		 Swal.fire({
	            icon: 'error',
	            title: '구독권을 선택해주세요.',
	            text: '다시 한번 시도해주세요.',
	          });
		return false;
	 }
	 else if($('#check').val()!="구독해지"){
		 $('#check').focus();
		 Swal.fire({
	            icon: 'error',
	            title: '구독해지를 적어주세요.',
	            text: '다시 한번 시도해주세요.',
	          });
		 return false;
	 }
	 else{
		 return true;
	 }
  });
 
  
</script>
<script>
	$(document).ready(function() {
		$('li.active').removeClass('active');
		$('a[href="' + "/mypageinfo" + '"]').closest('li').addClass('active');
	});
</script>

