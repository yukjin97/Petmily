<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

	<link rel="stylesheet" type="text/css" href="${path }/resource/css/slick.css"/>
	<link rel="stylesheet" type="text/css" href="${path }/resource/css/common.css">
	<link rel="stylesheet" type="text/css" href="${path }/resource/css/sub.css">
	<link rel="stylesheet" type="text/css" href="${path }/resource/css/mall.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
	<link href="https://fonts.googleapis.com/css?family=Exo:300,600,800&display=swap" rel="stylesheet"> <!-- 200213 수정 -->
	<script type="text/javascript" src="${path }/resource/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="${path }/resource/js/slick.min.js"></script>
	<script type="text/javascript" src="${path }/resource/js/common.js"></script>
	
<jsp:include page="header.jsp" />

<div id="wrap">

		<!-- container -->
		<div class="container">

			<section class="sub-content order">

				<div class="title-area">
					<h2 class="page-title">주문결제</h2>
				</div>

				<div class="lay-st-payment" style="margin-left:25%;">

					<div class="left-cont-area" >
						<!-- 주문상품 -->
						<div class="cont-group mt0">
							<div class="toggle-title">
								<h3 class="cont-tit">주문상품</h3>
							</div>

							<div class="toggle-content open">
								<table class="tbl-st-col order">
									<colgroup>
										<col style="width:18.5%;" />
										<col style="width:auto;" />
										<col style="width:20.98%;" />
										<col style="width:20.98%;" />
										<col style="width:60px;" />
									</colgroup>
									<tbody>
										<tr>
											<td class="product-img">
												
													<img src="${path}/resource/images/${mem_img }"/>
												
											</td>
											<td class="product-info">
												<p class="tit">${mem_name }</p>
												<p class="count">${mem_price } 원</p>
											</td>
											<td>
												<div class="btn-comm-wrap">
													<!-- <input type="button" class="btn-comm btn-xs bg-grayline">삭제</input> -->
												</div>
											</td>
											<td class="price">
												${mem_price } 원
											</td>
											
										</tr>
										
									</tbody>
								</table>
								<!-- //tbl-wrap -->
							</div>
						</div>
						<!-- //주문상품 -->

						<!-- 배송지 입력 -->
						<div class="cont-group mt0">
							<div class="toggle-title">
								<h3 class="cont-tit">구매자 정보 및 배송지 입력</h3>
								<!-- <p class="guide-txt">※ 배송비는 해당 업체에 따라 부과되며 별도 배송됩니다.</p> -->
							</div>

							<div class="toggle-content open">
								<div class="txt-box ty02 write-form">
									<table>
										<%-- <caption>구매자 정보</caption> --%>
										<colgroup>
											<col style="width:120px;" />
											<col style="width:auto;" />
										</colgroup>
										<tbody>
											<tr>
												<th class="required">이름</th>
												<td><input type="text" class="inp-txt" value="${pay.user_name }" disabled /></td>
											</tr>
											<tr>
												<th class="required">휴대폰번호</th>
												<td><input type="text" class="inp-txt" value="${pay.user_phone }" disabled/></td>
											</tr>

											<tr>
												<th scope="row" class="required">주소</th>
												<td>
													<div class="inp-box address">
														<input type="text" class="inp-txt" value="${pay.user_address1 }" disabled/>
													</div>
													<input type="text" class="inp-txt" value="${pay.user_address2 }" disabled/>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								

						
						<!-- 결제금액 -->
						<div class="cont-group mt0">

							<div class="payment-info payment-box" style=" border-top: 2px solid black;">
								<h3 class="cont-tit">결제금액</h3>

								<div class="price-list product">
									<div class="total-price-info">
										<em class="tit">총 주문금액</em>
										<span class="price">${mem_price } 원</span>
									</div>

							

								<div class="price-list total">
									<div class="total-price-info">
										<em class="tit">총 결제금액</em>
										<span class="price">${mem_price } 원</span>
									</div>

									<ul class="price-info">
										<li>
											<em class="tit">총 상품금액</em>
											<span class="price">${mem_price } 원</span>
										</li>
										<li>
											<em class="tit">총 할인금액</em>
											<span class="price">(-) 000,000원</span>
										</li>
										<li>
											<em class="tit">총 배송비</em> <!-- [D] 200305 총 배송비 추가 -->
											<span class="price">(+) 000,000원</span>
										</li>
									</ul>
								</div>
							</div>
							<!-- //payment-info -->

						</div>
						<!-- //결제금액 -->


						<div class="btn-comm-wrap">
							<input type="button"  class="btn-comm btn-md bg-line" value="결제" id="check_module" style="margin-top:20px;">
							<form action="mem_pay" method="post">
								<input  class="btn-comm btn-md" type="submit" value="등록" style="display: none;" id="submit">
							</form>
						</div>
					</div>
					<!-- //right-cont-area -->

				</div>

			</section>

		</div>
		<!-- //container -->

	


		<!-- [D] 200304 팝업 추가 -->

	</div>
	<!-- //wrap -->

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