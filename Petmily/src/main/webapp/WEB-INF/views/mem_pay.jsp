<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />

<section class="py-5" style="width: 1000px;margin: auto;padding-bottom: 0px;height: 796px;">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="${path}/resource/images/${mem_img }">
			</div>
			<div class="col-md-6">
		 <div class="row space-top space-left">
        <div class="col-8">
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <h3 style="width: 150px;">배송 정보</h3>
                        <label for="fname"><i class="fa fa-user"></i>이름</label><br>
                        <input type="text" id="fname" name="firstname" value="${pay.user_name }" style="width: 350px;" disabled><br>
                        <label for="email"><i class='fa fa-phone'></i>전화번호</label><br>
                        <input type="text" id="email" name="email" value="${pay.user_phone }" style="width: 350px;" disabled><br>
                        <label for="adr"><i class="fa fa-address-card-o"></i>주소</label>
                        <input type="text" id="adr" name="address" value="${pay.user_address1 }" style="width: 350px;" disabled>
                        <input type="text" id="city" name="city" value="${pay.user_address2 }" style="margin-top:10px; width:350px;" disabled><br>
						<label for="zip"><i class='fa fa-institution'></i>우편번호</label><br>
                        <input type="text" id="zip" name="zip" value="${pay.user_zipcode }" style="width: 350px;" disabled><br>
                        <label for="gradename"><i class='fa fa-paw'></i> 제품 이름</label><br>
                        <input type="text" id="zip" name="zip" value="${mem_name }" style="width: 350px;" disabled><br>
                        <label for="zip"><i class='fa fa-won'></i> 가격</label><br>
                        <input type="text" id="zip" name="zip" value="${mem_price }" style="width: 350px;" disabled><br>
                        <input type="button" value="결제" id="check_module" style="margin-top:20px;">
					 	<form action="mem_pay" method="post">
						<input type="submit" value="등록" style="display: none;" id="submit">
						</form>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
	</div>
		</div>
	</div>
<form action="mem_pay" method="post">
						<input type="submit" value="등록" style="display: none;" id="submit">
					</form>

</section>

<jsp:include page="footer.jsp" />
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
													merchant_uid : 'merchant_'
															+ new Date()
																	.getTime(),
													/*
													 merchant_uid에 경우
													 https://docs.iamport.kr/implementation/payment
													 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
													 참고하세요.
													 나중에 포스팅 해볼게요.
													 */
													name : `${mem_name}`,
													//결제창에서 보여질 이름
													amount : `${mem_price}`,
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
												},
												function(rsp) {
													console.log(rsp);
													if (rsp.success) {
														var msg = '결제가 완료되었습니다.';
														msg += '고유ID : '
																+ rsp.imp_uid;
														msg += '상점 거래ID : '
																+ rsp.merchant_uid;
														msg += '결제 금액 : '
																+ rsp.paid_amount;
														msg += '카드 승인번호 : '
																+ rsp.apply_num;
														$("#submit").click();
													} else {
														var msg = '결제에 실패하였습니다.';
														msg += '에러내용 : '
																+ rsp.error_msg;
														$("#submit").click(); //테스트용
													}
													alert(msg);
												});
							});
		</script>
<script>
			$(document).ready(
					function() {
						$('li.active').removeClass('active');
						$('a[href="' + "/subscribe" + '"]').closest('li')
								.addClass('active');
					});
		</script>