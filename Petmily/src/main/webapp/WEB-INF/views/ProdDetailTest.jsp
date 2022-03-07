<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
</head>

<script type="text/javascript">
	function add_cart(prod_num) {
		$.ajax({
			type : "post",
			async : false,
			url : "${contextPath}/cart/addProdInCart",     
			data : {
				prod_num:prod_num
				
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					('', '.');	
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 상품입니다.");	     ////
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				alert("작업을완료 했습니다");
			}
		}); 
	}
	
<div>
	<ul>
	<li><a class="buy" href="#('${product.prod_num }','${product.prod_title }','${product.prod_price}','${product.prod_name}');">구매 </a></li>
	<li><a class="cart" href="#('${product.prod_num }')">장바구니</a></li>
</ul>
</div>
