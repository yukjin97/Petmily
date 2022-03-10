<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<!-- header include -->
<jsp:include page="header.jsp" />
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<section class="ftco-section">
	<div class="mask d-flex align-items-center h-100 gradient-custom-3">
		<div class="container h-100">
			 <div class="row w-100">
            <div class="col-lg-12 col-md-12 col-12">
                <h3 class="display-5 mb-2 text-center">현재 담은 물품</h3>
                <p class="mb-5 text-center">
                    <i class="text-info font-weight-bold">${cartList.size() }</i> 개의 상품이 있어요.</p>
                <table id="shoppingCart" class="table table-condensed table-responsive">
                    <thead>
                    <tr>
                        <th style="width:60%">상품</th>
                        <th style="width:12%">수량</th>
                        <th style="width:8%">가격</th>
                        <th style="width:10%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="prod" items="${prodList }" varStatus="status">
	                    <tr>
	                        <td data-th="Product">
	                            <div class="row">
	                                <div class="col-md-3 text-left">
	                                    <img src='images/${prod.prod_img}.jpg' alt="" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
	                                </div>
	                                <div class="col-md-9 text-left mt-sm-2">
	                                    <h4>${prod.prod_name}</h4>
	                                    <p class="font-weight-light">설명 : ${prod.prod_content}</p>
	                                </div>
	                            </div>
	                        </td>
	                        <td data-th="Quantity">
								<input type="number"class="form-control form-control-lg text-center" value="${cartList[status.index].cart_amount}" onChange=totalCal()>
								<input type="hidden" class="total" value="${cartList[status.index].cart_amount * prod.prod_price}">
	                        </td>
	                        <td data-th="Price">${prod.prod_price}</td>
	                        <td class="actions" data-th="">
	                            <div class="text-right">
	                                <button class="btn btn-white border-secondary bg-white btn-md mb-2">
	                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="8" height="8" viewBox="0 0 8 8">
	                                        <defs>
	                                            <clipPath id="clip-path">
	                                                <rect width="8" height="8" fill="none"/>
	                                            </clipPath>
	                                        </defs>
	                                        <g id="close" clip-path="url(#clip-path)">
	                                            <path id="close-2" data-name="close" d="M5.4,4,7.7,1.7A.967.967,0,0,0,7.7.3.967.967,0,0,0,6.3.3L4,2.6,1.7.3A.967.967,0,0,0,.3.3a.967.967,0,0,0,0,1.4L2.6,4,.3,6.3a.967.967,0,0,0,0,1.4A.908.908,0,0,0,1,8a.908.908,0,0,0,.7-.3L4,5.4,6.3,7.7a.967.967,0,0,0,1.4,0,.967.967,0,0,0,0-1.4Z" fill="#202124"/>
	                                        </g>
	                                    </svg>
	                                </button>
	                            </div>
	                        </td>
                    </tr>
                    </c:forEach>
                    
                    </tbody>
                </table>
                <div class="float-right text-right">
                    <h4>총 금액</h4>
                    <h1 id="totalPrice"></h1>
                </div>
            </div>
        </div>
        <div class="row mt-4 d-flex align-items-center">
            <div class="col-sm-6 order-md-2 text-right">
                <a href="#" class="btn btn-primary mb-4 btn-lg pl-5 pr-5">결제하기</a>
            </div>
        </div>
		</div>
	</div>
</section>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {
	totalCal();
	
})

function totalCal() {
		var total = 0;
		 $('.total').each(function() {
			 total += Number($(this).val());
		 });
		 console.log(total);
		 $('#totalPrice').text(total);
	}
	
</script>

<!-- footer include -->
<jsp:include page="footer.jsp" />