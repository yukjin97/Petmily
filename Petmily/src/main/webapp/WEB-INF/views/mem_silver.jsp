<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />
<!-- Product section-->
<section class="py-5" style="height: 700px;">
	<form action="mem_silver" method="post">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="${path}/resource/images/pricing-1.jpg">
				</div>
				<div class="col-md-6">
					<div class="small mb-1">Silver Pakage</div>
					<h1 class="display-5 fw-bolder">Very Nice Silver Pakage</h1>
					<div class="fs-5 mb-5">
						<span class="text-decoration-line-through">9,800 (원)</span>
					</div>
					<p class="lead">
						<span style="color: green;">첫번째</span> 상품 : <span
							style="color: black;">강형욱도 먹는 개사료!</span> <br> <span
							style="color: green;">두번째</span> 상품 : <span style="color: black;">Holly
							shit 개껌 !</span> <br> <span style="color: green;">세번째</span> 상품 : <span
							style="color: black;">명품 개옷 !</span> <br>
					</p>
					<div class="d-flex">
						<button class="btn btn-outline-dark flex-shrink-0" type="submit"
							style="margin-left: 322px;">
							<i class="bi-cart-fill me-1"></i> 구독 하기
						</button>
					</div>
				</div>
			</div>
		</div>

	</form>
</section>


<jsp:include page="footer.jsp" />
<script>
$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "/subscribe" + '"]').closest('li').addClass('active');
	
$(function () {
	$("#silver").click(function() {
		$.ajax({
			type:"post",
			dataType:"text",
			async:false,
			url:"http://localhost:8080/mem_silver",
			data:{},
			success: function(data, textStatus) {
				if(data=="true") {
					Swal.fire({
			            icon: 'error',
			            title: '이미 구독중인 상품입니다.',
			            text: '돌아가주세요.',
			          }).then(function(){
                          location.href="http://localhost:8080/subscribe";
                      });
				}else {
                          location.href="http://localhost:8080/mem_pay";
				}
			}
		});        		
	});
})
	});
	
</script>
