<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id=form action="orderdetail_test" method="post">
		    주문일자 <input type="password" id=password value="${order.order_date }" name="user_pwd" ><br>
			주문번호 <input type="password" id=password2 value="${order_num }" name="user_pwd2" ><br>
			상품명 <input type="password" id=password_check value="${prod_name }" name="user_nickname" ><br>
			주문수량 <input type="text" id=nickname value="${order_count }" name="user_nickname" ><br>
			상품가격 <input type="text" id=phone value="${prod_price }" name="user_phone"><br> 	
			주문자 <input type="text" id=phone value="${user_id }" name="user_phone"><br> 	
	
		<input type="submit" class="btn" id=modify value="저장하기">
		<input type="button" class="btn" value="메인으로" onclick="location.href='mypageinfo'">
	</form>
</body>
</html>