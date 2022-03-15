<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<section class="ftco-section">
	<div class="mask d-flex align-items-center h-100 gradient-custom-3">
		<div class="container h-100">
			 <div class="row w-100">
            <div class="col-lg-12 col-md-12 col-12">
                <h3 class="display-5 mb-2 text-center">현재 담은 물품</h3>
                <p class="mb-5 text-center">
                    <i class="text-info font-weight-bold">${cartList.size() }</i> 개의 상품이 있어요.</p>
                <table id="shoppingCart" class="table table-condensed table-responsive">
                    <thead>
                    <tr>
                        <th style="width:60%">상품</th>
                        <th style="width:12%">수량</th>
                        <th style="width:8%">가격</th>
                        <th style="width:10%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="prod" items="${prodList}" varStatus="status">
	                    <tr>
	                        <td data-th="Product">
	                            <div class="row">
	                                <div class="col-md-3 text-left">
	                                    <img src='upload/${prod.prod_img}' alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
	                                </div>
	                                <div class="col-md-9 text-left mt-sm-2">
	                                    <h4>${prod.prod_name}</h4>
	                                    <p class="font-weight-light">설명 : ${prod.prod_content}</p>
	                                </div>
	                            </div>
	                        </td>
	                        <td data-th="Quantity">
								<input type="number" id="${prod.prod_num }quan" class="quan btn btn-light" value="${cartList[status.index].cart_amount}" min="1">
								<input type="hidden" class="total" value="${cartList[status.index].cart_amount * prod.prod_price}">
	                        </td>
	                        <td data-th="Price">${prod.prod_price}</td>
	                        <td class="actions" data-th="">
	                            <div class="text-right">
	                                <button id="${prod.prod_num }" onClick="deleteCart(this.id)" class="deleteBtn btn btn-white border-secondary bg-white btn-md mb-2">
	                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="8" height="8" viewBox="0 0 8 8">
	                                        <defs>
	                                            <clipPath id="clip-path">
	                                                <rect width="8"
														height="8" fill="none" />
	                                            </clipPath>
	                                        </defs>
	                                        <g id="close"
														clip-path="url(#clip-path)">
	                                            <path id="close-2"
														data-name="close"
														d="M5.4,4,7.7,1.7A.967.967,0,0,0,7.7.3.967.967,0,0,0,6.3.3L4,2.6,1.7.3A.967.967,0,0,0,.3.3a.967.967,0,0,0,0,1.4L2.6,4,.3,6.3a.967.967,0,0,0,0,1.4A.908.908,0,0,0,1,8a.908.908,0,0,0,.7-.3L4,5.4,6.3,7.7a.967.967,0,0,0,1.4,0,.967.967,0,0,0,0-1.4Z"
														fill="#202124" />
	                                        </g>
	                                    </svg>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div class="float-right text-right">
						<h4>총 금액</h4>
						<h1 id="totalPrice"></h1>
					</div>
				</div>
			</div>
			<form
				action="${pageContext.request.contextPath}/cart"
				method="post">
				<div class="row mt-4 d-flex align-items-center">
					<div class="col-sm-6 order-md-2 text-right">
						<input type="button" id="check_module" value="결제하기"
							class="btn btn-primary mb-4 btn-lg pl-5 pr-5"> <input
							type="submit" value="등록" style="display: none;" id="submit">
					</div>
				</div>
				</form>
		</div>
	</div>
</section>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
$(function() {
	totalCal();
	$(".quan").change(function() {
		totalCal();
	})
})

function deleteCart(id) {
	
	let prod_id = id;
	
	$.ajax({
		type: "post",
		data: {prod_id : prod_id},
		url: "http://localhost:8080/cart/deletecart",
		success: function(data){
			alert(data);
			window.location.reload();
		}
	})
	
}
function totalCal() {
	// 이렇게 장바구니에 담긴 제품번호를 가져온다.
	var numList = [];
	<c:forEach items="${prodList}" var="product">
	numList.push("${product.prod_num}"); 
	</c:forEach>
	
	// 제품수량을 가져온다. (변경 내용까지 반영)
	var quanList = [];
	for(const prod of numList) {
		quanList.push($('#'+prod+"quan").val());
	}
	
	var objParams = {
			"numList" : numList,
			"quanList" : quanList
	}
	// 이제 이 데이터 두개만 전달해버리면 컨트롤러에서 계산하고, 총 금액을 전달해주면 됨/
	$.ajax({
		type: "post",
		data: {objParams: JSON.stringify(objParams)},
		url: "http://localhost:8080/cart/gettotal",
		success: function(data) {
			 $('#totalPrice').text(data);
		},
		error: function(data) {
			alert('에러 발생');
		}
	})
}

	$("#check_module").click(function() {
		
		let inputQuantity = $("#inputQuantity").val();
		let price =parseInt($("#totalPrice").text());
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
			
			name : `${cartList.size() }`+"개의 상품",
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
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				$("#submit").click(); //테스트용
			}
			alert(msg);
		});
	});

</script>



<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
$("#check_module")
.click(
		function() {
			let price=  (JSON.stringify('{totalprice}').val());
			alert(price)
			var IMP = window.IMP; // 생략가능
			IMP.init('imp06765182');
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP
					.request_pay(
							{
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
name : `${prod.prod_name}`,
//결제창에서 보여질 이름
amount : price,
//가격
buyer_email : 'iamport@siot.do',
buyer_name : '구매자이름',
buyer_tel : '010-1234-5678',
buyer_addr : '서울특별시 강남구 삼성동',
buyer_postcode : '123-456',
m_redirect_url : 'http://www.localhost8080/payments/complete'
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
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});
</script>


<script>
	$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "/cart" + '"]').closest('li').addClass('active');
	});

</script>





<!-- footer include -->
<jsp:include page="footer.jsp" />
