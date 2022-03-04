<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
.container {
	width: 400px;
}

.input-group-text {
	display: inline-block;
	width: 130px;
}

.title {
	text-align: center;
	font-weight: bold;
}
</style>
</head>
<body>
	<h2>admin</h2>

	<div>${user.user_name }${user.user_id }${user.user_phone }
		${user.user_pwd } ${user.user_nickname }</div>
		이메일 <input type="text" name="user_email" value=${user.user_email }>
		<input type="button" onclick="location.href='usermodify'"
			value='정보수정'>>
</body>
</html>