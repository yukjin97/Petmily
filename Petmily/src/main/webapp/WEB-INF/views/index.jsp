<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<meta charset="UTF-8" />
<meta
  name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no"
/>

<link
  href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
  rel="stylesheet"
/>

<link
  rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
/>
<link rel="stylesheet" href="${path }/resource/css/animate.css" />

<link rel="stylesheet" href="${path }/resource/css/owl.carousel.min.css" />
<link rel="stylesheet" href="${path }/resource/css/owl.theme.default.min.css" />
<link rel="stylesheet" href="${path }/resource/css/magnific-popup.css" />

<link rel="stylesheet" href="${path }/resource/css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="${path }/resource/css/jquery.timepicker.css" />

<link rel="stylesheet" href="${path }/resource/css/flaticon.css" />
<link rel="stylesheet" href="${path }/resource/css/style.css" />

<!-- 헤더 인클루드부에 /html  html 시작  있음 -->

<jsp:include page="header.jsp" />
<div
  class="hero-wrap js-fullheight"
  style="background-image: url('${path}/resource/images/007.jpg')"
  data-stellar-background-ratio="0.5"
>
  <div class="overlay"></div>
  <div class="container">
    <div
      class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
      data-scrollax-parent="true"
    >
      <div class="col-md-11 ftco-animate text-center">
        <h1 class="mb-4">반려동물 용품 걱정 그만! <br/>Petmily</h1>
        <p>
          <a href="subscribe" class="btn btn-primary mr-md-4 py-3 px-4"
            >구독하기<span class="ion-ios-arrow-forward"></span
          ></a>
        </p>
      </div>
    </div>
  </div>
</div>

<section class="ftco-section ftco-no-pt ftco-no-pb">
  <div class="container">
    <div class="row d-flex no-gutters">
      <div class="col-md-5 d-flex">
        <div
          class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0"
          style="background-image: url(${path}/resource/images/about-1.jpg)"
        ></div>
      </div>
      <div class="col-md-7 pl-md-5 py-md-5">
        <div class="heading-section pt-md-5">
          <h2 class="mb-4">펫밀리의 특별한 서비스!</h2>
        </div>
        <div class="row">
          <div class="col-md-6 services-2 w-100 d-flex">
            <div class="icon d-flex align-items-center justify-content-center">
              <span class="flaticon-dog-eating"></span>
            </div>
            <div class="text pl-3">
              <h4>Petmily</h4>
              <p>Petmily는 전문가가 직접 고른 사료를 사용합니다</p>
            </div>
          </div>
          <div class="col-md-6 services-2 w-100 d-flex">
            <div class="icon d-flex align-items-center justify-content-center">
              <span class="flaticon-customer-service"></span>
            </div>
            <div class="text pl-3">
              <h4>Product</h4>
              <p>Petmily는 QC/QA팀을 운용하여 제품을 관리합니다</p>
            </div>
          </div>
          <div class="col-md-6 services-2 w-100 d-flex">
            <div class="icon d-flex align-items-center justify-content-center">
              <span class="flaticon-pawprint-1"></span>
            </div>
            <div class="text pl-3">
              <h4>Price</h4>
              <p>Petmily는 합리적인 가격으로 똑똑한 소비를 만듭니다</p>
            </div>
          </div>
          <div class="col-md-6 services-2 w-100 d-flex">
            <div class="icon d-flex align-items-center justify-content-center">
              <span class="flaticon-veterinarian"></span>
            </div>
            <div class="text pl-3">
              <h4>Produce</h4>
              <p>
                Petmily는 반려동물과 가족들에게 최상의 서비스를 제공합니다
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="ftco-counter" id="section-counter">
  <div class="container">
    <div class="row">
      <div
        class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate"
      >
        <div class="block-18 text-center">
          <div class="text">
            <strong class="number" data-number="${mem_count}">0</strong>
          </div>
          <div class="text">
            <span>구독자수</span>
          </div>
        </div>
      </div>
      <div
        class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate"
      >
        <div class="block-18 text-center">
          <div class="text">
            <strong class="number" data-number="20">0</strong>
          </div>
          <div class="text">
            <span>강아지 영양전문가</span>
          </div>
        </div>
      </div>
      <div
        class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
        <div class="block-18 text-center">
          <div class="text">
            <strong class="number" data-number="${prod_count}">0</strong>
          </div>
          <div class="text">
            <span>제품</span>
          </div>
        </div>
      </div>
      <div
        class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate"
      >
        <div class="block-18 text-center">
          <div class="text">
            <strong class="number" data-number="${user_count}">0</strong>
          </div>
          <div class="text">
            <span>스토어 이용자수</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="ftco-section bg-light ftco-faqs">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-6">
        <div class="heading-section mb-5 mt-5 mt-lg-0">
          <h2 class="mb-3">Petmily란?</h2>
          <p>
            Petmily 구독서비스는 반려동물 용품을 정기구독으로 받아보실 수 있는
            </br>서비스입니다
          </p>
        </div>
        <div
          id="accordion"
          class="myaccordion w-100"
          aria-multiselectable="true"
        >
          <div class="card">
            <div class="card-header p-0" id="headingOne">
              <h2 class="mb-0">
                <button
                  href="#collapseOne"
                  class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
                  data-parent="#accordion"
                  data-toggle="collapse"
                  aria-expanded="true"
                  aria-controls="collapseOne"
                >
                  <p class="mb-0">구독은 어떻게 하나요?</p>
                  <i class="fa" aria-hidden="true"></i>
                </button>
              </h2>
            </div>
            <div
              class="collapse show"
              id="collapseOne"
              role="tabpanel"
              aria-labelledby="headingOne"
            >
              <div class="card-body py-3 px-0">
                <ol>
                  <li>구독 페이지로 이동</li>
                  <li>원하는 패키지 선택</li>
                  <li>결제하기 누르면 끝!</li>
                </ol>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header p-0" id="headingTwo" role="tab">
              <h2 class="mb-0">
                <button
                  href="#collapseTwo"
                  class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
                  data-parent="#accordion"
                  data-toggle="collapse"
                  aria-expanded="false"
                  aria-controls="collapseTwo"
                >
                  <p class="mb-0">Petmily 의 장점은 뭔가요?</p>
                  <i class="fa" aria-hidden="true"></i>
                </button>
              </h2>
            </div>
            <div
              class="collapse"
              id="collapseTwo"
              role="tabpanel"
              aria-labelledby="headingTwo"
            >
              <div class="card-body py-3 px-0">
                <ol>
                  <li>전문가가 추천하는 수제 사료를 받아보실 수 있습니다.</li>
                  <li>
                    매번 따로 주문하셨던 사료 및 간식들은 정기적으로 매월 다르게
                    받으실 수 있습니다.
                  </li>
                  <li>반려동물과 가족 모두의 삶이 윤택해집니다.</li>
                </ol>
              </div>
            </div>
          </div>

          <div class="card">
            <div class="card-header p-0" id="headingThree" role="tab">
              <h2 class="mb-0">
                <button
                  href="#collapseThree"
                  class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
                  data-parent="#accordion"
                  data-toggle="collapse"
                  aria-expanded="false"
                  aria-controls="collapseThree"
                >
                  <p class="mb-0">개별 구매도 가능한가요?</p>
                  <i class="fa" aria-hidden="true"></i>
                </button>
              </h2>
            </div>
            <div
              class="collapse"
              id="collapseThree"
              role="tabpanel"
              aria-labelledby="headingTwo"
            >
              <div class="card-body py-3 px-0">
                <ol>
                  <li>네, 스토어 페이지에서 구매하실 수 있습니다.</li>
                  <li>
                    Packages 상품도 별도로 판매하고 있습니다.
                  </li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section
  class="ftco-section testimony-section"
  style="background-image: url('${path}/resource/images/bg_2.jpg')"
>
</section>

<section class="ftco-section bg-light">
  <div class="container">
    <div class="row justify-content-center pb-5 mb-3">
      <div class="col-md-7 heading-section text-center ftco-animate">
        <h2>Petmily Product</h2>
      </div>
    </div>

    <div class="row justify-content-center">
      <c:forEach items="${rprod }" var="rprod">
        <div class="col-md-4 ftco-animate">
          <div class="block-7">
            <div
              class="img"
              style="background-image: url(/upload/${rprod.prod_img}"
            ></div>
            <div class="text-center p-4">
              <span class="excerpt d-block">${rprod.prod_title }</span>
              <span class="price"
                ><sup>￦</sup><span class="number">${rprod.prod_price}</span>
                <sub>/won</sub></span
              >
              <a
                href="/product/detail/${rprod.prod_num}"
                class="btn btn-primary d-block px-2 py-3"
                >구경하기</a
              >
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>

<section class="ftco-section bg-light">
  <div class="container">
    <div class="row justify-content-center pb-5 mb-3">
      <div class="col-md-7 heading-section text-center ftco-animate">
        <h2>Petmily Packages</h2>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-4 ftco-animate">
        <div class="block-7">
          <div
            class="img"
            style="background-image: url(${path}/resource/images/001.jpg)"
          ></div>
          <div class="text-center p-4">
            <span class="excerpt d-block">실속 패키지</span>
            <span class="price"
              ><sup>￦</sup> <span class="number">29800</span>
              <sub>/month</sub></span
            >

                  <ul class="pricing-text mb-5">
                     <li><span class="fa fa-check mr-2"></span>
                        펫밀리 사료</li>
                     <li><span class="fa fa-check mr-2"></span>프레쉬 덴탈 껌</li>
                     <li><span class="fa fa-check mr-2"></span>페스룸X위글 장난감</li>
                  </ul>
                  <a href="mem_silver" class="btn btn-primary d-block px-2 py-3">구독하기</a>
               </div>
            </div>
         </div>
         <div class="col-md-4 ftco-animate">
            <div class="block-7">
               <div class="img"
                  style="background-image: url(${path}/resource/images/002.jpg);"></div>
               <div class="text-center p-4">
                  <span class="excerpt d-block">프리미엄 패키지</span> <span class="price"><sup>￦</sup>
                     <span class="number">39800</span> <sub>/month</sub></span>

            <ul class="pricing-text mb-5">
              <li>
                <span class="fa fa-check mr-2"></span>펫밀리 특제고급사료
              </li>
              <li>
                <span class="fa fa-check mr-2"></span>카리에스 덴탈껌
              </li>
              <li>
                <span class="fa fa-check mr-2"></span>프레쉬 덴탈 츄
              </li>
            </ul>

            <a href="mem_gold" class="btn btn-primary d-block px-2 py-3"
              >구독하기</a
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<jsp:include page="footer.jsp" />
<script>
  $(document).ready(function () {
    $('li.active').removeClass('active');
    $('a[href="' + '/' + '"]')
      .closest('li')
      .addClass('active');
  });
</script>
