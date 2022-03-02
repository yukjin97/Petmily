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
	<form action="admin_membership" method="post">
		<table border='1'>
			<tr>
				<td>이름</td>
				<td>이메일</td>
				<td>주소</td>
				<td>전화번호</td>
				<td>구독정보</td>
				<td>구독시작일</td>
			</tr>
			<tbody>
				<c:forEach items="${admin }" var="admin">
					<tr>
						<td>${admin.user_name }</td>
						<td>${admin.user_email }</td>
						<td>${admin.user_totaddress }</td>
						<td>${admin.user_phone }</td>
						<td>${admin.mem_grade }</td>
						<td>${admin.mem_start_date }</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</form>
</body>
</html>