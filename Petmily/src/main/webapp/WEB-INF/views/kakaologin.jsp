<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<!-- 카카오 로그인 -->
	<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=0769abb1b3231bc6b1c8297a91e4216c&redirect_uri=http://localhost:8080/kakaoLogin&response_type=code">
	<!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정하세요 -->
	<!-- 저는 redirect_uri을 http://localhost:8080/member/kakaoLogin로 했습니다. -->
	<!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
		카카오로그인 
      		<!-- 이미지는 카카오 개발자센터에서 제공하는 login 이미지를 사용했습니다. -->
	</a>
</body>
</html>