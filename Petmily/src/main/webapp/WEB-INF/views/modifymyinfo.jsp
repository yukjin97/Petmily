<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>유저 정보수정</title>
</head>
<body>
   <form id=form action="/modifymyinfo" method="post">
      현재비밀번호 <input type="password" id=password name="user_pwd" placeholder="비밀번호를 입력하세요" required><br>
         비밀번호 <input type="password" id=password2 name="user_pwd2" value=""><br>
         비밀번호확인 <input type="password" id=password_check value=""><br>
         전화번호 <input type="text" id=phone value="${user.user_phone }" name="user_phone"><br>          
         닉네임 <input type="text" id=nickname value="${user.user_nickname }" name="user_nickname" ><br>
         이메일 <input type="text" id=email  value="${user.user_email }" name="user_email" disabled><br>
   
      <input type="submit" class="btn" id=modify value="저장하기">
      <input type="button" class="btn" value="메인으로" onclick="location.href='mypageinfo'">
   </form>
      <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script>
    $('#form').submit(function() {
         let password = $('#password').val();
         if(password=='') {
            alert("현재 비밀번호를 입력하세요.");
            $('#password').focus();
            return false;
         }
         let password2 = $('#password2').val();
         if(password2=='') {
            alert("변경할 비밀번호를 입력하세요.");
            $('#password2').focus();
            return false;
         }
        
         let phone = $('#phone').val();
         if(phone=='') {
            alert("전화번호를 입력하세요.");
            $('#phone').focus();
            return false;
         }
         let email = $('#email').val();
         if(email=='') {
            alert("이메일을 입력하세요.");
            $('#email').focus();
            return false;
         }
         let password_check = $('#password_check').val();
         if(password2!=password_check){
            alert("비밀번호 확인이 일치하지 않습니다.")
            $('#password_check').focus();
            return false;
         }
     });
   </script>
</body>
</html>