<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css" href="../../resource/css/slick.css" />
<link rel="stylesheet" type="text/css" href="../../resource/css/common.css">
<link rel="stylesheet" type="text/css" href="../../resource/css/sub.css">
<link rel="stylesheet" type="text/css" href="../../resource/css/mall.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link href="https://fonts.googleapis.com/css?family=Exo:300,600,800&display=swap" rel="stylesheet">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<body>
<div id="wrap">
<div class="container">
	<form action="${pageContext.request.contextPath}/cart/mypageinfo" method="get">
		<section class="sub-content order pb-0">
			<div class="title-area"><h2 class="page-title">주문결제</h2></div>
	
			<div class="lay-st-payment" >
				<div class="center-cont-area">
					<!-- 주문상품 -->
					<div class="cont-group mt0">
						<div class="toggle-title"><h3 class="cont-tit">주문상품</h3></div>
						<div class="toggle-content open">
							<!--  table -->
							<table class="tbl-st-col order">
								<colgroup>
									<col style="width: 18.5%;" />
									<col style="width: auto;" />
									<col style="width: 20.98%;" />
									<col style="width: 20.98%;" />
									<col style="width: 60px;" />
								</colgroup>
								<tbody>
									<!--  반복 -->
										<c:forEach var="prod" items="${prodList}" varStatus="status">
											<tr>
												<!-- 반복1 a href(해당 상품에 대한 http://localhost:8080/product/detail/???), 이미지 경로 -->
												<td class="product-img">
													<a href="/product/">
														<img src="../
														upload/${prod.prod_img}" alt="" />
													</a>
												</td>
												<!-- 반복2 a hreft 똑같이, 상품명,  -->
												<td class="product-info">
													<a href="http://localhost:8080/product/detail" class="tit"> ${prod.prod_name}</a>
													<p class="option">설명 : ${prod.prod_content}</p>
													<p class="count">개수 : ${cartList[status.index].cart_amount}</p></td>
												<td class="price">가격 : ${prod.prod_price}</td>
											</tr>
										</c:forEach>
								</tbody>
							</table>
							<!-- // table -->
						</div>
					</div>
					<!-- //주문상품 -->
	
					<!-- 주문자 정보 -->
					<div class="cont-group mt0">
						<div class="toggle-title"><h3 class="cont-tit">주문자 정보</h3></div>
						<div class="toggle-content open">
							<!-- txt-box -->
							<div class="txt-box ty02 write-form">
								<!--  table -->
								<table>
									<colgroup>
										<col style="width: 120px;" />
										<col style="width: auto;" />
									</colgroup>
									
									<tbody>
										<tr>
											<th class="">이름</th>
											<td><input type="submit" class="inp-txt"
												value="${user.user_name }" /></td>
										</tr>
										<tr>
											<th class="">휴대폰번호</th>
											<td><input type="submit" class="inp-txt"
												value="${user.user_phone }" /></td>
										</tr>
	
										<tr>
											<th scope="row" class="">이메일</th>
											<td><input type="submit" class="inp-txt"
												value="${user.user_email }" /></td>
										</tr>
										<tr>
											<th scope="row" class="">주소</th>
											<td>						
												<input type="submit" class="inp-txt" value="${user.user_address1}" />													
				
											</td>
										</tr>
										
										<tr>
											<th scope="row" class="">상세주소</th>
											<td>																		
												<input type="submit" class="inp-txt" value="${user.user_address2}" />
											</td>
										</tr>
									</tbody>
								</table>
								<!--  //table -->
							</div>
							<!-- //txt-box -->
							
							
							
								
							
								
							<!-- txt-box -->
							<div class="txt-box ty02 write-form">
								<div class="payment-info payment-box pb-0" style=" border-top: 2px solid black;">
									<h3 class="cont-tit">결제금액</h3>
					
									<div class="price-list total pb-0">
										<div class="total-price-info">
											<em class="tit">총 결제금액</em> <span id="" class="price">${totalPrice } 원</span>
											<br/><br/><br/><br/>
											<div class="chk-agree-wrap">
			
											<div class="chk-custom">
												<input type="checkbox" name="chkAgree" id="chkAgree"> 
												<label for="chkAgree" class="required"><span></span>상품 주문 및 배송정보 수집에 동의합니다.</label> 
												<a href="javascript:void()" class="btn-more" onclick="show('popDeliTerm')">상세보기</a>
											</div>
								
											<div class="chk-custom">
												<input type="checkbox" name="chkAgree" id="chkAgree"> 
												<label for="chkAgree" class="required"><span></span>주문할 상품설명에 명시된 내용과 사용조건을 확인하였으며, 취소/환불규정에 동의합니다.</label>
												 <a href="javascript:void()" class="btn-more" onclick="popRefund">상세보기</a>
											</div>
										</div>
								
										<div class="chk-custom chk-all">
											<input type="checkbox" name="chkAgreeAll" id="chkAgreeAll">
											 <label for="chkAgreeAll" class="required"><span></span>모든 약관내용에 동의합니다.</label>
										</div>
										</div>
					
									</div>
								</div>
							</div>
							<!-- //txt-box -->

					</div>
				</div>
			</div>
		</section>

		<!-- 배송정보수집 -->
		<div id="popDeliTerm" class="pop-wrap alert order" style="display:none;">
			<div class="pop-wrap-inner">
				<div class="pop-cont-inner w660">
					<div class="pop-top-wrap">
						<h5 class="pop-tit ty02 bd-none">상품 주문 및 배송정보 수집</h5>
					</div>
					<div class="tbl-wrap">
						<table class="tbl-deli-term">
							<colgroup>
								<col width="15%">
								<col width="42.5%">
								<col width="42.5%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">수탁자</th>
									<th scope="col">위탁업무</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" rowspan="3">배송<br>서비스</th>
									<td>(주)멀캠, 입점사에서 사용하는 택배사 정보</td>
									<td>상품 및 경품의 배송</td>
								</tr>
								<tr>
									<td>우체국 EMS</td>
									<td>배송조회</td>
								</tr>
								<tr>
									<td>멀캠 영업소</td>
									<td>물류센터 업무 일체</td>
								</tr>
								<tr>
									<th scope="row">결제<br>처리</th>
									<td>NHN한국사이버결제주식회사, ㈜MultiCampus, 카카오페이, 페이코, 네이버페이</td>
									<td>신용카드, 휴대폰, 계좌이체 등을통한 결제처리</td>
								</tr>
								<tr>
									<th scope="row">본인<br>인증</th>
									<td>나이스평가정보</td>
									<td>휴대폰 본인인증</td>
								</tr>
								<tr>
									<th scope="row">알림<br>발송</th>
									<td>LGU+, 주식회사 케이티, ㈜ 카카오, NHN 주식회사, 휴머스온</td>
									<td>SMS 및 메세지 발송</td>
								</tr>
								<tr>
									<th scope="row">데이터<br>보관</th>
									<td>Amazon Web Services Inc.</td>
									<td>데이터 보관</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn-box">
						<a href="#" class="btn bg-gray03" onclick="layerPop.hide(this);return false;">창닫기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- //배송정보수집 -->

		<!-- 환불규정 -->
		<div id="popRefund" class="pop-wrap alert order" style="display:none;">
			<div class="pop-wrap-inner">
				<div class="pop-cont-inner">
					<p class="txt">주문하실 상품, 가격, 배송정보, 할인내역, 환불규정등을 최종 확인하였으며, 구매에 동의합니다.<br>(전자상거래법 제8조 제2항)</p>
					<div class="btn-box">
						<a href="#" class="btn bg-black" onclick="layerPop.hide(this);return false;">확인</a>
					</div>
				</div>
			</div>
		</div>
		<!-- //환불규정 -->
		
		
		<div class="btn-comm-wrap" style="padding-bottom:200px">
			<input type="button" class="btn-comm btn-md bg-line" onclick="history.back()" value="이전화면">
			<input type="submit" class="btn-comm btn-md" value="결제하기" style="display:none;">
			<input type="button" class="btn-comm btn-md" id="check_module" value="결제하기">
		</div>		
	</form>
</div>
</div>
	<!-- //container -->
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>

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
			//결제창에서 보여질 이ruf
			amount : `${totalPrice}`,
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
name : `${cartList.size()}`+"개의 상품",
//결제창에서 보여질 이름
amount : `${totalPrice}`,
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





$("form input[type='submit']").click();
});
});
</script>


<script>
	$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "/cart" + '"]').closest('li').addClass('active');
	});

</script>

</body>

<!-- footer include -->
<jsp:include page="footer.jsp" />
