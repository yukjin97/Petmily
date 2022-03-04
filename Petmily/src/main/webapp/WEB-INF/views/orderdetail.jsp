<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	padding: 10%;
}
</style>
</head>
<body>
<%-- <%@ include file="../header.jsp" %> --%>
	<h1>orderview view</h1>
  <form id=form action="/orderdetail" method="get">
	<table class="table table-hover">
		<tr>
			<th>No</th>
			<th>주문자번호</th>
			<th>주문일자</th>
			<th>가격</th>
			<th>상태</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr onclick="location.href='/order/detail/${list.order_id}'">
				<td>${list.order_id}</td>
				<td>${list.uid}</td>
				<td>${list.order_date}</td>
				<td>${list.total_price}</td>
				<td>${list.order_state}</td>
			</tr>
		</c:forEach>
	</table>
	<%-- <%@ include file="../bootstrap.jsp" %> --%>
	</form>
</body>
</html>