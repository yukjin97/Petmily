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
				class="btn btn-success btn-block btn-lg gradient-custom-4
			"
				onclick="location.href='admin_membership'" data-bs-toggle="pill"
				type="button" role="tab"" onclick="location.href='admin_membership'">구독</button>

			<!-- <button id="v-subscribe-product-tab"
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
				data-bs-target="#v-delivery" type="button" role="tab" onclick="location.href='admin_ship'">배송</button>
		</div>
	</div>


	<section id="ship_form"
		style="padding-left: 500px; height: 1150px; width: 1500px; padding-top: 50px; padding-bottom: 100px;">


		<c:choose>
			<c:when test="${admin_ship!=null && pageInfo.listCount>0 }">
				<section id="listForm">

					<h2 class="mb-5"
						style="text-decoration: underline; text-underline-position: under;">
						배송
						</h2>
					<form action="admin_ship" method="get">
						<input type="text" id="search_text" name="search_text" /> <input
							type="submit" value="찾기" class="btn btn-outline-success"
							style="padding-left: 10px; padding-right: 10px; padding-top: 6.5; padding-top: 6.5; padding-top: 6.5; padding-top: 6px; padding-bottom: 7px;" />
					</form>

					<div class="table-responsive">

						<table class="table custom-table">
							<thead>
								<tr>
									<th scope="col">주문날짜</th>
									<th scope="col">상품명</th>
									<th scope="col">수량</th>
									<th scope="col">주소</th>
									<th scope="col">이름</th>
									<th scope="col">전화번호</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${admin_ship }" var="admin_ship">
									<tr>
										<td>${admin_ship.order_date}</td>
					<td>${admin_ship.prod_name }</td>
					<td>${admin_ship.order_count }</td>
					<td>${admin_ship.user_totaddress }</td>
					<td>${admin_ship.user_name }</td>
					<td>${admin_ship.user_phone }</td>
					<td>배송중</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
				</section>
				<section id="pageList">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
						<c:otherwise>
							<a
								href="admin_ship?page=${pageInfo.page-1}&search_text=${search_text}">[이전]</a>&nbsp;
				</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }"
						end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">[${i }]</c:when>
							<c:otherwise>
								<a href="admin_ship?page=${i}&search_text=${search_text}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
						<c:otherwise>
							<a
								href="admin_ship?page=${pageInfo.page+1}&search_text=${search_text}">[다음]</a>
						</c:otherwise>
					</c:choose>
				</section>
			</c:when>
			<c:otherwise>
				<form action="admin_ship" method="get">
					<input type="text" id="search_text" name="search_text" /> <input
						type="submit" value="찾기" 
						class="btn btn-outline-success"
							style="padding-left: 10px; padding-right: 10px; padding-top: 6.5; padding-top: 6.5; padding-top: 6.5; padding-top: 6px; padding-bottom: 7px;" 
							/>
				</form>
				<section id="emptyArea">배송중인 상품이 없습니다.</section>
			</c:otherwise>
		</c:choose>


	</section>





	<jsp:include page="footer.jsp" />
	<script>
	$(document).ready(function() {
	  $('li.active').removeClass('active');
	  $('a[href="' + "admin_membership" + '"]').closest('li').addClass('active');
	});
</script>
