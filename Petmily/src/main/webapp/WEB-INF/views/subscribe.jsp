<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<c:set var="path" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>

<jsp:include page="header.jsp" />

<!-- 상단 배너-->
   <div class="hero-wrap " 
   style="background-image: url('${path}/resource/images/gallery-6.jpg'); 
   height: 500px; background-position: 50% -19.3906px;"
    data-stellar-background-ratio="0.5">
   <div class="overlay"></div>
   <div class="container">
      <div
         class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
         data-scrollax-parent="true">
         <div class="col-md-11 ftco-animate text-center">
           <h1 class="mb-4" style="
    padding-bottom: 550px;
">
				구독서비스
            </h1>
         </div>
      </div>
   </div>
</div>

<!-- 구독서비스 이미지 -->
<section  class="ftco-section bg-light ftco-faqs">
      <div class="container">
      <div class="row justify-content-center">
         <div class="col-lg-6">
            <div class="heading-section mb-5 mt-5 mt-lg-0">
               <h2 class="mb-3">구독서비스란</h2>
               <p>펫밀리에서 제공하는 반려동물 용품을 정기구독으로 받아보실수 있는 서비스입니다.</p>
            </div>

            <div id="accordion" class="myaccordion w-100"
               aria-multiselectable="true">
            
            <div class="card">
                  <div class="card-header p-0" id="headingOne">
                     <h2 class="mb-0">
                        <button href="#collapseOne"
                           class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
                           data-parent="#accordion" data-toggle="collapse"
                           aria-expanded="true" aria-controls="collapseOne">
                           <p class="mb-0">어떤 방식으로 결제되나요?</p>
                           <i class="fa" aria-hidden="true"></i>
                        </button>
                     </h2>
                  </div>
                  <div class="collapse show" id="collapseOne" role="tabpanel"
                     aria-labelledby="headingOne">
                     <div class="card-body py-3 px-0">
                        <ol>
                           <li>매월 15일 결제가 진행됩니다.</li>
                           <li>결제 후 펫밀리 구독서비스가 제공하는 제품이 배송됩니다.</li>
                        </ol>
                     </div>
                  </div>
               </div>
            
               <div class="card">
                  <div class="card-header p-0" id="headingTwo" role="tab">
                     <h2 class="mb-0">
                        <button href="#collapseTwo"
                           class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link"
                           data-parent="#accordion" data-toggle="collapse"
                           aria-expanded="false" aria-controls="collapseTwo">
                           <p class="mb-0">어떤 상품을 받아볼 수 있나요?</p>
                           <i class="fa" aria-hidden="true"></i>
                        </button>
                     </h2>
                  </div>
                  <div class="collapse" id="collapseTwo" role="tabpanel"
                     aria-labelledby="headingTwo">
                     <div class="card-body py-3 px-0">
                        <ol>
                           <li>가격별로 총 3개의 상품을 받아보실 수 있습니다.</li>
                           <li>펫밀리에서 추천하는 최고의 상품으로만 구성되어 있습니다.</li>
                           <li>구독하기 버튼을 통해 포함된 제품을 확인할 수 있습니다.</li>
                        </ol>
                     </div>
                  </div>
               </div>
              </div>
               
            </div>
         </div>
      </div>
   </div>
</section>

<!-- 정기구독 -->
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
               <div class="img"
                  style="background-image: url(${path}/resource/images/001.jpg);"></div>
               <div class="text-center p-4">
                  <span class="excerpt d-block">실속 패키지</span> <span class="price"><sup>￦</sup>
                     <span class="number">29800</span> <sub>/month</sub></span>

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

                  <a href="mem_gold" class="btn btn-primary d-block px-2 py-3">구독하기</a>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<jsp:include page="footer.jsp" />
<script>
$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "/subscribe" + '"]').closest('li').addClass('active');
	});
</script>