<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />

<!-- 마이페이지 탭 메뉴 -->
<section>
   <ul class="nav nav-tabs justify-content-center" id="myTab"
      role="tablist">
      <li class="nav-item" role="presentation">
         <button class="nav-link active" id="myinfo-tab" data-bs-toggle="tab"
            data-bs-target="#myinfo" type="button" role="tab"
            aria-controls="myinfo" aria-selected="true">나의 정보</button>
      </li>
      <li class="nav-item" role="presentation">
         <button class="nav-link" id="subscribe-tab" data-bs-toggle="tab"
            data-bs-target="#subscribe" type="button" role="tab"
            aria-controls="subscribe" aria-selected="false">구독 관리</button>
      </li>
      <li class="nav-item" role="presentation">
         <button class="nav-link" id="order-tab" data-bs-toggle="tab"
            data-bs-target="#order" type="button" role="tab"
            aria-controls="order" aria-selected="false">주문 내역</button>
      </li>
      <li class="nav-item" role="presentation">
         <button class="nav-link" id="delivery-tab" data-bs-toggle="tab"
            data-bs-target="#delivery" type="button" role="tab"
            aria-controls="delivery" aria-selected="false">배송지 관리</button>
      </li>
   </ul>

   <!-- 마이페이지 탭 내용 -->
   <div class="tab-content" id="myTabContent">
      <!-- 나의 정보 내용 -->
      <div class="tab-pane fade show active" id="myinfo" role="tabpanel"
         aria-labelledby="myinfo-tab">
         <section class="ftco-section bg-white">
            <div class="item">
               <div class="table-responsive">
                  <table class="t_margin_auto width100 ds-table">
                     <colgroup>
                        <col style="width: 30%" />
                        <col style="width: 70%" />
                     </colgroup>
                     <tbody>
                        <tr>
                           <td class="bg">이름</td>
                           <td>${user.user_name }</td>
                        </tr>
                        <tr>
                           <td class="bg">아이디</td>
                           <td>${user.user_id }</td>
                        </tr>
                        <tr>
                           <td class="bg">닉네임</td>
                           <td>${user.user_nickname }</td>
                        </tr>
                        <tr>
                           <td class="bg">전화번호</td>
                           <td>${user.user_phone }</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div>
                  <input type="button" class="edit"
                     onclick="location.href='usermodify'" value="수정하기" />
               </div>
            </div>
         </section>
      </div>

      <!-- 구독 관리 내용 -->
      <div class="tab-pane fade" id="subscribe" role="tabpanel"
         aria-labelledby="subscribe-tab">
         <section class="ftco-section bg-white">
            <div class="table-responsive">
               <table class="t_margin_auto width100 ds-table">
                  <colgroup>
                     <col style="width: 50%" />
                     <col style="width: 50%" />
                  </colgroup>
                  <tbody>

                     <tr>
                        <td>현재 구독 내역</td>
                        <td>${rmem.mem_grade}</td>
                     </tr>
                     <tr>
                        <td>다음 구독 결제일은 ${rmem.mem_next_date}입니다.</td>
                     </tr>

                  </tbody>
               </table>
            </div>
         </section>
      </div>
      <!-- 주문 내역 내용 -->
      <div class="tab-pane fade" id="order" role="tabpanel"
         aria-labelledby="order-tab">
         <section class="ftco-section bg-white">
            <div class="table-responsive">
               <table class="t_margin_auto width100 ds-table">
                  <colgroup>
                     <col style="width: 15%" />
                     <col style="width: 15%" />
                     <col style="width: 15%" />
                     <col style="width: 15%" />
                     <col style="width: 15%" />
                     <col style="width: 15%" />
                  </colgroup>
                  <thead>
                     <tr>
                        <th class="title bg-light">주문일자</th>
                        <th class="title bg-light">주문번호</th>
                        <th class="title bg-light">상품명</th>
                        <th class="title bg-light">주문수량</th>
                        <th class="title bg-light">상품가격</th>
                        <th class="title bg-light">유저아이디</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="order" items="${orderList }">
                        <tr>
                           <td>${order.order_date }</td>
                           <td>${order.order_num }</td>
                           <td>${order.prod_name }</td>
                           <td>${order.order_count }</td>
                           <td>${order.prod_price }</td>
                           <td>${order.user_id }</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </section>
      </div>

      <!-- 배송지 관리 내역 내용 -->
      <div class="tab-pane fade" id="delivery" role="tabpanel"
         aria-labelledby="delivery-tab">
            <form id=form action="mypageinfo" method="post">
               <!--다음 주소 api  -->
               <!--다음 주소 api  -->
               <div class="form-outline  mb-2">
                  <input type="button" readonly onclick="findAddr()" value="주소 찾기">
                  <input id="member_post" name="user_zipcode" type="text" class="form-control form-control-lg" value="${user.user_zipcode }" readonly><br>
                  <label class="form-label"for="form3Example3cdg">우편번호 검색</label>
                  <input type="text" class="form-control form-control-lg" placeholder="주소를 입력해주세요." name="user_address1" value="${user.user_address1 }" id="address" readonly><br>
                  <label class="form-label" for="form3Example3cdg">주소</label>
                  <input id="detail" name="user_address2" type="text" class="form-control form-control-lg" value="${user.user_address2 }" placeholder="상세주소를 입력해주세요">
                  <label class="form-label" for="form3Example3cdg">상세주소</label>
               </div>

               <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
               <div id="layer"
                  style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
                  <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                     id="btnCloseLayer"
                     style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
                     onclick="closeDaumPostcode()" alt="닫기 버튼">
               </div>
               <div>
                  <input type="submit" class="btn" value="수정하기" />
               </div>
            </form>
         </div>
      </div>
   </section>


<!-- footer include -->
<jsp:include page="footer.jsp" />

<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
=======
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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

<link rel="stylesheet" href="${path }/resourcefonts/icomoon/style.css">
<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />

<!-- 마이페이지 탭 메뉴 -->
<section>
	<ul class="nav nav-tabs justify-content-center" id="myTab"
		role="tablist">
		<li class="nav-item" role="presentation">
			<button class="btn btn-success btn-block btn-lg gradient-custom-4" id="myinfo-tab" data-bs-toggle="tab"
				data-bs-target="#myinfo" type="button" role="tab"
				aria-controls="myinfo" aria-selected="true">나의 정보</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="btn btn-success btn-block btn-lg gradient-custom-4" id="subscribe-tab" data-bs-toggle="tab"
				data-bs-target="#subscribe" type="button" role="tab"
				aria-controls="subscribe" aria-selected="false">구독 관리</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="btn btn-success btn-block btn-lg gradient-custom-4" id="order-tab" data-bs-toggle="tab"
				data-bs-target="#order" type="button" role="tab"
				aria-controls="order" aria-selected="false">주문 내역</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="btn btn-success btn-block btn-lg gradient-custom-4" id="delivery-tab" data-bs-toggle="tab"
				data-bs-target="#delivery" type="button" role="tab"
				aria-controls="delivery" aria-selected="false">배송지 관리</button>
		</li>
	</ul>
</section>
	<div class="container">
	<!-- 마이페이지 탭 내용 -->
		<!-- 나의 정보 내용 -->
		<div class="tab-pane fade show active" id="myinfo" role="tabpanel"
			aria-labelledby="myinfo-tab">
				<div class="item">
					<div class="table-responsive">
						<table class="t_margin_auto width100 ds-table">
							<tbody>
								<tr>
									<td class="bg">이름</td>
									<td>${user.user_name }</td>
								</tr>
								<tr>
									<td class="bg">아이디</td>
									<td>${user.user_id }</td>
								</tr>
								<tr>
									<td class="bg">닉네임</td>
									<td>${user.user_nickname }</td>
								</tr>
								<tr>
									<td class="bg">전화번호</td>
									<td>${user.user_phone }</td>
								</tr>
							</tbody>
						</table>
						<!-- <input type="button" onclick="location.href='usermodify'"
                        value='수정하기'> -->
					</div>
					<div>
						<input type="button" class="edit"
							onclick="location.href='usermodify'" value="수정하기" />
					</div>
				</div>
		</div>

		<!-- 구독 관리 내용 -->
		<div class="tab-pane fade" id="subscribe" role="tabpanel"
			aria-labelledby="subscribe-tab">
			<section class="ftco-section bg-white">
				<div class="table-responsive">
					<table class="t_margin_auto width100 ds-table">
						<tbody>

							<tr>
								<td>현재 구독 내역</td>
								<td>${rmem.mem_grade}</td>
							</tr>
							<tr>
								<td>다음 구독 결제일은 ${rmem.mem_next_date}입니다.</td>
							</tr>

						</tbody>
					</table>
				</div>
			</section>
		</div>
		<!-- 주문 내역 내용 -->
		<div class="tab-pane fade" id="order" role="tabpanel"
			aria-labelledby="order-tab">
			<section class="ftco-section bg-white">
				<div class="table-responsive">
					<table class="t_margin_auto width100 ds-table">
						<thead>
							<tr>
								<th class="title bg-light">주문일자</th>
								<th class="title bg-light">주문번호</th>
								<th class="title bg-light">상품명</th>
								<th class="title bg-light">주문수량</th>
								<th class="title bg-light">상품가격</th>
								<th class="title bg-light">유저아이디</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="order" items="${orderList }">
								<tr>
									<td>${order.order_date }</td>
									<td>${order.order_num }</td>
									<td>${order.prod_name }</td>
									<td>${order.order_count }</td>
									<td>${order.prod_price }</td>
									<td>${order.user_id }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</section>
		</div>

		<!-- 배송지 관리 내역 내용 -->
		<div class="tab-pane fade" id="delivery" role="tabpanel"
			aria-labelledby="delivery-tab">
				<form id=form action="mypageinfo" method="post">
					<!--다음 주소 api  -->
					<!--다음 주소 api  -->
					<div class="form-outline  mb-2">
						<input type="button" readonly onclick="findAddr()" value="주소 찾기">
						<input id="member_post" name="user_zipcode" type="text" class="form-control form-control-lg" value="${user.user_zipcode }" readonly><br>
						<label class="form-label"for="form3Example3cdg">우편번호 검색</label>
						<input type="text" class="form-control form-control-lg" placeholder="주소를 입력해주세요." name="user_address1" value="${user.user_address1 }" id="address" readonly><br>
						<label class="form-label" for="form3Example3cdg">주소</label>
						<input id="detail" name="user_address2" type="text" class="form-control form-control-lg" value="${user.user_address2 }" placeholder="상세주소를 입력해주세요">
						<label class="form-label" for="form3Example3cdg">상세주소</label>
					</div>

					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer"
						style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnCloseLayer"
							style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
							onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div>
					<div>
						<input type="submit" class="btn" value="수정하기" />
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- footer include -->
<jsp:include page="footer.jsp" />

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
>>>>>>> refs/heads/hyun
<script>
function findAddr(){
   new daum.Postcode({
        oncomplete: function(data) {
           
           console.log(data);
           
            var roadAddr = data.roadAddress; 
            var jibunAddr = data.jibunAddress; 
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("address").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("address").value = jibunAddr;
            }
        }
    }).open();
}
</script>
