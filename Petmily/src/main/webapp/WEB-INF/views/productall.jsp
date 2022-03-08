<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />

<!-- Section-->
<section>
	<div class="container px-5 px-lg-5 mt-5">
		<div class="row gx-5 gx-lg-5 row-cols-5 row-cols-md-5 row-cols-xl-5 justify-content-center">
			<c:forEach items="${product}" var="p">
				<div class="col mb-5">
					<div class="card h-100">
						<!-- Product image-->
						<img class="card-img-top" src="https://dummyimage.com/300x300/dee2e6/6c757d.jpg" alt="..." />
						<!-- Product details-->
						<div class="card-body p-3">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">${p.prod_name}</h5>
								<!-- Product price-->
								<span class="text-muted text-decoration-line-through">${p.prod_price}</span>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center card-footer" >
							<button class="btn.btn-primary">
								<a class="btn btn-secondary-outline mt-auto" href="/product/detail/${p.prod_num}">구경하기</a>
							</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- footer include -->
<jsp:include page="footer.jsp" />


<%-- 
<div>
	<table>
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품제목</th>
				<th>상품이름</th>
				<th>상품가격</th>
				<th>상품내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${product}" var="p">
				<tr>
					<td><a href="/product/detail/${p.prod_num}">${p.prod_num}</a></td>
					<td>${p.prod_title}</td>
					<td>${p.prod_name}</td>
					<td>${p.prod_price}</td>
					<td>${p.prod_content}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div> --%>