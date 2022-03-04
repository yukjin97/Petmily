<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
		<h5 class='title'>회원 가입</h5>
		<form id='form' action="join" method="post">
			<div class="input-group mb-2">
				<span class="input-group-text title">이름</span> <input type="text"
					class="form-control" id="name" name="user_name"><br>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">아이디</span> <input type="text"
					class="form-control" id="id" name="user_id">
				<button type="button" class="btn btn-info" id="useridoverlap">중복</button>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">비밀번호</span> <input
					type="password" class="form-control" id="password" name="user_pwd">
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">비밀번호 확인</span> <input
					type="password" class="form-control" id="password2"
					name="password2">
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">닉네임</span> <input type="text"
					class="form-control" id="nickname" name="user_nickname">
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">도로명 주소</span> <input
					type="text" class="form-control" id="address1" name="user_address1">
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">지번 주소</span> <input type="text"
					class="form-control" id="address2" name="user_address2">
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">우편번호</span> <input type="text"
					class="form-control" id="zipcode" name="user_zipcode">
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">이메일</span> <input type="text"
					class="form-control" id="email" name="user_email">
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text title">전화번호</span> <input type="text"
					class="form-control" id="phone" name="user_phone">
			</div>
			<div class="d-grid">
				<input type="submit" id="submit" class="btn btn-primary btn-block"
					value='회원가입'>
			</div>


		</form>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$(function () {
        $("#useridoverlap").click(function() {
           $.ajax({
              type:"post",
              dataType:"text",
              async:false,
              url:"http://localhost:8080/useroverlap",
              data:{id:$('#id').val()},
              success: function(data){
            	  console.log(data);
            	  if($('#id').val()==""){
            		  alert("빈칸.");  
            	  } 
            	  else if(data=='true'){
            		  alert("중복.");  
            	  }
            	  else{
            		  alert("생성가능.");  
            	  }
              }
          /*     success: function(data, textStatus) {
                 if(data=='true'|| $('#id').val()=="") {
                    Swal.fire({
                          icon: 'error',
                          title: '사용 불가능합니다.',
                          text: '다른 아이디를 적어주세요.',
                        });
                 }else {
                    Swal.fire({
                          icon: 'success',
                          title: '사용 가능합니다.',
                          text: '이어서 작성해주세요.',
                        });
                 }
              } */
           });              
        });
 })
    </script>
</body>
</html>