<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
	<jsp:include page="header.jsp" />

	<!-- Admin 페이지 탭 메뉴 -->
 <div
      style="float: left; width: 410px; margin-top: 50px; padding-left: 230px;">
      <div class="nav flex-column nav-tabs me-3" id="v-tab" role="tablist"
         aria-orientation="vertical">

		  <button id="v-subscribe-tab"
            class="btn btn-success btn-block btn-lg gradient-custom-4"
             data-bs-toggle="pill"
            type="button" role="tab" onclick="location.href='admin_alluser'">회원</button>

         <button id="v-subscribe-tab"
            class="btn btn-success btn-block btn-lg gradient-custom-4
         "
            onclick="location.href='admin_membership'" data-bs-toggle="pill"
            type="button" role="tab"" onclick="location.href='admin_membership'">구독회원</button>

<!--          <button id="v-subscribe-product-tab"
            class="btn btn-success btn-block btn-lg gradient-custom-4
         "
            data-bs-toggle="pill" data-bs-target="#v-subscribe-product"
            type="button" role="tab" onclick="location.href=''">구독 상품 등록</button> -->

         <button id="v-add-product-tab" data-bs-toggle="pill"
            class="btn btn-success btn-block btn-lg gradient-custom-4
         "
            data-bs-target="#v-add-product" type="button" role="tab"
            onclick="location.href='admin_product'">상품등록</button>

         <button id="v-remain-product-tab"
            class="btn btn-success btn-block btn-lg gradient-custom-4
         "
            data-bs-toggle="pill" data-bs-target="#v-remain-product"
            onclick="location.href='admin_inventory'" type="button" role="tab">상품
            재고</button>

         <button id="v-order-tab" data-bs-toggle="pill"
            class="btn btn-success btn-block btn-lg gradient-custom-4
         "
            data-bs-target="#v-order" type="button" role="tab" onclick="location.href='admin_order'">상품 주문</button>

         <button id="v-delivery-tab" data-bs-toggle="pill"
            class="btn btn-success btn-block btn-lg gradient-custom-4
         "
            data-bs-target="#v-delivery" type="button" role="tab" onclick="location.href='admin_ship'">배송조회 [단품]</button>
            
                     <button id="v-delivery-tab" data-bs-toggle="pill"
            class="btn btn-success btn-block btn-lg gradient-custom-4
         "
            data-bs-target="#v-delivery" type="button" role="tab" onclick="location.href='admin_mem_ship'">배송조회 [구독]</button>
      </div>
   </div>

<section style="padding-left: 500px; height: 1150px; width: 1600px; padding-top: 50px; padding-bottom: 100px;" id="membership_form">


		<c:choose>
			<c:when test="${admin!=null && pageInfo.listCount>0 }">
				<section id="listForm">

					<h2 class="mb-5"
						style="text-decoration: underline; text-underline-position: under;">
						구독 회원 관리
						</h2>
					<form action="admin_membership" method="get">
						<input type="text" id="mem_text" name="mem_text" /> <input
							type="submit" value="찾기" class="btn btn-outline-success"
							style="padding-left: 10px; padding-right: 10px; padding-top: 6.5; padding-top: 6.5; padding-top: 6.5; padding-top: 6px; padding-bottom: 7px;" />
					</form>

					<div class="table-responsive" style="
					display: block;
    				width: 100%;
    				overflow-x: inherit;">
					<form action="UpdateMemStatus" method="post">
						<table class="table custom-table">
							<thead>
								<tr>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">주소</th>
									<th scope="col">전화번호</th>
									<th scope="col">구독정보</th>
									<th scope="col">구독시작일</th>
									<th scope="col">마지막 배송</th>
									<th scope="col"><label class="control control--checkbox">
											<input type="checkbox" class="js-check-all" onclick="selectAll(this)"/>
											<div class="control__indicator"></div>
									</label></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${admin }" var="admin">
									<tr>
										<!-- 		 	  체크버튼기능						<th scope="row"><label class="control control--checkbox">
											<input type="checkbox" />
											<div class="control__indicator"></div>
									</label></th> -->
										<td>${admin.user_name }</td>
					<td>${admin.user_email }</td>
					<td>${admin.user_totaddress }</td>
					<td>${admin.user_phone }</td>
					<td>${admin.mem_grade }</td>
					<td>${admin.mem_start_date }</td>
					<td>${admin.mem_last_date }</td>
					<th scope="row"><label class="control control--checkbox">
												<input type="checkbox" value="${admin.user_id }"
												name="ordercheck[]" />
												<div class="control__indicator"></div>
										</label></th>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<input type="submit" id="submit" value="처리"  value="처리" class="btn btn-outline-success"
							style="padding-left: 10px; padding-right: 10px; padding-top: 6.5; padding-top: 6.5; padding-top: 6.5; padding-top: 6px; padding-bottom: 7px;" >
						</form>
					</div>
				</section>
				<section id="pageList" style="text-align: center;">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
						<c:otherwise>
							<a
								href="admin_membership?page=${pageInfo.page-1}&mem_text=${mem_text}">[이전]</a>&nbsp;
				</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">[${i }]</c:when>
							<c:otherwise>
								<a href="admin_membership?page=${i}&mem_text=${mem_text}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
						<c:otherwise>
							<a
								href="admin_membership?page=${pageInfo.page+1}&mem_text=${mem_text}">[다음]</a>
						</c:otherwise>
					</c:choose>
				</section>
			</c:when>
			<c:otherwise>
				<form action="admin_membership" method="get">
					<input type="text" id="mem_text" name="mem_text" /> <input
						type="submit" value="찾기" 
						class="btn btn-outline-success"
							style="padding-left: 10px; padding-right: 10px; padding-top: 6.5; padding-top: 6.5; padding-top: 6.5; padding-top: 6px; padding-bottom: 7px;" 
							/>
				</form>
				<section id="emptyArea">구독 회원이 없습니다.</section>
			</c:otherwise>
		</c:choose>


	</section>





	<jsp:include page="footer.jsp" />
	<script>
		function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('ordercheck[]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
  
}
		</script>
		
		<script>
		 $('#submit').click(function(){
	 if($("input:checkbox[name='ordercheck[]']").is(":checked")==false){
		 Swal.fire({
	            icon: 'error',
	            title: '하나이상 선택해주세요.',
	            text: '다시 한번 시도해주세요.',
	          });
		return false;
	 }
	 else{
		 return true;
	 }
  });
		 </script>
		 
	<script>
	$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "/admin_membership" + '"]').closest('li').addClass('active');
	});
</script>
	