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
						<td><a href= "/product/detail/${p.prod_num}" >${p.prod_num}</a></td>
						<td>${p.prod_title}</td>
						<td>${p.prod_name}</td>
						<td>${p.prod_price}</td>
						<td>${p.prod_content}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>