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
	<c:when test="${admin!=null && pageInfo.listCount>0 }">
		<form action="admin_membership" method="get">
			<input type="text" id="mem_text" name="mem_text"/>
			<input type="submit" value="찾기"/>
		</form>
		<section id="listForm">
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
		</section>
		<section id="pageList">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="admin_membership?page=${pageInfo.page-1}&mem_text=${mem_text}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
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
					<a href="admin_membership?page=${pageInfo.page+1}&mem_text=${mem_text}">[다음]</a>
				</c:otherwise>
			</c:choose>
		</section>
	</c:when>	
	<c:otherwise>
		<section id="emptyArea">등록된 글이 없습니다.</section>
	</c:otherwise>
	</c:choose>
	
</body>
</html>