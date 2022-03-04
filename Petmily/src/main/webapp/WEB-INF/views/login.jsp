<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- Latest compiled and minified CSS -->
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
	<div class="container mt-3">
		<h5 class='title'>로그인</h5>
		<form id='form' action="login" method="post">
			<div class="input-group mb-2">
				<span class="input-group-text title">아이디</span> <input type="text"
					class="form-control" id="user_id" name="user_id"><br>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">비밀번호</span> <input
					type="password" class="form-control" id="user_pwd" name="user_pwd">
			</div>
			<div id="message" style="display: none;">
				<h5 style="color: red; text-align: center;">아이디 혹은 비밀번호를
					확인해주세요.</h5>
			</div>

			<div class="d-grid">
				<input type="submit" class="btn btn-primary btn-block" value='로그인'>
			</div>
		</form>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
    $(function(){
        let login = "<c:out value='${login}'/>";
        console.log(login);
        if(login=="false"){
           $('#message').show();
        }else{
           $('#message').hide();
        }
     });
    </script>
</body>
</html>