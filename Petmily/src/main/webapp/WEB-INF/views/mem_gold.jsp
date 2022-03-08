<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<jsp:include page="header.jsp" />
     <!-- Product section-->
        <section class="py-5">
        <form action="mem_gold" method="post">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">Gold Pakage</div>
                        <h1 class="display-5 fw-bolder">Very Nice Gold Pakage</h1>
                        <div class="fs-5 mb-5">
                            <span class="text-decoration-line-through">19,800 (원)</span>
                        </div>
                        <p class="lead">
						<span style="color:green;">첫번째</span> 상품 : <span style="color:black;">강형욱도 먹는 </span><span style="color:red;">특급</span> 개사료! <br>
						<span style="color:green;">두번째</span> 상품 : <span style="color:black;"> Holly shit</span><span style="color:red;"> 특급</span> 개껌 ! <br>
						<span style="color:green;">세번째</span> 상품 : <span style="color:black;"> 명품 </span><span style="color:red;">특급 </span>개옷 ! <br>
						</p>
						<br>
						<br>
                        <div class="d-flex">
                            <button class="btn btn-outline-dark flex-shrink-0" type="sumbit">
                                <i class="bi-cart-fill me-1"></i>
                                구독 하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </section>


	<jsp:include page="footer.jsp" />
	