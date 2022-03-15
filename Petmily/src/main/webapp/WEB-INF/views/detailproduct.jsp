<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />

<!-- Product section-->
<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="/upload/${product.prod_img }" alt="..." />
			</div>
			<div class="col-md-6">
				<div class="small mb-2" id="prod_num">${product.prod_num}</div>
				<h2 class="display-5 fw-bolder">${product.prod_title}</h2>
				<div class="fs-5 mb-5">
					<span class="text-decoration-line-through">${product.prod_price}</span>
				</div>
				<p class="lead">${product.prod_content}</p>
				<div class="d-flex">
					<form
						action="${pageContext.request.contextPath}/product/detail/${product.prod_num}/payment"
						method="post">
<!-- 						<input class="form-control text-center me-3" id="inputQuantity"
							name="order_count" type="number" value="1"
							style="max-width: 3rem" /><br />
						<button class="btn btn-outline-success flex-shrink-0" 
							type="button">
							<i class="bi-cart-fill me-1"></i>장바구니 담기
						</button> -->
						<input class="form-control text-center me-3" id="inputQuantity" type="number" name="order_count" value="1" min="1" style="max-width: 3rem" /><br/>
					<button class="btn btn-outline-success flex-shrink-0" type="button" id="insertCart">
						<i class="bi-cart-fill me-1"></i>장바구니 담기
					</button>
						
						<button id="check_module"
							class="btn btn-outline-success flex-shrink-0" type="button">
							<i class="bi-cart-fill me-1"></i>결제하기
						</button>
						<input type="submit" value="등록" style="display: none;" id="submit">

						<button id="review_write_form"
							class="btn btn-outline-success flex-shrink-0" type="button"
							onclick="location.href='${product.prod_num}/reviewrite'">
							<i class="bi-cart-fill me-1"></i>리뷰작성하기
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 리뷰 섹션 -->
<div class="py-4">
	<c:choose>
		<c:when test="${reviewlist!=null && pageInfo.listCount>=0 }">
			<div class="container px-5 px-lg-5 mt-5">
				<div
					class="row gx-5 gx-lg-5 row-cols-5 row-cols-md-5 row-cols-xl-5 justify-content-center">
					<div class="card-body p-3" style="border-radius: 15px">
						<table class="t_margin_auto width100 ds-table">
							<c:forEach var="r" items="${reviewlist}">
								<div
									class="testimonial-item position-relative bg-light border-top border-5 border-primary rounded p-4 mt-4">
									<div
										class="d-flex align-items-center justify-content-center  top-0 start-0 ms-5 translate-middle bg-primary rounded-circle"
										style="width: 45px; height: 45px; margin-top: -3px;">
										<i class="fa  text-white">리뷰</i>
									</div>
									<div>
										<span class="mt-3">${r.review_title}</span>
										<div class="d-flex align-items-center">
											<div class="ps-3">
												<h6 class="fw-bold mb-1">${r.review_content}</h6>
												<small>${r.review_create_date}</small>
											</div>
											<form
												action="/product/detail/${prod_num}/delete/${r.review_num}"
												method="post">
												<input type="submit" value="리뷰삭제" type="button"
													class="btn btn-success">
											</form>
											<form
												action="/product/detail/${prod_num}/update/${r.review_num}"
												method="get">
												<input type="submit" value="리뷰수정" type="button"
													class="btn btn-success">
											</form>

										</div>
									</div>
								</div>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</c:when>
	</c:choose>
</div>



<!-- 페이징 섹션  -->
<section id="pageList">
	<div class="container px-5 px-lg-5 mt-5 block-center">
		<c:choose>
			<c:when test="${pageInfo.page<=1}">
               [이전]&nbsp;
            </c:when>
			<c:otherwise>
				<a href="review?page=${pageInfo.page-1}">[이전]</a>&nbsp;
            </c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${pageInfo.startPage }"
			end="${pageInfo.endPage }">
			<c:choose>
				<c:when test="${pageInfo.page==i }">[${i }]</c:when>
				<c:otherwise>
					<a href="review?page=${i}">[${i }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pageInfo.page>=pageInfo.maxPage }">
               [다음]
            </c:when>
			<c:otherwise>
				<a href="review?page=${pageInfo.page+1}">[다음]</a>
			</c:otherwise>
		</c:choose>
	</div>
</section>





<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
$('#insertCart').click(function() {
    let prod_num = $('#prod_num').text();
    let inputQuantity = $('#inputQuantity').val();
    console.log("상품번호",prod_num);
    console.log("수량",inputQuantity);
    
    $.ajax({
       type: "post",
       data: {prod_num : prod_num, cart_amount : inputQuantity},
       url: "http://localhost:8080/cart/insertcart",
       success: function(data){
          alert(data);
          // window.location.reload();
       }
    })
// int plus_amount = cartDao.selectAmount(cartParam);
// if (plus_amount != 0) {
//    cart_amount += plus_amount
//   cartParam.put("cart_amount", cart_amount);
//   cartDao.updateQuan(cartParam);
// }
    
 })
	$("#check_module").click(function() {
		let inputQuantity = $("#inputQuantity").val();
		let price =Number(inputQuantity*${product.prod_price})
		var IMP = window.IMP; // 생략가능
		IMP.init('imp06765182');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			/*
			 'kakao':카카오페이,
			 html5_inicis':이니시스(웹표준결제)
			 'nice':나이스페이
			 'jtnet':제이티넷
			 'uplus':LG유플러스
			 'danal':다날
			 'payco':페이코
			 'syrup':시럽페이
			 'paypal':페이팔
			 */

			pay_method : 'card',
			/*
			 'samsung':삼성페이,
			 'card':신용카드,
			 'trans':실시간계좌이체,
			 'vbank':가상계좌,
			 'phone':휴대폰소액결제
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/*
			 merchant_uid에 경우
			 https://docs.iamport.kr/implementation/payment
			 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 참고하세요.
			 나중에 포스팅 해볼게요.
			 */
			name : `${product.prod_name}`,
			//결제창에서 보여질 이름
			amount : price,
			//가격
			buyer_email : `${user.user_email}`,
			buyer_name : `${user.user_name}`,
			buyer_tel : `${user.user_phone}`,
			buyer_addr : `${user.user_totaddress}`,
			buyer_postcode : `${user.user_zipcode}`,
			m_redirect_url : 'http://www.localhost8080/payments/complete'
			// 결제창에서 보여질 유저이름 
		/*
		 모바일 결제시,
		 결제가 끝나고 랜딩되는 URL을 지정
		 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		 */
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.'
				msg += '에러내용 : ' + rsp.error_msg;
				$("#submit").click(); //테스트용
			}
			alert(msg);
		});
	});
</script>
<!-- footer include -->
<jsp:include page="footer.jsp" />
<script>
   $(document).ready(function() {
      $('li.active').removeClass('active');
      $('a[href="' + "/product" + '"]').closest('li').addClass('active');
   });
</script>

