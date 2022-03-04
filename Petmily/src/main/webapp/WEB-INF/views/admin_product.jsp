<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<c:choose>
	<c:when test="${admin_product!=null && pageInfo.listCount>0 }">
		<form action="admin_product" method="get">
			<input type="text" id="search_prod" name="search_prod"/>
			<input type="submit" value="찾기"/>
		</form>
		<section id="listForm">
		<table border='1'>
		<tr>
			<td>제목</td>
			<td>상품이름</td>
			<td>가격</td>
			<td></td>
			<td></td>
		</tr>
		<tbody>
			<c:forEach items="${admin_product }" var="admin_product">
				<tr>
					<td>${admin_product.prod_title }</td>
					<td>${admin_product.prod_name }</td>
					<td>${admin_product.prod_price }</td>
					<td><input type="button" value="수정" onclick="location.href='admin_product_modify?prod_num=${admin_product.prod_num}'"></td>
					<td><input type="button" value="삭제" onclick="location.href='admin_product_delete?prod_num=${admin_product.prod_num}'"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		</section>
		<section id="pageList">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="admin_membership?page=${pageInfo.page-1}&search_prod=${search_prod}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">[${i }]</c:when>
					<c:otherwise>
						<a href="admin_membership?page=${i}&search_prod=${search_prod}">[${i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
				<c:otherwise>
					<a href="admin_membership?page=${pageInfo.page+1}&search_prod=${search_prod}">[다음]</a>
				</c:otherwise>
			</c:choose>
		</section>
	</c:when>	
	<c:otherwise>
	<form action="admin_product" method="get">
			<input type="text" id="search_prod" name="search_prod"/>
			<input type="submit" value="찾기"/>
		</form>
		<section id="emptyArea">등록된 글이 없습니다.</section>
	</c:otherwise>
	</c:choose>
	
</body>
</html>