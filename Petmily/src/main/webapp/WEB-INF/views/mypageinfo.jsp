<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<style>
	@media screen and (min-width:670px) {
	#grid1{
		 display: none;
	}
	#grid2{
		display: block;
	}
 }
 @media screen and (max-width:670px) {
	#grid1{
		 display: block;
	}
	#grid2{
		display: none;
	}
}
</style>
<!-- header include -->
<jsp:include page="header.jsp"/>
<!-- END nav -->
<div class="container" style="margin-top: 50px ;">
	<div class="row no-gutters slider-text align-items-end">
	  <div class="col-md-9 ftco-animate pb-5">
		 <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">myinfo <i class="ion-ios-arrow-forward"></i></a></span></p>
		<h1 class="mb-0 bread">MyPage</h1>
	  </div>
	</div>
  </div>
	<section>
		<div id="grid1" class="container" >
				<ul class="nav justify-content-center">
				  <li class="nav-item dropdown">
					<button type="button" class="nav-link dropdown-toggle btn btn-outline-success " data-toggle="collapse" data-target="#demo" style="width: 400px;"></button>
					<div class="collapse" id="demo">
					  <button type="button" class="nav-link btn btn-outline-success" id="myinfo-tab1"  style="width: 400px;">나의 정보</button>	
					  <button type="button" class="nav-link btn btn-outline-success" id="subscribe-tab1"  style="width: 400px;">구독 내역</button>
					  <button type="button" class="nav-link btn btn-outline-success" id="order-tab1" style="width: 400px;">주문 내역</button>
					  <button type="button" class="nav-link btn btn-outline-success" id="delivery-tab1" style="width: 400px;">배송지 관리</button>	
					</div>
					</li>
				</ul>
		  </div>	
	<div id="grid2">	
	  <ul class="nav justify-content-center" >
		 <li class="nav-item" role="presentation" style="margin-right: 10px;">
			<button type="button" class="nav-link active btn btn-outline-success " id="myinfo-tab" style="width: 150px;">나의 정보</button>
		 </li>
		 <li class="nav-item" role="presentation" style="margin-right: 10px;">
		   <button type="button" class="nav-link btn btn-outline-success" id="subscribe-tab" style="width: 150px;">구독 내역</button>
		 </li>
		 <li class="nav-item" role="presentation" style="margin-right: 10px;">
			<button type="button" class="nav-link btn btn-outline-success" id="order-tab" style="width: 150px;">주문 내역</button>
		 </li>
		 <li class="nav-item" role="presentation" style="margin-right: 10px;">
			<button type="button" class="nav-link btn btn-outline-success" id="delivery-tab" style="width: 150px;">배송지 관리</button>
		 </li>
	  </ul>
	</div>
</section>
  

<!-- 마이페이지 탭 메뉴 -->
<div class="tab-content mx-5" id="myTabContent">
<!-- 마이페이지 탭 내용 -->
  <div class="row d-flex justify-content-center align-items-center h-100">
    <div style="height: 500px; width: 500px; margin-top: 100px">
      <div id="myinfoPage" class="pageSection">
        <div class="table-responsive">

			<!--마이페이지 테이블자리  -->
			<table class="table table-bordered overflow-hidden">
				<tbody>
				  <tr class="btn-reveal-trigger">
					<th>Name</th>
					<td>test 3</td>
					<td class="text-end">
					  <div class="dropdown font-sans-serif position-static"><button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button>
					</td>
				  </tr>
				  <tr class="btn-reveal-trigger">
					<td>Emma Watson</td>
					<td>emma@example.com</td>
					<td class="text-end">
					  <div class="dropdown font-sans-serif position-static"><button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button>
						<div class="dropdown-menu dropdown-menu-end border py-0">
						  <div class="bg-white py-2"><a class="dropdown-item" href="#!">Edit</a><a class="dropdown-item text-danger" href="#!">Delete</a></div>
						</div>
					  </div>
					</td>
				  </tr>
				  <tr class="btn-reveal-trigger">
					<td>Rowen Atkinson</td>
					<td>rown@example.com</td>
					<td class="text-end">
					  <div class="dropdown font-sans-serif position-static"><button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button>
						<div class="dropdown-menu dropdown-menu-end border py-0">
						  <div class="bg-white py-2"><a class="dropdown-item" href="#!">Edit</a><a class="dropdown-item text-danger" href="#!">Delete</a></div>
						</div>
					  </div>
					</td>
				  </tr>
				  <tr class="btn-reveal-trigger">
					<td>Antony Hopkins</td>
					<td>antony@example.com</td>
					<td class="text-end">
					  <div class="dropdown font-sans-serif position-static"><button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button>
						<div class="dropdown-menu dropdown-menu-end border py-0">
						  <div class="bg-white py-2"><a class="dropdown-item" href="#!">Edit</a><a class="dropdown-item text-danger" href="#!">Delete</a></div>
						</div>
					  </div>
					</td>
				  </tr>
				  <tr class="btn-reveal-trigger">
					<td>Jennifer Schramm</td>
					<td>jennifer@example.com</td>
					<td class="text-end">
					  <div class="dropdown font-sans-serif position-static"><button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fs--1"></span></button>
						<div class="dropdown-menu dropdown-menu-end border py-0">
						  <div class="bg-white py-2"><a class="dropdown-item" href="#!">Edit</a><a class="dropdown-item text-danger" href="#!">Delete</a></div>
						</div>
					  </div>
					</td>
				  </tr>
				</tbody>
			  </table>
			  <!-- 마이페이지 테이블자리 -->
        </div>
        <div>
          <input
            type="button"
            class="edit"
            onclick="location.href='usermodify'"
            value="수정하기"
          />
        </div>
      </div>

      <!-- 구독 관리 내용 -->
      <div id="subPage" class="pageSection" style="display: none">
		<div class="table-responsive">
			<div class="card" style="border-radius: 15px">
				<div class="card-body p-5">
          <table class="t_margin_auto width100 ds-table">
            <tbody>
              <tr>
                <td>${user.user_nickname }님은 <c:out value="${rmem.mem_grade}" default="현재 구독준비중!"></c:out></td>
              </tr>
              <tr>
                <td>다음 구독 결제일은 <c:out value="${rmem.mem_next_date}" default="다음 결제일이 없습니다. 구독 해주세요!!"></c:out> </td>
              </tr>
            </tbody>
          </table>
		  </div>
		  </div>
        </div>
      </div>
      <!-- 주문 내역 내용 -->
      <div id="orderPage" class="pageSection" style="display: none">
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
      </div>

      <!-- 배송지 관리 내역 내용 -->
      <div id="deliveryPage" class="pageSection" style="display: none">
        <form id="form" action="mypageinfo" method="post">
          <!--다음 주소 api  -->
          <div class="form-outline mb-2">
            <input
              type="button"
              readonly
              onclick="findAddr()"
              value="우편번호 찾기"
			  class="btn btn-success"
			  style="margin-bottom:30px;"
            />
            <input
              id="member_post"
              name="user_zipcode"
              type="text"
              class="form-control form-control-lg"
              value="${user.user_zipcode }"
              readonly
            /><br />
            <label class="form-label" for="form3Example3cdg">주소</label>
            <input
              type="text"
              class="form-control form-control-lg"
              placeholder="주소를 입력해주세요."
              name="user_address1"
              value="${user.user_address1 }"
              id="address"
              readonly
            /><br />
            <label class="form-label" for="form3Example3cdg">상세주소</label>
            <input
              id="detail"
              name="user_address2"
              type="text"
              class="form-control form-control-lg"
              value="${user.user_address2 }"
              placeholder="상세주소를 입력해주세요"
            />
          </div>

          <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
          <div
            id="layer"
            style="
              display: none;
              position: fixed;
              overflow: hidden;
              z-index: 1;
              -webkit-overflow-scrolling: touch;
            "
          >
            <img
              src="//t1.daumcdn.net/postcode/resource/images/close.png"
              id="btnCloseLayer"
              style="
                cursor: pointer;
                position: absolute;
                right: -3px;
                top: -3px;
                z-index: 1;
              "
              onclick="closeDaumPostcode()"
              alt="닫기 버튼"
            />
          </div>
          <div>
            <input
              type="submit"
              class="btn btn-success"
              value="수정하기"
              style="margin-top: 30px"
            />
          </div>
        </form>
      </div>
    </div>
    <!-- </section>
        </div>
      </div> -->
    </div>
  </div>
</div>

<!-- footer include -->
<jsp:include page="footer.jsp" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function findAddr() {
    new daum.Postcode({
      oncomplete: function (data) {
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
  $('.nav-link').click(function () {
    $('.nav-link').removeClass('active');
    $(this).addClass('active');
  });

  $('#myinfo-tab').click(function () {
    $('.pageSection').css('display', 'none');
    $('#myinfoPage').css('display', 'block');
  });

  $('#subscribe-tab').click(function () {
    $('.pageSection').css('display', 'none');
    $('#subPage').css('display', 'block');
  });

  $('#order-tab').click(function () {
    $('.pageSection').css('display', 'none');
    $('#orderPage').css('display', 'block');
  });

  $('#delivery-tab').click(function () {
    $('.pageSection').css('display', 'none');
    $('#deliveryPage').css('display', 'block');
  });

  //dropdown

  $('#myinfo-tab1').click(function () {
    $('.pageSection').css('display', 'none');
    $('#myinfoPage').css('display', 'block');
  });

  $('#subscribe-tab1').click(function () {
    $('.pageSection').css('display', 'none');
    $('#subPage').css('display', 'block');
  });

  $('#order-tab1').click(function () {
    $('.pageSection').css('display', 'none');
    $('#orderPage').css('display', 'block');
  });

  $('#delivery-tab1').click(function () {
    $('.pageSection').css('display', 'none');
    $('#deliveryPage').css('display', 'block');
  });

  $(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "mypageinfo" + '"]').closest('li').addClass('active');
	});
	// function moonpaChange(arg) {
    //      document.getElementById('moonpa').value=arg; 
         
    //      if(arg == 'true')
    //         document.getElementById('sortDropdown').innerText='사먹파';
    //      else
    //         document.getElementById('sortDropdown').innerText='해먹파';
    //   }
</script>
