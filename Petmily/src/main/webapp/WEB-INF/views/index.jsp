<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Earth Admin</title>
</head>
<body>
	login test ${userMap.user_id } ${userMap.user_type } ${userMap }
	<div class="d-grid">
		<input type="button" onclick="location.href='mypageinfo'"
			value='마이페이지'>
			
			<p>${userMap.user_id }님 환영합니다</p>
	</div>

</body>
</html>