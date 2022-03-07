<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />

   <!-- 상단 배너-->
   <section class="ftco-section"
      style="background-image: url('${path}/resource/images/bg_2.png')"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5">
               <p class="breadcrumbs mb-2">
                  <span class="mr-2"><a href="index.html">Petmily <i
                        class="ion-ios-arrow-forward"></i>
                  </a></span> <span>Mypage <i class="ion-ios-arrow-forward"></i></span>
               </p>
               <h1 class="mb-0 bread">마이페이지</h1>
            </div>
         </div>
      </div>
   </section>

   <section class="ftco-section" >
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
   </section>

   <!-- 마이페이지 탭 내용 -->
   <section class="ftco-section" >
    <div class="form-outline mb-2">
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
      </div>
    </div>
   </section>


   <!-- 구독 관리 내용 -->
   <section class="ftco-section" >
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
   </section>

   <!-- 주문 내역 내용 -->
   <section class="ftco-section" >
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
   </section>

   <!-- 배송지 관리 내역 내용 -->
   <section class="ftco-section" >
      <div class="tab-pane fade" id="delivery" role="tabpanel"
         aria-labelledby="delivery-tab">
         <section class="ftco-section bg-white">
            <form id=form action="mypageinfo" method="post">
               <!--다음 주소 api  -->
               <input type="text" id="sample2_postcode" name="user_zipcode"
                  value="${user.user_zipcode }" placeholder="우편번호"> <input
                  type="button" onclick="sample2_execDaumPostcode()" value="주소 찾기">
               <br> <input type="text" id="sample2_address"
                  name="user_address1" value="${user.user_address1 }"
                  placeholder="주소"> <br> <input type="text"
                  id="sample2_detailAddress" name="user_address2"
                  value="${user.user_address2 }" placeholder="상세주소">

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
         </section>
      </div>
   </section>
   <jsp:include page="footer.jsp" />
   <script>
   // 우편번호 찾기 화면을 넣을 element
   var element_layer = document.getElementById('layer');

   function closeDaumPostcode() {
      // iframe을 넣은 element를 안보이게 한다.
      element_layer.style.display = 'none';
   }

   function sample2_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if (data.bname !== ''
                           && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     /*    if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample2_extraAddress").value = extraAddr; */

                  } /* else {
                                                            document.getElementById("sample2_extraAddress").value = '';
                                                         } */

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample2_postcode').value = data.zonecode;
                  document.getElementById("sample2_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document
                        .getElementById("sample2_detailAddress")
                        .focus();

                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_layer.style.display = 'none';
               },
               width : '100%',
               height : '100%',
               maxSuggestItems : 5
            }).embed(element_layer);

      // iframe을 넣은 element를 보이게 한다.
      element_layer.style.display = 'block';

      // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
      initLayerPosition();
   }

   // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
   // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
   // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
   function initLayerPosition() {
      var width = 500; //우편번호서비스가 들어갈 element의 width
      var height = 600; //우편번호서비스가 들어갈 element의 height
      var borderWidth = 5; //샘플에서 사용하는 border의 두께

      // 위에서 선언한 값들을 실제 element에 넣는다.
      element_layer.style.width = width + 'px';
      element_layer.style.height = height + 'px';
      element_layer.style.border = borderWidth + 'px solid';
      // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
      element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
            + 'px';
      element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
            + 'px';
   }
   /* 다음 주소 api */

   </script>


<!-- footer include -->
<jsp:include page="footer.jsp" />